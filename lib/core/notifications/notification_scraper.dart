import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:ft_intra/core/db/app_database.dart';

class ScrapedNotification {
  final String signature;
  final String title;
  final String body;
  final String? sourceDate;

  ScrapedNotification({
    required this.signature,
    required this.title,
    required this.body,
    this.sourceDate,
  });

  @override
  String toString() => '$title | $body | $sourceDate';
}

class ScrapeResult {
  final int totalFound;
  final int newSaved;
  final int pagesFetched;
  final String? error;

  ScrapeResult({
    required this.totalFound,
    required this.newSaved,
    required this.pagesFetched,
    this.error,
  });
}

class NotificationScraper {
  final Dio _dio;

  NotificationScraper({Dio? dio}) : _dio = dio ?? Dio();

  static const _url = 'https://profile.intra.42.fr/notifications';
  static const _maxPages = 20;

  Future<List<ScrapedNotification>> fetchPage(String cookie, {int page = 1}) async {
    final resp = await _dio.get(
      '$_url?page=$page',
      options: Options(
        headers: {
          'Cookie': '_intra_42_session_production=$cookie',
          'User-Agent': 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) '
              'AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148',
          'Accept': 'text/html,application/xhtml+xml,application/xml',
        },
        followRedirects: false,
        validateStatus: (status) => status != null && status < 400,
      ),
    );

    if (resp.statusCode == 302 || resp.statusCode == 301) {
      throw CookieExpiredException();
    }

    final html = resp.data as String;

    // Detect login page (cookie expired/invalid)
    if (html.contains('id="user_login"') ||
        html.contains('name="user[login]"') ||
        html.toLowerCase().contains('<form') && html.toLowerCase().contains('password')) {
      throw CookieExpiredException();
    }

    return _parseHtml(html);
  }

  Future<ScrapeResult> scrapeAndStore(AppDatabase db, String cookie) async {
    final all = <ScrapedNotification>[];
    var pagesFetched = 0;
    String? error;

    try {
      for (var page = 1; page <= _maxPages; page++) {
        final items = await fetchPage(cookie, page: page);
        pagesFetched++;
        all.addAll(items);
        if (items.length < 25) break;
      }
    } on CookieExpiredException {
      error = 'Cookie expired. Please login again.';
    } catch (e) {
      error = e.toString();
    }

    var newCount = 0;
    for (final item in all) {
      final isNew = await db.insertNotification(
        signature: item.signature,
        title: item.title,
        body: item.body,
        sourceDate: item.sourceDate,
      );
      if (isNew) newCount++;
    }

    return ScrapeResult(
      totalFound: all.length,
      newSaved: newCount,
      pagesFetched: pagesFetched,
      error: error,
    );
  }

  List<ScrapedNotification> _parseHtml(String html) {
    final results = <ScrapedNotification>[];
    final doc = html_parser.parse(html);
    final items = doc.querySelectorAll('li.notification-item');

    for (final item in items) {
      final titleEl = item.querySelector('h4.notification--title');
      final dateEl = item.querySelector('span[data-long-date]');
      final bodyEl = item.querySelector('.notification-item--body');

      final title = titleEl?.text.trim() ?? '';
      if (title.isEmpty) continue;

      final sourceDate = dateEl?.attributes['data-long-date'];

      var body = bodyEl?.text.trim() ?? '';
      if (body.startsWith(title)) {
        body = body.substring(title.length).trim();
      }
      body = body.replaceAll(RegExp(r'\s+'), ' ');

      final sig = sha1
          .convert(utf8.encode('$title|$body|$sourceDate'))
          .toString()
          .substring(0, 16);

      results.add(ScrapedNotification(
        signature: sig,
        title: title,
        body: body,
        sourceDate: sourceDate,
      ));
    }

    return results;
  }
}

class CookieExpiredException implements Exception {
  @override
  String toString() => 'Intra session cookie expired';
}

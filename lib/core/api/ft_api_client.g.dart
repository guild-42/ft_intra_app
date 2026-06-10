// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ft_api_client.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main,avoid_redundant_argument_values

class _FtApiClient implements FtApiClient {
  _FtApiClient(this._dio, {this.baseUrl, this.errorLogger}) {
    baseUrl ??= 'https://api.intra.42.fr/v2';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<FtUser> getMe() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<FtUser>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/me',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late FtUser _value;
    try {
      _value = FtUser.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<FtCampus>> getCampuses({int pageSize = 100}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page[size]': pageSize};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<FtCampus>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/campus',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<FtCampus> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => FtCampus.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<FtUser> getUser(String login) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<FtUser>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/users/${login}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late FtUser _value;
    try {
      _value = FtUser.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<FtUser>> getUsersByIds(
    String commaSeparatedIds, {
    int pageSize = 100,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'filter[id]': commaSeparatedIds,
      r'page[size]': pageSize,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<FtUser>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/users',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<FtUser> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => FtUser.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<CursusUser>> getCursusUsers(int userId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<CursusUser>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/users/${userId}/cursus_users',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<CursusUser> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => CursusUser.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<FtLocation>> getUserLocations(
    int userId, {
    String sort = '-begin_at',
    int pageSize = 1,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'sort': sort,
      r'page[size]': pageSize,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<FtLocation>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/users/${userId}/locations',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<FtLocation> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => FtLocation.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<ProjectUser>> getProjectsUsers(
    int userId, {
    int pageSize = 100,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page[size]': pageSize};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<ProjectUser>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/users/${userId}/projects_users',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<ProjectUser> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => ProjectUser.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<FtLocation>> getCampusLocations(
    int campusId, {
    bool? active,
    int pageSize = 100,
    int page = 1,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'filter[active]': active,
      r'page[size]': pageSize,
      r'page[number]': page,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<FtLocation>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/campus/${campusId}/locations',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<FtLocation> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => FtLocation.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<FtEvent>> getCampusEvents(
    int campusId, {
    String sort = '-begin_at',
    int pageSize = 30,
    int page = 1,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'sort': sort,
      r'page[size]': pageSize,
      r'page[number]': page,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<FtEvent>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/campus/${campusId}/events',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<FtEvent> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => FtEvent.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<ScaleTeam>> getScaleTeamsAsCorrector({
    int pageSize = 100,
    int page = 1,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page[size]': pageSize,
      r'page[number]': page,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<ScaleTeam>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/me/scale_teams/as_corrector',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<ScaleTeam> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => ScaleTeam.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<ScaleTeam>> getScaleTeamsAsCorrected({
    int pageSize = 100,
    int page = 1,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page[size]': pageSize,
      r'page[number]': page,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<ScaleTeam>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/me/scale_teams/as_corrected',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<ScaleTeam> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => ScaleTeam.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<FtSlot>> getMySlots({int pageSize = 100, int page = 1}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page[size]': pageSize,
      r'page[number]': page,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<FtSlot>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/me/slots',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<FtSlot> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => FtSlot.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// dart format on

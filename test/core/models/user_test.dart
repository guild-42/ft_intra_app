import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:ft_intra/core/models/user.dart';

void main() {
  late Map<String, dynamic> json;

  setUpAll(() {
    final file = File('test/fixtures/user_response.json');
    json = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
  });

  group('U-M01: FtUser.fromJson', () {
    test('deserializes basic fields from 42 API response', () {
      final user = FtUser.fromJson(json);

      expect(user.id, 260029);
      expect(user.login, 'ssekikaw');
      expect(user.email, 'ssekikaw@student.42tokyo.jp');
      expect(user.firstName, 'Sakura');
      expect(user.lastName, 'Sekikawa');
      expect(user.displayName, 'Sakura Sekikawa');
      expect(user.correctionPoint, 3);
      expect(user.wallet, 0);
      expect(user.location, isNull);
      expect(user.isStaff, false);
      expect(user.isAlumni, false);
      expect(user.isActive, true);
      expect(user.poolMonth, 'april');
      expect(user.poolYear, '2026');
    });

    test('deserializes image with versions', () {
      final user = FtUser.fromJson(json);

      expect(user.image, isNotNull);
      expect(user.image!.link, contains('ssekikaw.jpg'));
      expect(user.image!.versions, isNotNull);
      expect(user.image!.versions!.large, contains('large_ssekikaw'));
      expect(user.image!.versions!.medium, contains('medium_ssekikaw'));
      expect(user.image!.versions!.small, contains('small_ssekikaw'));
      expect(user.image!.versions!.micro, contains('micro_ssekikaw'));
    });

    test('deserializes nested cursus_users and projects_users', () {
      final user = FtUser.fromJson(json);

      expect(user.cursusUsers, hasLength(2));
      expect(user.projectsUsers, hasLength(2));
    });
  });

  group('U-M02: CursusUser.fromJson', () {
    test('deserializes 42cursus with level, blackhole, and grade', () {
      final cursusUsers = (json['cursus_users'] as List)
          .map((e) => CursusUser.fromJson(e as Map<String, dynamic>))
          .toList();

      final main = cursusUsers.firstWhere((c) => c.cursusId == 21);
      expect(main.level, 8.12);
      expect(main.blackholedAt, '2026-07-05T00:00:00.000Z');
      expect(main.grade, isNull);
      expect(main.cursus?.name, '42cursus');
      expect(main.cursus?.slug, '42cursus');
    });

    test('deserializes Piscine cursus with end_at and grade', () {
      final cursusUsers = (json['cursus_users'] as List)
          .map((e) => CursusUser.fromJson(e as Map<String, dynamic>))
          .toList();

      final piscine = cursusUsers.firstWhere((c) => c.cursusId == 9);
      expect(piscine.level, 5.42);
      expect(piscine.blackholedAt, isNull);
      expect(piscine.grade, 'Pisciner');
      expect(piscine.endAt, isNotNull);
    });
  });

  group('U-M03: ProjectUser.fromJson', () {
    test('deserializes validated project with final_mark', () {
      final projects = (json['projects_users'] as List)
          .map((e) => ProjectUser.fromJson(e as Map<String, dynamic>))
          .toList();

      final libft = projects.firstWhere((p) => p.project.slug == '42cursus-libft');
      expect(libft.status, 'finished');
      expect(libft.validated, true);
      expect(libft.finalMark, 115);
      expect(libft.markedAt, isNotNull);
      expect(libft.project.name, 'Libft');
    });

    test('deserializes in_progress project without mark', () {
      final projects = (json['projects_users'] as List)
          .map((e) => ProjectUser.fromJson(e as Map<String, dynamic>))
          .toList();

      final printf = projects.firstWhere((p) => p.project.slug == '42cursus-ft_printf');
      expect(printf.status, 'in_progress');
      expect(printf.validated, false);
      expect(printf.finalMark, isNull);
      expect(printf.markedAt, isNull);
      expect(printf.project.name, 'ft_printf');
    });
  });
}

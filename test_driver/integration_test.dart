import 'dart:io';

import 'package:integration_test/integration_test_driver_extended.dart';

/// Driver for screenshot capture. Saves each takeScreenshot() to app/screenshots/.
Future<void> main() => integrationDriver(
      onScreenshot: (String name, List<int> bytes, [Map<String, Object?>? args]) async {
        final file = File('screenshots/$name.png');
        await file.create(recursive: true);
        await file.writeAsBytes(bytes);
        return true;
      },
    );

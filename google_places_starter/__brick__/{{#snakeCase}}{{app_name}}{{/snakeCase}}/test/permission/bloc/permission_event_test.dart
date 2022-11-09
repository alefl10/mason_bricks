// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:{{app_name.snakeCase()}}/permission/permission.dart';

void main() {
  group('PermissionEvent', () {
    group('PermissionLocationRequested', () {
      test('supports value comparison', () {
        expect(PermissionLocationRequested(), PermissionLocationRequested());
      });
    });

    group('PermissionSettingsOpened', () {
      test('supports value comparison', () {
        expect(PermissionSettingsOpened(), PermissionSettingsOpened());
      });
    });
  });
}

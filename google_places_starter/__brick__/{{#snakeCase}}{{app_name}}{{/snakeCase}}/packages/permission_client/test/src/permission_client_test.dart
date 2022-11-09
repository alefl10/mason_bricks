// ignore_for_file: prefer_const_constructors
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:permission_client/permission_client.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('PermissionClient', () {
    late List<MethodCall> calls;
    late PermissionClient permissionClient;

    setUp(() {
      permissionClient = PermissionClient();
      calls = [];
      MethodChannel('flutter.baseflow.com/permissions/methods')
          .setMockMethodCallHandler((call) async {
        calls.add(call);
        if (call.method == 'checkPermissionStatus') {
          return PermissionStatus.granted.index;
        } else if (call.method == 'requestPermissions') {
          return {
            for (final key in call.arguments as List<Object?>)
              key: PermissionStatus.granted.index,
          };
        } else if (call.method == 'openAppSettings') {
          return true;
        }
        return null;
      });
    });

    test('can be instantiated', () {
      expect(PermissionClient(), isNotNull);
    });

    group('requestLocation', () {
      test('calls correct method', () async {
        await permissionClient.requestLocation();
        expect(
          calls,
          contains(
            isA<MethodCall>()
                .having((c) => c.method, 'method', 'requestPermissions')
                .having(
                  (c) => c.arguments,
                  'arguments',
                  contains(Permission.location.value),
                ),
          ),
        );
      });
    });

    group('openPermissionSettings', () {
      test('calls correct method', () async {
        await permissionClient.openPermissionSettings();
        expect(
          calls,
          contains(
            isA<MethodCall>()
                .having((c) => c.method, 'method', 'openAppSettings'),
          ),
        );
      });
    });
  });
}

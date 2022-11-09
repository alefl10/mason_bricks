// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_client/permission_client.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:{{app_name.snakeCase()}}/permission/permission.dart';

class _MockPermissionClient extends Mock implements PermissionClient {}

void main() {
  group('PermissionBloc', () {
    late PermissionClient permissionClient;

    setUp(() {
      permissionClient = _MockPermissionClient();
    });

    PermissionBloc buildBloc() => PermissionBloc(
          permissionClient: permissionClient,
        );

    test('has correct initial state', () {
      expect(buildBloc().state, PermissionState());
    });

    group('PermissionLocationRequested', () {
      blocTest<PermissionBloc, PermissionState>(
        'emits state with expected locationPermissionStatus '
        'on requestLocation.',
        setUp: () {
          when(
            () => permissionClient.requestLocation(),
          ).thenAnswer((_) async => PermissionStatus.granted);
        },
        build: buildBloc,
        act: (bloc) => bloc.add(PermissionLocationRequested()),
        expect: () => const <PermissionState>[
          PermissionState(locationPermissionStatus: PermissionStatus.granted),
        ],
      );
    });

    group('PermissionSettingsOpened', () {
      blocTest<PermissionBloc, PermissionState>(
        'emits state with expected didOpenSettings on openPermissionSettings.',
        setUp: () {
          when(
            () => permissionClient.openPermissionSettings(),
          ).thenAnswer((_) async => true);
        },
        build: buildBloc,
        act: (bloc) => bloc.add(PermissionSettingsOpened()),
        expect: () => const <PermissionState>[
          PermissionState(didOpenSettings: true),
        ],
      );
    });
  });
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_client/geolocator_client.dart';
import 'package:mocktail/mocktail.dart';

class FakePosition extends Fake implements Position {}

Future<Position> _getCurrentPosition({
  LocationAccuracy desiredAccuracy = LocationAccuracy.best,
  bool forceAndroidLocationManager = false,
  Duration? timeLimit,
}) async =>
    FakePosition();

double _getDistanceBetweenPositions(
  double startLatitude,
  double startLongitude,
  double endLatitude,
  double endLongitude,
) =>
    0;

Future<Position> _permissionDeniedExceptionThrower({
  LocationAccuracy desiredAccuracy = LocationAccuracy.best,
  bool forceAndroidLocationManager = false,
  Duration? timeLimit,
}) async =>
    throw PermissionDeniedException('');

Future<Position> _locationServiceDisabledExceptionThrower({
  LocationAccuracy desiredAccuracy = LocationAccuracy.best,
  bool forceAndroidLocationManager = false,
  Duration? timeLimit,
}) async =>
    throw LocationServiceDisabledException();

Future<Position> _exceptionThrower({
  LocationAccuracy desiredAccuracy = LocationAccuracy.best,
  bool forceAndroidLocationManager = false,
  Duration? timeLimit,
}) async =>
    throw Exception();

void main() {
  group('GeolocatorClient', () {
    final geolocatorClient = GeolocatorClient(
      getCurrentPosition: _getCurrentPosition,
      getDistanceBetweenPositions: _getDistanceBetweenPositions,
    );

    setUpAll(() {
      registerFallbackValue(FakePosition());
    });

    test('can be instantiated', () {
      expect(GeolocatorClient(), isNotNull);
    });

    group('getCurrentPosition', () {
      test('returns current position', () async {
        expect(
          geolocatorClient.getCurrentPosition(),
          completion(isA<Position>()),
        );
      });

      test(
        'throws GeolocatorClientLocationDisabledException on '
        'PermissionDeniedException',
        () async {
          final geolocatorClientWithThrower = GeolocatorClient(
            getCurrentPosition: _permissionDeniedExceptionThrower,
          );

          expect(
            geolocatorClientWithThrower.getCurrentPosition,
            throwsA(isA<GeolocatorClientLocationDisabledException>()),
          );
        },
      );

      test(
        'throws GeolocatorClientLocationDisabledException on '
        'LocationServiceDisabledException',
        () async {
          final geolocatorClientWithThrower = GeolocatorClient(
            getCurrentPosition: _locationServiceDisabledExceptionThrower,
          );

          expect(
            geolocatorClientWithThrower.getCurrentPosition,
            throwsA(isA<GeolocatorClientLocationDisabledException>()),
          );
        },
      );

      test('throws GeolocatorClientException on Exception', () async {
        final geolocatorClientWithThrower = GeolocatorClient(
          getCurrentPosition: _exceptionThrower,
        );

        expect(
          geolocatorClientWithThrower.getCurrentPosition,
          throwsA(isA<GeolocatorClientException>()),
        );
      });
    });

    group('distanceBetweenPositions', () {
      test('returns distance between positions', () async {
        expect(
          geolocatorClient.distanceBetweenPositions(
            startLatitude: 0,
            startLongitude: 0,
            endLatitude: 0,
            endLongitude: 0,
          ),
          0,
        );
      });
    });
  });
}

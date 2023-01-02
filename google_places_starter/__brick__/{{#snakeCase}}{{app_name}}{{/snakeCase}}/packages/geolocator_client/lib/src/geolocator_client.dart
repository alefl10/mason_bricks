import 'dart:async';

import 'package:geolocator/geolocator.dart';

/// Signature for [Geolocator.getCurrentPosition].
typedef GetCurrentPosition = Future<Position> Function({
  LocationAccuracy desiredAccuracy,
  bool forceAndroidLocationManager,
  Duration? timeLimit,
});

/// Signature for [Geolocator.distanceBetween].
typedef GetDistanceBetweenPositions = double Function(
  double startLatitude,
  double startLongitude,
  double endLatitude,
  double endLongitude,
);

/// {@template geolocator_client}
/// Wrapper class around [Geolocator] to expose fully testable methods.
/// {@endtemplate}
class GeolocatorClient {
  /// {@macro geolocator_client}
  const GeolocatorClient({
    GetCurrentPosition? getCurrentPosition,
    GetDistanceBetweenPositions? getDistanceBetweenPositions,
  })  : _getCurrentPosition =
            getCurrentPosition ?? Geolocator.getCurrentPosition,
        _getDistanceBetweenPositions =
            getDistanceBetweenPositions ?? Geolocator.distanceBetween;

  final GetCurrentPosition _getCurrentPosition;
  final GetDistanceBetweenPositions _getDistanceBetweenPositions;

  /// Returns the current position taking the supplied [desiredAccuracy]
  /// into account.
  ///
  /// You can control the precision of the location updates by supplying the
  /// [desiredAccuracy] parameter (defaults to "best"). On Android you can
  /// force the use of the Android LocationManager instead of the
  /// FusedLocationProvider by setting the [forceAndroidLocationManager]
  /// parameter to true. The [timeLimit] parameter allows you to specify a
  /// timeout interval (by default no time limit is configured).
  ///
  /// Throws a [GeolocatorClientLocationDisabledException] on
  /// [PermissionDeniedException] or [LocationServiceDisabledException], and
  /// a [GeolocatorClientException] on any other exceptions.
  Future<Position> getCurrentPosition({
    LocationAccuracy desiredAccuracy = LocationAccuracy.best,
    bool forceAndroidLocationManager = false,
    Duration? timeLimit,
  }) async {
    try {
      return await _getCurrentPosition();
    } on PermissionDeniedException catch (error, stackTrace) {
      Error.throwWithStackTrace(
        GeolocatorClientLocationDisabledException(error),
        stackTrace,
      );
    } on LocationServiceDisabledException catch (error, stackTrace) {
      Error.throwWithStackTrace(
        GeolocatorClientLocationDisabledException(error),
        stackTrace,
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GeolocatorClientException(error), stackTrace);
    }
  }

  /// Calculates the distance between the supplied coordinates in meters.
  /// The distance between the coordinates is calculated using the Haversine
  /// formula (see https://en.wikipedia.org/wiki/Haversine_formula).
  ///
  /// The supplied coordinates [startLatitude], [startLongitude], [endLatitude]
  /// and [endLongitude] should be supplied in degrees.
  double distanceBetweenPositions({
    required double startLatitude,
    required double startLongitude,
    required double endLatitude,
    required double endLongitude,
  }) {
    return _getDistanceBetweenPositions(
      startLatitude,
      startLongitude,
      endLatitude,
      endLongitude,
    );
  }
}

/// {@template geolocator_client_exception}
/// Exception thrown when a [GeolocatorClient] method throws an Exception.
/// {@endtemplate}
class GeolocatorClientException implements Exception {
  /// {@macro geolocator_client_exception}
  const GeolocatorClientException(this.error);

  /// Error object.
  final Object error;
}

/// {@template geolocator_client_location_disabled_exception}
/// Exception thrown when a [GeolocatorClient] method throws a
/// [PermissionDeniedException] or [LocationServiceDisabledException].
/// {@endtemplate}
class GeolocatorClientLocationDisabledException implements Exception {
  /// {@macro geolocator_client_location_disabled_exception}
  const GeolocatorClientLocationDisabledException(this.error);

  /// Error object.
  final Object error;
}

import 'package:permission_handler/permission_handler.dart';

/// {@template permission_client}
/// Client implementation to handle on-device permission requests.
/// {@endtemplate}
class PermissionClient {
  /// {@macro permission_client}
  const PermissionClient();

  /// Request access to the device's location if it wasn't previously requested.
  Future<PermissionStatus> requestLocation() => Permission.location.request();

  /// Attempts to open the device's settings.
  ///
  /// Returns true if the settings could be opened, otherwise false
  Future<bool> openPermissionSettings() => openAppSettings();
}

part of 'permission_bloc.dart';

@immutable
class PermissionState extends Equatable {
  const PermissionState({this.locationPermissionStatus, this.didOpenSettings});

  final PermissionStatus? locationPermissionStatus;
  final bool? didOpenSettings;

  @override
  List<Object?> get props => [locationPermissionStatus, didOpenSettings];

  PermissionState copyWith({
    PermissionStatus? locationPermissionStatus,
    bool? didOpenSettings,
  }) {
    return PermissionState(
      locationPermissionStatus:
          locationPermissionStatus ?? this.locationPermissionStatus,
      didOpenSettings: didOpenSettings ?? this.didOpenSettings,
    );
  }
}

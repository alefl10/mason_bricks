part of 'permission_bloc.dart';

abstract class PermissionEvent extends Equatable {
  const PermissionEvent();
}

class PermissionLocationRequested extends PermissionEvent {
  const PermissionLocationRequested();

  @override
  List<Object> get props => [];
}

class PermissionSettingsOpened extends PermissionEvent {
  const PermissionSettingsOpened();

  @override
  List<Object> get props => [];
}

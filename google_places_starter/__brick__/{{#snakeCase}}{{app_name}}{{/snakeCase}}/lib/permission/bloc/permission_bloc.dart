import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_client/permission_client.dart';
import 'package:permission_handler/permission_handler.dart';

part 'permission_event.dart';
part 'permission_state.dart';

class PermissionBloc extends Bloc<PermissionEvent, PermissionState> {
  PermissionBloc({
    required PermissionClient permissionClient,
  })  : _permissionClient = permissionClient,
        super(const PermissionState()) {
    on<PermissionLocationRequested>(_locationPermissionRequested);
    on<PermissionSettingsOpened>(_settingsOpened);
  }

  final PermissionClient _permissionClient;

  FutureOr<void> _locationPermissionRequested(
    PermissionLocationRequested event,
    Emitter<PermissionState> emit,
  ) async {
    final locationPermissionStatus = await _permissionClient.requestLocation();
    emit(state.copyWith(locationPermissionStatus: locationPermissionStatus));
  }

  FutureOr<void> _settingsOpened(
    PermissionSettingsOpened event,
    Emitter<PermissionState> emit,
  ) async {
    final didOpenSettings = await _permissionClient.openPermissionSettings();
    emit(state.copyWith(didOpenSettings: didOpenSettings));
  }
}

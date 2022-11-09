import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_places_repo/google_places_repo.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_client/permission_client.dart';
import 'package:{{app_name.snakeCase()}}/l10n/l10n.dart';

class MockPermissionClient extends Mock implements PermissionClient {}

class MockGooglePlacesRepo extends Mock implements GooglePlacesRepo {}

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    PermissionClient? permissionClient,
    GooglePlacesRepo? googlePlacesRepo,
  }) {
    return pumpWidget(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(
            value: permissionClient ?? MockPermissionClient(),
          ),
          RepositoryProvider.value(
            value: googlePlacesRepo ?? MockGooglePlacesRepo(),
          ),
        ],
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: widget,
        ),
      ),
    );
  }
}

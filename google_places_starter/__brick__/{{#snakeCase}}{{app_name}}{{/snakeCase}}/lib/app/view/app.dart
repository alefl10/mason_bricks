import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_places_repo/google_places_repo.dart';
import 'package:permission_client/permission_client.dart';
import 'package:{{app_name.snakeCase()}}/home/home.dart';
import 'package:{{app_name.snakeCase()}}/l10n/l10n.dart';
import 'package:{{app_name.snakeCase()}}/permission/permission.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required PermissionClient permissionClient,
    required GooglePlacesRepo googlePlacesRepo,
  })  : _permissionClient = permissionClient,
        _googlePlacesRepo = googlePlacesRepo;

  final PermissionClient _permissionClient;
  final GooglePlacesRepo _googlePlacesRepo;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _permissionClient),
        RepositoryProvider.value(value: _googlePlacesRepo),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PermissionBloc(
              permissionClient: _permissionClient,
            ),
            lazy: false,
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}

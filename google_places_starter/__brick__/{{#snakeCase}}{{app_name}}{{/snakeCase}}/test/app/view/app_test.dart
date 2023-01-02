import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator_client/geolocator_client.dart';
import 'package:google_places_repo/google_places_repo.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_client/permission_client.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:{{app_name.snakeCase()}}/app/view/app.dart';
import 'package:{{app_name.snakeCase()}}/home/home.dart';

import '../../helpers/helpers.dart';

void main() {
  group('App', () {
    late GooglePlacesRepo googlePlacesRepo;
    late PermissionClient permissionClient;
    late GeolocatorClient geolocatorClient;

    setUp(() {
      googlePlacesRepo = MockGooglePlacesRepo();
      permissionClient = MockPermissionClient();
      geolocatorClient = MockGeolocatorClient();
      when(
        () => permissionClient.requestLocation(),
      ).thenAnswer((_) async => PermissionStatus.granted);
    });

    testWidgets('renders HomePage on started App', (tester) async {
      await tester.pumpApp(
        App(
          permissionClient: permissionClient,
          geolocatorClient: geolocatorClient,
          googlePlacesRepo: googlePlacesRepo,
        ),
      );
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}

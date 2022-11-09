import 'package:google_places_client/google_places_client.dart';
import 'package:google_places_models/google_places_models.dart';
import 'package:google_places_repo/google_places_repo.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class _MockGooglePlacesClient extends Mock implements GooglePlacesClient {}

class _FakeGeometry extends Fake implements Geometry {}

void main() {
  group('GooglePlacesRepo', () {
    late GooglePlacesClient googlePlacesClient;
    late GooglePlacesRepo googlePlacesRepo;

    setUp(() {
      googlePlacesClient = _MockGooglePlacesClient();
      googlePlacesRepo = GooglePlacesRepo(client: googlePlacesClient);
    });

    test('can be instantiated', () {
      expect(GooglePlacesRepo(client: googlePlacesClient), isNotNull);
    });

    group('getPlaceDetails', () {
      test('throws PlaceDetailsException on any exception', () async {
        when(
          () => googlePlacesClient.getPlaceDetails(
            placeId: any(named: 'placeId'),
          ),
        ).thenThrow(Exception());

        expect(
          () => googlePlacesRepo.getPlaceDetails(placeId: 'placeId'),
          throwsA(isA<PlaceDetailsException>()),
        );
      });

      test('returns expected GooglePlace', () async {
        when(
          () => googlePlacesClient.getPlaceDetails(
            placeId: any(named: 'placeId'),
          ),
        ).thenAnswer((_) async => const GooglePlace());

        expect(
          googlePlacesRepo.getPlaceDetails(placeId: 'placeId'),
          completion(isA<GooglePlace>()),
        );
      });
    });

    group('findPlaceFromText', () {
      test('throws FindPlaceFromTextException on any exception', () async {
        when(
          () => googlePlacesClient.findPlaceFromText(
            input: any(named: 'input'),
          ),
        ).thenThrow(Exception());

        expect(
          () => googlePlacesRepo.findPlaceFromText(input: 'input'),
          throwsA(isA<FindPlaceFromTextException>()),
        );
      });

      test('returns expected GooglePlaces', () async {
        when(
          () => googlePlacesClient.findPlaceFromText(
            input: any(named: 'input'),
          ),
        ).thenAnswer((_) async => const [GooglePlace()]);

        expect(
          googlePlacesRepo.findPlaceFromText(input: 'input'),
          completion(isA<List<GooglePlace>>()),
        );
      });
    });

    group('nearbySearch', () {
      setUpAll(() {
        registerFallbackValue(_FakeGeometry());
      });

      test('throws NearbySearchException on any exception', () async {
        when(
          () => googlePlacesClient.nearbySearch(
            keyword: any(named: 'keyword'),
            location: any(named: 'location'),
          ),
        ).thenThrow(Exception());

        expect(
          () => googlePlacesRepo.nearbySearch(
            keyword: '',
            location: const Geometry(lat: 1, lng: 1),
          ),
          throwsA(isA<NearbySearchException>()),
        );
      });

      test('returns expected GooglePlace', () async {
        when(
          () => googlePlacesClient.nearbySearch(
            keyword: any(named: 'keyword'),
            location: any(named: 'location'),
          ),
        ).thenAnswer((_) async => const [GooglePlace()]);

        expect(
          googlePlacesRepo.nearbySearch(
            keyword: '',
            location: const Geometry(lat: 1, lng: 1),
          ),
          completion(isA<List<GooglePlace>>()),
        );
      });
    });

    group('getPlacePhotoUrl', () {
      test('returns expected string', () {
        const expectedString = 'photoUrl';
        when(
          () => googlePlacesClient.getPlacePhotoUrl(
            photoReference: any(named: 'photoReference'),
          ),
        ).thenReturn(expectedString);

        expect(
          googlePlacesRepo.getPlacePhotoUrl(photoReference: 'ref'),
          expectedString,
        );
      });
    });
  });
}

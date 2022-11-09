import 'dart:convert';

import 'package:google_places_client/google_places_client.dart';
import 'package:google_places_models/google_places_models.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class _MockHttpClient extends Mock implements http.Client {}

class _FakeUri extends Fake implements Uri {}

class _FakeHeaders extends Fake implements Map<String, String> {}

void main() {
  group('GooglePlacesClient', () {
    const apiKey = 'apiKey';
    const locale = 'en';
    late http.Client httpClient;
    late GooglePlacesClient googlePlacesClient;

    setUp(() {
      httpClient = _MockHttpClient();
      googlePlacesClient = GooglePlacesClient(
        apiKey: apiKey,
        client: httpClient,
        locale: locale,
      );
    });

    setUpAll(() {
      registerFallbackValue(_FakeUri());
      registerFallbackValue(_FakeHeaders());
    });

    test('can be initialized without optional dependencies', () {
      expect(GooglePlacesClient(apiKey: apiKey), isNot(throwsException));
    });

    group('getPlaceDetails', () {
      group('throws', () {
        test(
          'PlaceDetailsException with status and errorMessage if '
          'PlacesSearchStatus is not ok OR zeroResults',
          () async {
            const invalidPlaceDetailsResponse = PlaceDetailsResponse(
              result: GooglePlace(),
              status: PlacesSearchStatus.invalidRequest,
              errorMessage: 'invalidRequest',
            );
            final invalidResponse = http.Response(
              jsonEncode(invalidPlaceDetailsResponse.toJson()),
              200,
            );

            when(
              () => httpClient.get(any(), headers: any(named: 'headers')),
            ).thenAnswer((_) async => invalidResponse);

            expect(
              () => googlePlacesClient.getPlaceDetails(placeId: 'placeId'),
              throwsA(
                isA<PlaceDetailsException>()
                    .having(
                      (pde) => pde.status,
                      'status',
                      invalidPlaceDetailsResponse.status,
                    )
                    .having(
                      (pde) => pde.errorMessage,
                      'errorMessage',
                      invalidPlaceDetailsResponse.errorMessage,
                    ),
              ),
            );
          },
        );

        test(
          'PlaceDetailsException on any other exception',
          () async {
            when(
              () => httpClient.get(any(), headers: any(named: 'headers')),
            ).thenThrow(Exception());

            expect(
              () => googlePlacesClient.getPlaceDetails(placeId: 'placeId'),
              throwsA(isA<PlaceDetailsException>()),
            );
          },
        );
      });

      group('returns', () {
        test('expected GooglePlace when PlacesSearchStatus is ok', () async {
          const okPlaceDetailsResponse = PlaceDetailsResponse(
            result: GooglePlace(),
            status: PlacesSearchStatus.ok,
          );
          final okResponse = http.Response(
            jsonEncode(okPlaceDetailsResponse.toJson()),
            200,
          );

          when(
            () => httpClient.get(any(), headers: any(named: 'headers')),
          ).thenAnswer((_) async => okResponse);

          expect(
            googlePlacesClient.getPlaceDetails(placeId: 'placeId'),
            completion(isA<GooglePlace>()),
          );
        });

        test(
          'expected GooglePlace when PlacesSearchStatus is zeroResults',
          () async {
            const zeroResultsPlaceDetailsResponse = PlaceDetailsResponse(
              result: GooglePlace(),
              status: PlacesSearchStatus.zeroResults,
            );
            final zeroResultsResponse = http.Response(
              jsonEncode(zeroResultsPlaceDetailsResponse.toJson()),
              200,
            );

            when(
              () => httpClient.get(any(), headers: any(named: 'headers')),
            ).thenAnswer((_) async => zeroResultsResponse);

            expect(
              googlePlacesClient.getPlaceDetails(placeId: 'placeId'),
              completion(isA<GooglePlace>()),
            );
          },
        );

        test(
          'expected GooglePlace when optionals parameter are passed',
          () async {
            const okPlaceDetailsResponse = PlaceDetailsResponse(
              result: GooglePlace(),
              status: PlacesSearchStatus.ok,
            );
            final okResponse = http.Response(
              jsonEncode(okPlaceDetailsResponse.toJson()),
              200,
            );

            when(
              () => httpClient.get(any(), headers: any(named: 'headers')),
            ).thenAnswer((_) async => okResponse);

            expect(
              googlePlacesClient.getPlaceDetails(
                placeId: 'placeId',
                fields: 'type',
                language: 'es',
                region: 'region',
                reviewsNoTranslations: true,
                reviewsSort: ReviewsSort.newest,
                sessionToken: 'sessionToken',
              ),
              completion(isA<GooglePlace>()),
            );
          },
        );
      });
    });

    group('findPlaceFromText', () {
      group('throws', () {
        test(
          'FindPlaceFromTextException with status and errorMessage if '
          'PlacesSearchStatus is not ok OR zeroResults',
          () async {
            const invalidFindPlaceFromTextResponse = FindPlaceFromTextResponse(
              candidates: [GooglePlace()],
              status: PlacesSearchStatus.invalidRequest,
              errorMessage: 'invalidRequest',
            );
            final invalidResponse = http.Response(
              jsonEncode(invalidFindPlaceFromTextResponse.toJson()),
              200,
            );

            when(
              () => httpClient.get(any(), headers: any(named: 'headers')),
            ).thenAnswer((_) async => invalidResponse);

            expect(
              () => googlePlacesClient.findPlaceFromText(input: 'input'),
              throwsA(
                isA<FindPlaceFromTextException>()
                    .having(
                      (pde) => pde.status,
                      'status',
                      invalidFindPlaceFromTextResponse.status,
                    )
                    .having(
                      (pde) => pde.errorMessage,
                      'errorMessage',
                      invalidFindPlaceFromTextResponse.errorMessage,
                    ),
              ),
            );
          },
        );

        test(
          'FindPlaceFromTextException on any other exception',
          () async {
            when(
              () => httpClient.get(any(), headers: any(named: 'headers')),
            ).thenThrow(Exception());

            expect(
              () => googlePlacesClient.findPlaceFromText(input: 'input'),
              throwsA(isA<FindPlaceFromTextException>()),
            );
          },
        );
      });

      group('returns', () {
        test('expected GooglePlaces when PlacesSearchStatus is ok', () async {
          const okFindPlaceFromTextResponse = FindPlaceFromTextResponse(
            candidates: [GooglePlace()],
            status: PlacesSearchStatus.ok,
          );
          final okResponse = http.Response(
            jsonEncode(okFindPlaceFromTextResponse.toJson()),
            200,
          );

          when(
            () => httpClient.get(any(), headers: any(named: 'headers')),
          ).thenAnswer((_) async => okResponse);

          expect(
            googlePlacesClient.findPlaceFromText(input: 'input'),
            completion(isA<List<GooglePlace>>()),
          );
        });

        test(
          'expected GooglePlaces when PlacesSearchStatus is zeroResults',
          () async {
            const zeroResultsFindPlaceFromTextResponse =
                FindPlaceFromTextResponse(
              candidates: [GooglePlace()],
              status: PlacesSearchStatus.zeroResults,
            );
            final zeroResultsResponse = http.Response(
              jsonEncode(zeroResultsFindPlaceFromTextResponse.toJson()),
              200,
            );

            when(
              () => httpClient.get(any(), headers: any(named: 'headers')),
            ).thenAnswer((_) async => zeroResultsResponse);

            expect(
              googlePlacesClient.findPlaceFromText(input: 'input'),
              completion(isA<List<GooglePlace>>()),
            );
          },
        );

        test(
          'expected GooglePlace when optionals parameter are passed',
          () async {
            const okFindPlaceFromTextResponse = FindPlaceFromTextResponse(
              candidates: [GooglePlace()],
              status: PlacesSearchStatus.ok,
            );
            final okResponse = http.Response(
              jsonEncode(okFindPlaceFromTextResponse.toJson()),
              200,
            );

            when(
              () => httpClient.get(any(), headers: any(named: 'headers')),
            ).thenAnswer((_) async => okResponse);

            expect(
              googlePlacesClient.findPlaceFromText(
                input: 'input',
                fields: 'type',
                language: 'es',
                locationBias: LocationBias.ipbias,
                radius: 1,
                lat: 1,
                lng: 1,
                east: 1,
                north: 1,
                south: 1,
                west: 1,
              ),
              completion(isA<List<GooglePlace>>()),
            );
          },
        );
      });

      group('with LocationBias.point', () {
        test(
          'throws FindPlaceFromTextException when lat OR lng are null',
          () {
            expect(
              () => googlePlacesClient.findPlaceFromText(
                input: 'input',
                locationBias: LocationBias.point,
              ),
              throwsA(isA<FindPlaceFromTextException>()),
            );
          },
        );

        test(
          'returns expected GooglePlaces when lat AND lng are not null',
          () {
            const okFindPlaceFromTextResponse = FindPlaceFromTextResponse(
              candidates: [GooglePlace()],
              status: PlacesSearchStatus.ok,
            );
            final okResponse = http.Response(
              jsonEncode(okFindPlaceFromTextResponse.toJson()),
              200,
            );

            when(
              () => httpClient.get(any(), headers: any(named: 'headers')),
            ).thenAnswer((_) async => okResponse);

            expect(
              googlePlacesClient.findPlaceFromText(
                input: 'input',
                locationBias: LocationBias.point,
                lat: 1,
                lng: 1,
              ),
              completion(isA<List<GooglePlace>>()),
            );
          },
        );
      });

      group('with LocationBias.circle', () {
        test(
          'throws FindPlaceFromTextException when radius, lat OR lng are null',
          () {
            expect(
              () => googlePlacesClient.findPlaceFromText(
                input: 'input',
                locationBias: LocationBias.circle,
              ),
              throwsA(isA<FindPlaceFromTextException>()),
            );
          },
        );

        test(
          'returns expected GooglePlaces when radius AND lat AND lng are '
          'not null',
          () {
            const okFindPlaceFromTextResponse = FindPlaceFromTextResponse(
              candidates: [GooglePlace()],
              status: PlacesSearchStatus.ok,
            );
            final okResponse = http.Response(
              jsonEncode(okFindPlaceFromTextResponse.toJson()),
              200,
            );

            when(
              () => httpClient.get(any(), headers: any(named: 'headers')),
            ).thenAnswer((_) async => okResponse);

            expect(
              googlePlacesClient.findPlaceFromText(
                input: 'input',
                locationBias: LocationBias.circle,
                radius: 1,
                lat: 1,
                lng: 1,
              ),
              completion(isA<List<GooglePlace>>()),
            );
          },
        );
      });

      group('with LocationBias.rectangle', () {
        test(
          'throws FindPlaceFromTextException when south, west, north OR east '
          'are null',
          () {
            expect(
              () => googlePlacesClient.findPlaceFromText(
                input: 'input',
                locationBias: LocationBias.rectangle,
              ),
              throwsA(isA<FindPlaceFromTextException>()),
            );
          },
        );

        test(
          'returns expected GooglePlaces when when south, west, north OR east '
          'are not null',
          () {
            const okFindPlaceFromTextResponse = FindPlaceFromTextResponse(
              candidates: [GooglePlace()],
              status: PlacesSearchStatus.ok,
            );
            final okResponse = http.Response(
              jsonEncode(okFindPlaceFromTextResponse.toJson()),
              200,
            );

            when(
              () => httpClient.get(any(), headers: any(named: 'headers')),
            ).thenAnswer((_) async => okResponse);

            expect(
              googlePlacesClient.findPlaceFromText(
                input: 'input',
                locationBias: LocationBias.rectangle,
                east: 1,
                north: 1,
                south: 1,
                west: 1,
              ),
              completion(isA<List<GooglePlace>>()),
            );
          },
        );
      });
    });

    group('nearbySearch', () {
      group('throws', () {
        test(
          'NearbySearchException with status and errorMessage if '
          'PlacesSearchStatus is not ok OR zeroResults',
          () async {
            const invalidNearbySearchResponse = NearbySearchResponse(
              results: [GooglePlace()],
              status: PlacesSearchStatus.invalidRequest,
              errorMessage: 'invalidRequest',
            );
            final invalidResponse = http.Response(
              jsonEncode(invalidNearbySearchResponse.toJson()),
              200,
            );

            when(
              () => httpClient.get(any(), headers: any(named: 'headers')),
            ).thenAnswer((_) async => invalidResponse);

            expect(
              () => googlePlacesClient.nearbySearch(
                keyword: 'keyword',
                location: const Geometry(lat: 1, lng: 1),
              ),
              throwsA(
                isA<NearbySearchException>()
                    .having(
                      (pde) => pde.status,
                      'status',
                      invalidNearbySearchResponse.status,
                    )
                    .having(
                      (pde) => pde.errorMessage,
                      'errorMessage',
                      invalidNearbySearchResponse.errorMessage,
                    ),
              ),
            );
          },
        );

        test('NearbySearchException if maxPrice is not within [0, 4]', () {
          expect(
            () => googlePlacesClient.nearbySearch(
              keyword: 'keyword',
              location: const Geometry(lat: 1, lng: 1),
              maxPrice: 5,
            ),
            throwsA(isA<NearbySearchException>()),
          );
        });

        test('NearbySearchException if minPrice is not within [0, 4]', () {
          expect(
            () => googlePlacesClient.nearbySearch(
              keyword: 'keyword',
              location: const Geometry(lat: 1, lng: 1),
              minPrice: -1,
            ),
            throwsA(isA<NearbySearchException>()),
          );
        });

        test(
          'NearbySearchException on any other exception',
          () async {
            when(
              () => httpClient.get(any(), headers: any(named: 'headers')),
            ).thenThrow(Exception());

            expect(
              () => googlePlacesClient.nearbySearch(
                keyword: 'keyword',
                location: const Geometry(lat: 1, lng: 1),
              ),
              throwsA(isA<NearbySearchException>()),
            );
          },
        );
      });

      group('returns', () {
        test('expected GooglePlace when PlacesSearchStatus is ok', () async {
          const okNearbySearchResponse = NearbySearchResponse(
            results: [GooglePlace()],
            status: PlacesSearchStatus.ok,
          );
          final okResponse = http.Response(
            jsonEncode(okNearbySearchResponse.toJson()),
            200,
          );

          when(
            () => httpClient.get(any(), headers: any(named: 'headers')),
          ).thenAnswer((_) async => okResponse);

          expect(
            googlePlacesClient.nearbySearch(
              keyword: 'keyword',
              location: const Geometry(lat: 1, lng: 1),
            ),
            completion(isA<List<GooglePlace>>()),
          );
        });

        test(
          'expected GooglePlace when PlacesSearchStatus is zeroResults',
          () async {
            const zeroResultsNearbySearchResponse = NearbySearchResponse(
              results: [GooglePlace()],
              status: PlacesSearchStatus.zeroResults,
            );
            final zeroResultsResponse = http.Response(
              jsonEncode(zeroResultsNearbySearchResponse.toJson()),
              200,
            );

            when(
              () => httpClient.get(any(), headers: any(named: 'headers')),
            ).thenAnswer((_) async => zeroResultsResponse);

            expect(
              googlePlacesClient.nearbySearch(
                keyword: 'keyword',
                location: const Geometry(lat: 1, lng: 1),
              ),
              completion(isA<List<GooglePlace>>()),
            );
          },
        );

        test(
          'expected GooglePlace when optionals parameter are passed',
          () async {
            const okNearbySearchResponse = NearbySearchResponse(
              results: [GooglePlace()],
              status: PlacesSearchStatus.ok,
            );
            final okResponse = http.Response(
              jsonEncode(okNearbySearchResponse.toJson()),
              200,
            );

            when(
              () => httpClient.get(any(), headers: any(named: 'headers')),
            ).thenAnswer((_) async => okResponse);

            expect(
              googlePlacesClient.nearbySearch(
                keyword: 'keyword',
                location: const Geometry(lat: 1, lng: 1),
                language: 'es',
                radius: 1,
                rankBy: RankBy.distance,
                maxPrice: 4,
                minPrice: 0,
                openNow: true,
                pageToken: 'pageToken',
                type: 'type',
              ),
              completion(isA<List<GooglePlace>>()),
            );
          },
        );
      });
    });

    group('getPlacePhotoUrl', () {
      group('returns', () {
        test('expected expected stringified uri', () {
          const expectedUri = 'https://maps.googleapis.com/maps/api/place/photo'
              '?photo_reference=ref'
              '&maxwidth=400'
              '&key=$apiKey';
          expect(
            googlePlacesClient.getPlacePhotoUrl(photoReference: 'ref'),
            expectedUri,
          );
        });

        test(
          'expected expected stringified uri when optional params '
          'are passed',
          () {
            const maxWidth = 500;
            const minWidth = 100;
            const expectedUri =
                'https://maps.googleapis.com/maps/api/place/photo'
                '?photo_reference=ref'
                '&maxwidth=$maxWidth'
                '&key=$apiKey'
                '&minwidth=$minWidth';
            expect(
              googlePlacesClient.getPlacePhotoUrl(
                photoReference: 'ref',
                maxWidth: maxWidth,
                minWidth: minWidth,
              ),
              expectedUri,
            );
          },
        );
      });
    });
  });
}

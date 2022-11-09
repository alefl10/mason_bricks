import 'dart:convert';
import 'dart:io';

import 'package:google_places_client/google_places_client.dart';
import 'package:google_places_models/google_places_models.dart';
import 'package:http/http.dart' as http;

/// {@template google_places_client}
/// An http client implementation to interact with the Google Places API.
/// {@endtemplate}
class GooglePlacesClient {
  /// {@macro google_places_client}
  GooglePlacesClient({
    required String apiKey,
    http.Client? client,
    String? locale,
  })  : _client = client ?? http.Client(),
        _apiKey = apiKey,
        _locale = locale ?? 'en';

  /// Base [String] url to interact with the Google APIs.
  static const _baseUrl = 'maps.googleapis.com';

  /// Base [String] path to interact with the Google Places APIs.
  static const _basePath = '/maps/api/place';

  /// Google Place Details endpoint.
  static const placeDetailsPath = '$_basePath/details/json';

  /// Google Place Find Place From Text endpoint.
  static const findPlaceFromTextPath = '$_basePath/findplacefromtext/json';

  /// Google Place Nearby Search endpoint.
  static const nearbySearchPath = '$_basePath/nearbysearch/json';

  /// Google Place Photo endpoint.
  static const placePhotoPath = '$_basePath/photo';

  /// Generic headers to be used on any give http requests.
  static const _headers = {HttpHeaders.contentTypeHeader: 'application/json'};

  final http.Client _client;
  final String _apiKey;
  final String _locale;

  /// {@template get_place_details}
  /// Gets all the details for a given [GooglePlace.placeId].
  ///
  /// Once you have a [placeId] from a Place Search, you can request more
  /// details about a particular establishment or point of interest by
  /// initiating a Place Details request. A Place Details request returns more
  /// comprehensive information about the indicated place such as its complete
  /// address, phone number, user rating and reviews.
  ///
  ///  See the official docs to find out more about the other optional params -
  /// [link](https://developers.google.com/maps/documentation/places/web-service/details).
  ///
  /// Throws [PlaceDetailsException] on any given exceptions.
  /// {@endtemplate}
  Future<GooglePlace> getPlaceDetails({
    required String placeId,
    ReviewsSort? reviewsSort,
    String? fields,
    String? region,
    bool? reviewsNoTranslations,
    String? language,
    String? sessionToken,
  }) async {
    try {
      final params = {
        'place_id': placeId,
        'language': language ?? _locale,
        'key': _apiKey,
      };

      if (fields != null) params.addEntries({'fields': fields}.entries);
      if (region != null) params.addEntries({'region': region}.entries);
      if (reviewsSort != null) {
        params.addEntries({'reviews_sort': reviewsSort.toSnake}.entries);
      }
      if (reviewsNoTranslations != null) {
        params.addEntries(
          {'reviews_no_translations': '$reviewsNoTranslations'}.entries,
        );
      }

      final uri = Uri.https(_baseUrl, placeDetailsPath, params);
      final response = await _client.get(uri, headers: _headers);
      final parsedResponse = jsonDecode(response.body) as Map<String, dynamic>;
      final placeDetailsResponse = PlaceDetailsResponse.fromJson(
        parsedResponse,
      );

      if (placeDetailsResponse.status == PlacesSearchStatus.ok ||
          placeDetailsResponse.status == PlacesSearchStatus.zeroResults) {
        final googlePlace = placeDetailsResponse.result;
        return googlePlace;
      } else {
        throw PlaceDetailsException(
          status: placeDetailsResponse.status,
          errorMessage: placeDetailsResponse.errorMessage,
        );
      }
    } on PlaceDetailsException catch (_) {
      rethrow;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        PlaceDetailsException(error: error),
        stackTrace,
      );
    }
  }

  /// {@template find_place_from_text}
  /// Gets a [GooglePlace] that matches the provided [input].
  ///
  /// A Find Place request takes a text input and returns a place.
  /// The input can be any kind of Places text data, such as a name, address,
  /// or phone number. The request must be a string.
  /// A Find Place request using non-string data such as a lat/lng coordinate
  /// or plus code generates an error.
  ///
  /// See the official docs to find out more about the other optional params -
  /// [link](https://developers.google.com/maps/documentation/places/web-service/search-find-place).
  ///
  /// Throws [FindPlaceFromTextException] on any given exceptions.
  /// {@endtemplate}
  Future<List<GooglePlace>> findPlaceFromText({
    required String input,
    String? fields,
    String? language,
    LocationBias? locationBias,
    double? lat,
    double? lng,
    int? radius,
    double? south,
    double? west,
    double? north,
    double? east,
  }) async {
    try {
      assert(
        locationBias != LocationBias.point || lat != null && lng != null,
        'lat AND lng cannot be null if locationBias is LocationBias.point ',
      );
      assert(
        locationBias != LocationBias.circle ||
            radius != null && lat != null && lng != null,
        'radius AND lat AND lng cannot be null if locationBias is '
        'LocationBias.circle',
      );
      assert(
        locationBias != LocationBias.rectangle ||
            south != null && west != null && north != null && east != null,
        'south AND west AND north AND east cannot be null if locationBias is '
        'LocationBias.rectangle',
      );

      final params = {
        'input': input,
        'inputtype': 'textquery',
        'key': _apiKey,
        'language': _locale,
      };

      if (fields != null) params.addEntries({'fields': fields}.entries);

      switch (locationBias) {
        case LocationBias.ipbias:
          params.addEntries({'locationbias': 'ipbias'}.entries);
          break;
        case LocationBias.point:
          params.addEntries({'locationbias': 'point:$lat,$lng'}.entries);
          break;
        case LocationBias.circle:
          params
              .addEntries({'locationbias': 'circle:$radius@$lat,$lng'}.entries);
          break;
        case LocationBias.rectangle:
          params.addEntries(
            {'locationbias': 'rectangle:$south,$west$north,$east'}.entries,
          );
          break;
        case null:
          break;
      }

      final uri = Uri.https(_baseUrl, findPlaceFromTextPath, params);
      final response = await _client.get(uri, headers: _headers);
      final parsedResponse = jsonDecode(response.body) as Map<String, dynamic>;
      final findPlaceFromTextResponse = FindPlaceFromTextResponse.fromJson(
        parsedResponse,
      );

      if (findPlaceFromTextResponse.status == PlacesSearchStatus.ok ||
          findPlaceFromTextResponse.status == PlacesSearchStatus.zeroResults) {
        final googlePlaces = findPlaceFromTextResponse.candidates;
        return googlePlaces;
      } else {
        throw FindPlaceFromTextException(
          status: findPlaceFromTextResponse.status,
          errorMessage: findPlaceFromTextResponse.errorMessage,
        );
      }
    } on FindPlaceFromTextException catch (_) {
      rethrow;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        FindPlaceFromTextException(error: error),
        stackTrace,
      );
    }
  }

  /// {@template nearby_search}
  /// A Nearby Search lets you search for a list of [GooglePlace] within a
  /// specified [radius] with respect to a current [location] for a
  /// given [keyword].
  ///
  /// See the official docs to find out more about the other optional params -
  /// [link](https://developers.google.com/maps/documentation/places/web-service/search-nearby).
  ///
  /// Throws [NearbySearchException] on any given exceptions.
  /// {@endtemplate}
  Future<List<GooglePlace>> nearbySearch({
    required String keyword,
    required Geometry location,
    int? radius,
    RankBy? rankBy,
    String? type,
    bool? openNow,
    int? maxPrice,
    int? minPrice,
    String? language,
    String? pageToken,
  }) async {
    assert(
      maxPrice == null || maxPrice >= 0 && maxPrice <= 4,
      'The int values for maxPrice must be between [0, 4]',
    );
    assert(
      minPrice == null || minPrice >= 0 && minPrice <= 4,
      'The int values for maxPrice must be between [0, 4]',
    );
    try {
      final params = <String, String>{
        'keyword': keyword,
        'location': '${location.lat} ${location.lng}',
        'language': language ?? _locale,
        'key': _apiKey,
      };

      if (radius != null) params.addEntries({'radius': '$radius'}.entries);
      if (type != null) params.addEntries({'type': type}.entries);
      if (rankBy != null) params.addEntries({'rankby': rankBy.name}.entries);
      if (openNow != null) params.addEntries({'opennow': '$openNow'}.entries);
      if (maxPrice != null) {
        params.addEntries({'maxprice': '$maxPrice'}.entries);
      }
      if (minPrice != null) {
        params.addEntries({'minprice': '$maxPrice'}.entries);
      }
      if (pageToken != null) {
        params.addEntries({'pagetoken': pageToken}.entries);
      }

      final uri = Uri.https(_baseUrl, nearbySearchPath, params);
      final response = await _client.get(uri, headers: _headers);
      final parsedResponse = jsonDecode(response.body) as Map<String, dynamic>;
      final nearbySearchResponse = NearbySearchResponse.fromJson(
        parsedResponse,
      );

      if (nearbySearchResponse.status == PlacesSearchStatus.ok ||
          nearbySearchResponse.status == PlacesSearchStatus.zeroResults) {
        final googlePlaces = nearbySearchResponse.results;
        return googlePlaces;
      } else {
        throw NearbySearchException(
          status: nearbySearchResponse.status,
          errorMessage: nearbySearchResponse.errorMessage,
        );
      }
    } on NearbySearchException catch (_) {
      rethrow;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        NearbySearchException(error: error),
        stackTrace,
      );
    }
  }

  /// {@template get_place_photo_url}
  /// Returns a stringified URL to retrieve a give [PlacePhoto] based on the
  /// provided [photoReference].
  ///
  /// The Place Photo service, part of the Places API, is a read- only API that
  /// allows you to add high quality photographic content to your application.
  /// The Place Photo service gives you access to the millions of photos stored
  /// in the Places database. When you get place information using a
  /// Place Details request, photo references will be returned for relevant
  /// photographic content.
  ///
  /// Using the Photo service you can then access the referenced photos and
  /// resize the image to the optimal size for your application.
  ///
  /// See the official docs to find out more about the other optional params -
  /// [link](https://developers.google.com/maps/documentation/places/web-service/photos).
  ///
  /// Throws [FindPlaceFromTextException] on any given exceptions.
  /// {@endtemplate}
  String getPlacePhotoUrl({
    required String photoReference,
    int? maxWidth,
    int? minWidth,
  }) {
    try {
      final params = {
        'photo_reference': photoReference,
        'key': _apiKey,
        'maxwidth': maxWidth != null ? '$maxWidth' : '400',
      };

      if (minWidth != null) {
        params.addEntries({'minwidth': '$minWidth'}.entries);
      }

      final uri = Uri.https(_baseUrl, placePhotoPath, params);
      return '$uri';
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(PlacePhotoException(error: error), stackTrace);
    }
  }
}

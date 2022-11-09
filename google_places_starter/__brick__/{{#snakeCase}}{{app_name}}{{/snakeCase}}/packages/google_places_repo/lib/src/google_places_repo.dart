import 'package:google_places_client/google_places_client.dart';
import 'package:google_places_models/google_places_models.dart';

/// {@template google_places_repo}
/// Repository implementation that leverages the [GooglePlacesClient] to
/// interact with the Google Places API.
/// {@endtemplate}
class GooglePlacesRepo {
  /// {@macro google_places_repo}
  const GooglePlacesRepo({required GooglePlacesClient client})
      : _client = client;

  final GooglePlacesClient _client;

  /// {@macro get_place_details}
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
      final placeDetails = await _client.getPlaceDetails(
        placeId: placeId,
        reviewsSort: reviewsSort,
        fields: fields,
        region: region,
        reviewsNoTranslations: reviewsNoTranslations,
        language: language,
        sessionToken: sessionToken,
      );
      return placeDetails;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        PlaceDetailsException(error: error),
        stackTrace,
      );
    }
  }

  /// {@macro find_place_from_text}
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
      final googlePlace = await _client.findPlaceFromText(
        input: input,
        fields: fields,
        language: language,
        locationBias: locationBias,
        lat: lat,
        lng: lng,
        radius: radius,
        south: south,
        west: west,
        north: north,
        east: east,
      );
      return googlePlace;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        FindPlaceFromTextException(error: error),
        stackTrace,
      );
    }
  }

  /// {@macro nearby_search}
  Future<List<GooglePlace>> nearbySearch({
    required String keyword,
    required Geometry location,
    String? type,
    int? radius,
    RankBy? rankBy,
    bool? openNow,
    int? maxPrice,
    int? minPrice,
    String? language,
    String? pageToken,
  }) async {
    try {
      final googlePlaces = await _client.nearbySearch(
        keyword: keyword,
        location: location,
        type: type,
        radius: radius,
        rankBy: rankBy,
        openNow: openNow,
        maxPrice: maxPrice,
        minPrice: minPrice,
        language: language,
        pageToken: pageToken,
      );
      return googlePlaces;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        NearbySearchException(error: error),
        stackTrace,
      );
    }
  }

  /// {@macro get_place_photo_url}
  String getPlacePhotoUrl({
    required String photoReference,
    int? maxWidth,
    int? minWidth,
  }) {
    try {
      return _client.getPlacePhotoUrl(
        photoReference: photoReference,
        maxWidth: maxWidth,
        minWidth: minWidth,
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(PlacePhotoException(error: error), stackTrace);
    }
  }
}

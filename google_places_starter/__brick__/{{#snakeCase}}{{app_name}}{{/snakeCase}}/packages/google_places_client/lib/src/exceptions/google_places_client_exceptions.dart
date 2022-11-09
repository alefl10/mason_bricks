import 'package:google_places_client/google_places_client.dart';
import 'package:google_places_models/google_places_models.dart';

/// {@template google_places_resource_exception}
/// Generic exception thrown by the GooglePlacesResource
/// {@endtemplate}
abstract class GooglePlacesResourceException extends HttpException {
  /// {@macro google_places_resource_exception}
  GooglePlacesResourceException({this.error});

  /// Error thrown
  final dynamic error;
}

/// {@template nearby_search_exception}
/// Exception thrown when the [PlacesSearchStatus] value included in a
/// [NearbySearchResponse] is different from 'OK'.
/// {@endtemplate}
class NearbySearchException extends GooglePlacesResourceException {
  /// {@macro nearby_search_exception}
  NearbySearchException({this.status, this.errorMessage, super.error});

  /// {@macro places_search_status}
  final PlacesSearchStatus? status;

  /// Readable error message
  final String? errorMessage;
}

/// {@template place_details_exception}
/// Exception thrown when the [PlacesSearchStatus] value included in a
/// [PlaceDetailsResponse] is different from 'OK'.
/// {@endtemplate}
class PlaceDetailsException extends GooglePlacesResourceException {
  /// {@macro place_details_exception}
  PlaceDetailsException({this.status, this.errorMessage, super.error});

  /// {@macro places_search_status}
  final PlacesSearchStatus? status;

  /// Readable error message
  final String? errorMessage;
}

/// {@template find_place_from_text_exception}
/// Exception thrown when the [PlacesSearchStatus] value included in a
/// [FindPlaceFromTextResponse] is different from 'OK'.
/// {@endtemplate}
class FindPlaceFromTextException extends GooglePlacesResourceException {
  /// {@macro find_place_from_text_exception}
  FindPlaceFromTextException({this.status, this.errorMessage, super.error});

  /// {@macro places_search_status}
  final PlacesSearchStatus? status;

  /// Readable error message
  final String? errorMessage;
}

/// {@template place_photo_exception}
/// Exception thrown when a [PlacePhoto] cannot be retrieved.
/// {@endtemplate}
class PlacePhotoException extends GooglePlacesResourceException {
  /// {@macro place_photo_exception}
  PlacePhotoException({super.error});
}

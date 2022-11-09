import 'package:google_places_models/google_places_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'nearby_search_response.g.dart';

/// {@template nearby_search_response}
/// Response object returned from the Google Places API after executing a
/// NearbySearch request.
///
/// [Official docs](https://developers.google.com/maps/documentation/places/web-service/search-nearby)
/// {@endtemplate}
@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class NearbySearchResponse extends GooglePlacesResponse {
  /// {@macro nearby_search_response}
  const NearbySearchResponse({
    super.htmlAttributions,
    required this.results,
    required super.status,
    super.errorMessage,
    super.infoMessages,
    super.nextPageToken,
  });

  /// Converts the [Map<String, dynamic>] to [NearbySearchResponse]
  factory NearbySearchResponse.fromJson(Map<String, dynamic> json) {
    return _$NearbySearchResponseFromJson(json);
  }

  /// Contains an array of [GooglePlace]
  final List<GooglePlace> results;

  /// Converts the [NearbySearchResponse] to [Map<String, dynamic>]
  Map<String, dynamic> toJson() => _$NearbySearchResponseToJson(this);

  @override
  List<Object?> get props => [results, status, errorMessage, infoMessages];
}

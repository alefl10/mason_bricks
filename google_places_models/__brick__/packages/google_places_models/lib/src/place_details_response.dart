import 'package:google_places_models/google_places_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_details_response.g.dart';

/// {@template place_details_response}
/// Response object returned from the Google Places API after executing a
/// FindPlaceFromText request.
///
/// [Official docs](https://developers.google.com/maps/documentation/places/web-service/details)
/// {@endtemplate}
@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PlaceDetailsResponse extends GooglePlacesResponse {
  /// {@macro place_details_response}
  const PlaceDetailsResponse({
    super.htmlAttributions,
    required this.result,
    required super.status,
    super.errorMessage,
    super.infoMessages,
    super.nextPageToken,
  });

  /// Converts the [Map<String, dynamic>] to [PlaceDetailsResponse]
  factory PlaceDetailsResponse.fromJson(Map<String, dynamic> json) {
    return _$PlaceDetailsResponseFromJson(json);
  }

  /// {@macro google_place}
  final GooglePlace result;

  /// Converts the [PlaceDetailsResponse] to [Map<String, dynamic>]
  Map<String, dynamic> toJson() => _$PlaceDetailsResponseToJson(this);

  @override
  List<Object?> get props => [result, status, errorMessage, infoMessages];
}

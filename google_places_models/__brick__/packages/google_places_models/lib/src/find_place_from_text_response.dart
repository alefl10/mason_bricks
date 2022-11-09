import 'package:google_places_models/google_places_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'find_place_from_text_response.g.dart';

/// {@template find_place_from_text_response}
/// Response object returned from the Google Places API after executing a
/// FindPlaceFromText request.
///
/// [Official docs](https://developers.google.com/maps/documentation/places/web-service/search-find-place)
@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class FindPlaceFromTextResponse extends GooglePlacesResponse {
  /// {@macro find_place_from_text_response}
  const FindPlaceFromTextResponse({
    required this.candidates,
    super.htmlAttributions,
    required super.status,
    super.errorMessage,
    super.infoMessages,
    super.nextPageToken,
  });

  /// Converts the [Map<String, dynamic>] to [FindPlaceFromTextResponse]
  factory FindPlaceFromTextResponse.fromJson(Map<String, dynamic> json) {
    return _$FindPlaceFromTextResponseFromJson(json);
  }

  /// Contains an array of [GooglePlace]
  final List<GooglePlace> candidates;

  /// Converts the [FindPlaceFromTextResponse] to [Map<String, dynamic>]
  Map<String, dynamic> toJson() => _$FindPlaceFromTextResponseToJson(this);

  @override
  List<Object?> get props => [candidates, status, errorMessage, infoMessages];
}

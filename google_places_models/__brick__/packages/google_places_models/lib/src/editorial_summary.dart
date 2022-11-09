import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'editorial_summary.g.dart';

/// {@template editorial_summary}
/// Contains a summary of the place. A summary is comprised of a textual
/// overview, and also includes the language code for these if applicable.
/// Summary text must be presented as-is and can not be modified or altered.
///
/// See [PlaceEditorialSummary](https://developers.google.com/maps/documentation/places/web-service/search-find-place#PlaceEditorialSummary) for more information.
/// {@endtemplate}
@JsonSerializable(fieldRename: FieldRename.snake)
class EditorialSummary extends Equatable {
  /// {@macro editorial_summary}
  const EditorialSummary({this.language, this.overview});

  /// Converts the [Map<String, dynamic>] to [EditorialSummary]
  factory EditorialSummary.fromJson(Map<String, dynamic> json) {
    return _$EditorialSummaryFromJson(json);
  }

  /// The full text description or name of the address component as returned
  /// by the Geocoder.
  final String? language;

  /// An abbreviated textual name for the address component, if available.
  /// For example, an address component for the state of Alaska may have a
  /// long_name of "Alaska" and a short_name of "AK" using the 2-letter postal
  /// abbreviation.
  final String? overview;

  /// Converts the [EditorialSummary] to [Map<String, dynamic>]
  Map<String, dynamic> toJson() => _$EditorialSummaryToJson(this);

  @override
  List<Object?> get props => [language, overview];
}

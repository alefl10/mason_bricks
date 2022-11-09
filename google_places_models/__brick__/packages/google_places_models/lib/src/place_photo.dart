import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_photo.g.dart';

/// {@template place_photo}
/// A photo of a Place. The photo can be accessed via the Place Photo API using
/// an url in the following pattern:
///
/// https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=photo_reference&key=YOUR_API_KEY
/// {@endtemplate}
@JsonSerializable(fieldRename: FieldRename.snake)
class PlacePhoto extends Equatable {
  /// {@macro place_photo}
  const PlacePhoto({
    required this.height,
    required this.photoReference,
    required this.width,
  });

  /// Converts the [Map<String, dynamic>] to [PlacePhoto]
  factory PlacePhoto.fromJson(Map<String, dynamic> json) {
    return _$PlacePhotoFromJson(json);
  }

  /// The height of the photo.
  final int height;

  /// A string used to identify the photo when you perform a Photo request.
  final String photoReference;

  /// The width of the photo.
  final int width;

  /// Converts the [PlacePhoto] to [Map<String, dynamic>]
  Map<String, dynamic> toJson() => _$PlacePhotoToJson(this);

  @override
  List<Object?> get props => [height, photoReference, width];
}

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'geometry.g.dart';

/// {@template geometry}
/// Contains the location and viewport for the location.
/// {@endtemplate}
@JsonSerializable(fieldRename: FieldRename.snake)
class Geometry extends Equatable {
  /// {@macro geometry}
  const Geometry({required this.lat, required this.lng});

  /// Converts the [Map<String, dynamic>] to [Geometry]
  factory Geometry.fromJson(Map<String, dynamic> json) {
    return _$GeometryFromJson(json['location'] as Map<String, dynamic>);
  }

  /// Latitude value.
  final double lat;

  /// Longitude value.
  final double lng;

  /// Converts the [Geometry] to [Map<String, dynamic>]
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'location': _$GeometryToJson(this)};

  @override
  List<Object?> get props => [lat, lng];
}

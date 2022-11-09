import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address_component.g.dart';

/// {@template address_component}
/// Contains information about the components applicable to a given
/// Google Place address.
/// {@endtemplate}
@JsonSerializable(fieldRename: FieldRename.snake)
class AddressComponent extends Equatable {
  /// {@macro address_component}
  const AddressComponent({
    required this.longName,
    required this.shortName,
    required this.types,
  });

  /// Converts the [Map<String, dynamic>] to [AddressComponent]
  factory AddressComponent.fromJson(Map<String, dynamic> json) {
    return _$AddressComponentFromJson(json);
  }

  /// The full text description or name of the address component as returned
  /// by the Geocoder.
  final String longName;

  /// An abbreviated textual name for the address component, if available.
  /// For example, an address component for the state of Alaska may have a
  /// long_name of "Alaska" and a short_name of "AK" using the 2-letter postal
  /// abbreviation.
  final String shortName;

  /// An array indicating the type of the address component.
  /// See the list of [supported types](https://developers.google.com/maps/documentation/places/web-service/supported_types).
  final List<String> types;

  /// Converts the [AddressComponent] to [Map<String, dynamic>]
  Map<String, dynamic> toJson() => _$AddressComponentToJson(this);

  @override
  List<Object?> get props => [longName, shortName, types];
}

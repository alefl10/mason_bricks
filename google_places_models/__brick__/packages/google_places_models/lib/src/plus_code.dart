import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'plus_code.g.dart';

/// {@template plus_code}
/// An encoded location reference, derived from latitude and longitude
/// coordinates, that represents an area: 1/8000th of a degree by 1/8000th of a
/// degree (about 14m x 14m at the equator) or smaller. Plus codes can be used
/// as a replacement for street addresses in places where they do not exist
/// (where buildings are not numbered or streets are not named).
/// See [Open Location Code](https://en.wikipedia.org/wiki/Open_Location_Code) and [plus codes](https://plus.codes/).
///
/// See [PlusCode](https://developers.google.com/maps/documentation/places/web-service/search-find-place#PlusCode) for more information.
/// {@endtemplate}
@JsonSerializable(fieldRename: FieldRename.snake)
class PlusCode extends Equatable {
  /// {@macro plus_code}
  const PlusCode({
    required this.globalCode,
    this.compoundCode,
  });

  /// Converts the [Map<String, dynamic>] to [PlusCode]
  factory PlusCode.fromJson(Map<String, dynamic> json) {
    return _$PlusCodeFromJson(json);
  }

  /// The global_code is a 4 character area code and 6 character or longer
  /// local code (849VCWC8+R9).
  final String globalCode;

  /// The compound_code is a 6 character or longer local code with an explicit
  /// location (CWC8+R9, Mountain View, CA, USA). Some APIs may return an empty
  /// string if the compound_code is not available.
  final String? compoundCode;

  /// Converts the [PlusCode] to [Map<String, dynamic>]
  Map<String, dynamic> toJson() => _$PlusCodeToJson(this);

  @override
  List<Object?> get props => [globalCode, compoundCode];
}

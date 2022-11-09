import 'package:json_annotation/json_annotation.dart';

/// {@template price_level}
/// The price level of the place, on a scale of 0 to 4. The exact amount
/// indicated by a specific value will vary from region to region.
/// {@endtemplate}
enum PriceLevel {
  /// Indicates the business' price level is
  @JsonValue(0)
  free,

  /// Indicates the business' price level is inexpensive
  @JsonValue(1)
  inexpensive,

  /// Indicates the business' price level is moderate
  @JsonValue(2)
  moderate,

  /// Indicates the business' price level is expensive
  @JsonValue(3)
  expensive,

  /// Indicates the business' price level is very expensive
  @JsonValue(4)
  veryExpensive,
}

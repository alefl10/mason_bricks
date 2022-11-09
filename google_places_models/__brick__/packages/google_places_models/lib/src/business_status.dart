import 'package:json_annotation/json_annotation.dart';

/// {@template business_status}
/// Indicates the operational status of the place, if it is a business.
/// {@endtemplate}
enum BusinessStatus {
  /// Indicates the business is currently operational.
  @JsonValue('OPERATIONAL')
  operational,

  /// Indicates the business is closed temporarily.
  @JsonValue('CLOSED_TEMPORARILY')
  closedTemporarily,

  /// Indicates the business is closed permanently.
  @JsonValue('CLOSED_PERMANENTLY')
  closedPermanently,
}

import 'package:json_annotation/json_annotation.dart';

/// {@template places_search_status}
/// Contains the status of the request, and may contain debugging information
/// to help you track down why the request failed.
/// {@endtemplate}
enum PlacesSearchStatus {
  /// Indicates the API request was successful.
  @JsonValue('OK')
  ok,

  /// Indicates that the search was successful but returned no results.
  /// This may occur if the search was passed a latlng in a remote location.
  @JsonValue('ZERO_RESULTS')
  zeroResults,

  /// Indicates the API request was malformed, generally due to missing
  /// required query parameter (location or radius).
  @JsonValue('INVALID_REQUEST')
  invalidRequest,

  /// Indicates that:
  /// - You have exceeded the QPS limits.
  /// - Billing has not been enabled on your account.
  /// - The monthly $200 credit, or a self-imposed usage cap, has been exceeded.
  /// - The provided method of payment is no longer valid (expired credit card).
  @JsonValue('OVER_QUERY_LIMIT')
  overQueryLimit,

  /// Indicates that your request was denied
  @JsonValue('REQUEST_DENIED')
  requestDenied,

  /// Indicates an unknown error.
  @JsonValue('UNKNOWN_ERROR')
  unknownError,
}

import 'package:equatable/equatable.dart';
import 'package:google_places_models/google_places_models.dart';

/// {@template places_nearby_search_response}
/// The price level of the place, on a scale of 0 to 4. The exact amount
/// indicated by a specific value will vary from region to region.
/// {@endtemplate}
abstract class GooglePlacesResponse extends Equatable {
  /// {@macro places_nearby_search_response}
  const GooglePlacesResponse({
    this.htmlAttributions,
    required this.status,
    this.errorMessage,
    this.infoMessages,
    this.nextPageToken,
  });

  /// May contain a set of attributions about this listing which must be
  /// displayed to the user (some listings may not have attribution).
  final List<String>? htmlAttributions;

  /// {@macro places_search_status}
  final PlacesSearchStatus status;

  /// When the service returns a status code other than OK<, there may be an
  /// additional error_message field within the response object.
  /// This field contains more detailed information about the reasons behind
  /// the given status code. This field is not always returned, and its content
  /// is subject to change.
  final String? errorMessage;

  /// When the service returns additional information about the request
  /// specification, there may be an additional info_messages field within the
  /// response object. This field is only returned for successful requests.
  /// It may not always be returned, and its content is subject to change.
  final List<String>? infoMessages;

  /// Contains a token that can be used to return up to 20 additional results.
  /// A next_page_token will not be returned if there are no additional results
  /// to display. The maximum number of results that can be returned is 60.
  /// There is a short delay between when a next_page_token is issued, and when
  /// it will become valid.
  final String? nextPageToken;

  @override
  List<Object?> get props => [
        htmlAttributions,
        status,
        errorMessage,
        infoMessages,
        nextPageToken,
      ];
}

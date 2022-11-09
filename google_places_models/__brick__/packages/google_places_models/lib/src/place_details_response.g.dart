// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceDetailsResponse _$PlaceDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    PlaceDetailsResponse(
      htmlAttributions: (json['html_attributions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      result: GooglePlace.fromJson(json['result'] as Map<String, dynamic>),
      status: $enumDecode(_$PlacesSearchStatusEnumMap, json['status']),
      errorMessage: json['error_message'] as String?,
      infoMessages: (json['info_messages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      nextPageToken: json['next_page_token'] as String?,
    );

Map<String, dynamic> _$PlaceDetailsResponseToJson(
        PlaceDetailsResponse instance) =>
    <String, dynamic>{
      'html_attributions': instance.htmlAttributions,
      'status': _$PlacesSearchStatusEnumMap[instance.status]!,
      'error_message': instance.errorMessage,
      'info_messages': instance.infoMessages,
      'next_page_token': instance.nextPageToken,
      'result': instance.result.toJson(),
    };

const _$PlacesSearchStatusEnumMap = {
  PlacesSearchStatus.ok: 'OK',
  PlacesSearchStatus.zeroResults: 'ZERO_RESULTS',
  PlacesSearchStatus.invalidRequest: 'INVALID_REQUEST',
  PlacesSearchStatus.overQueryLimit: 'OVER_QUERY_LIMIT',
  PlacesSearchStatus.requestDenied: 'REQUEST_DENIED',
  PlacesSearchStatus.unknownError: 'UNKNOWN_ERROR',
};

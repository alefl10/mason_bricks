// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_place_from_text_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FindPlaceFromTextResponse _$FindPlaceFromTextResponseFromJson(
        Map<String, dynamic> json) =>
    FindPlaceFromTextResponse(
      candidates: (json['candidates'] as List<dynamic>)
          .map((e) => GooglePlace.fromJson(e as Map<String, dynamic>))
          .toList(),
      htmlAttributions: (json['html_attributions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      status: $enumDecode(_$PlacesSearchStatusEnumMap, json['status']),
      errorMessage: json['error_message'] as String?,
      infoMessages: (json['info_messages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      nextPageToken: json['next_page_token'] as String?,
    );

Map<String, dynamic> _$FindPlaceFromTextResponseToJson(
        FindPlaceFromTextResponse instance) =>
    <String, dynamic>{
      'html_attributions': instance.htmlAttributions,
      'status': _$PlacesSearchStatusEnumMap[instance.status]!,
      'error_message': instance.errorMessage,
      'info_messages': instance.infoMessages,
      'next_page_token': instance.nextPageToken,
      'candidates': instance.candidates.map((e) => e.toJson()).toList(),
    };

const _$PlacesSearchStatusEnumMap = {
  PlacesSearchStatus.ok: 'OK',
  PlacesSearchStatus.zeroResults: 'ZERO_RESULTS',
  PlacesSearchStatus.invalidRequest: 'INVALID_REQUEST',
  PlacesSearchStatus.overQueryLimit: 'OVER_QUERY_LIMIT',
  PlacesSearchStatus.requestDenied: 'REQUEST_DENIED',
  PlacesSearchStatus.unknownError: 'UNKNOWN_ERROR',
};

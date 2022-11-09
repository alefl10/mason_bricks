// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_opening_hours.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceOpeningHours _$PlaceOpeningHoursFromJson(Map<String, dynamic> json) =>
    PlaceOpeningHours(
      openNow: json['open_now'] as bool?,
      periods: (json['periods'] as List<dynamic>?)
          ?.map((e) =>
              PlaceOpeningHoursPeriod.fromJson(e as Map<String, dynamic>))
          .toList(),
      weekdayText: (json['weekday_text'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PlaceOpeningHoursToJson(PlaceOpeningHours instance) =>
    <String, dynamic>{
      'open_now': instance.openNow,
      'periods': instance.periods?.map((e) => e.toJson()).toList(),
      'weekday_text': instance.weekdayText,
    };

PlaceOpeningHoursPeriod _$PlaceOpeningHoursPeriodFromJson(
        Map<String, dynamic> json) =>
    PlaceOpeningHoursPeriod(
      open: PlaceOpeningHoursPeriodDetail.fromJson(
          json['open'] as Map<String, dynamic>),
      close: json['close'] == null
          ? null
          : PlaceOpeningHoursPeriodDetail.fromJson(
              json['close'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaceOpeningHoursPeriodToJson(
        PlaceOpeningHoursPeriod instance) =>
    <String, dynamic>{
      'open': instance.open.toJson(),
      'close': instance.close?.toJson(),
    };

PlaceOpeningHoursPeriodDetail _$PlaceOpeningHoursPeriodDetailFromJson(
        Map<String, dynamic> json) =>
    PlaceOpeningHoursPeriodDetail(
      day: json['day'] as int,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$PlaceOpeningHoursPeriodDetailToJson(
        PlaceOpeningHoursPeriodDetail instance) =>
    <String, dynamic>{
      'day': instance.day,
      'time': instance.time,
    };

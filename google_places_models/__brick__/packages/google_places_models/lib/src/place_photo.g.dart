// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlacePhoto _$PlacePhotoFromJson(Map<String, dynamic> json) => PlacePhoto(
      height: json['height'] as int,
      photoReference: json['photo_reference'] as String,
      width: json['width'] as int,
    );

Map<String, dynamic> _$PlacePhotoToJson(PlacePhoto instance) =>
    <String, dynamic>{
      'height': instance.height,
      'photo_reference': instance.photoReference,
      'width': instance.width,
    };

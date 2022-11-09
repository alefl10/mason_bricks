// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GooglePlace _$GooglePlaceFromJson(Map<String, dynamic> json) => GooglePlace(
      addressComponents: (json['address_components'] as List<dynamic>?)
          ?.map((e) => AddressComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      adrAddress: json['adr_address'] as String?,
      businessStatus:
          $enumDecodeNullable(_$BusinessStatusEnumMap, json['business_status']),
      curbsidePickup: json['curbside_pickup'] as bool?,
      delivery: json['delivery'] as bool?,
      dineIn: json['dine_in'] as bool?,
      editorialSummary: json['editorial_summary'] == null
          ? null
          : EditorialSummary.fromJson(
              json['editorial_summary'] as Map<String, dynamic>),
      formattedAddress: json['formatted_address'] as String?,
      formattedPhoneNumber: json['formatted_phone_number'] as String?,
      geometry: json['geometry'] == null
          ? null
          : Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
      icon: json['icon'] as String?,
      iconBackgroundColor: json['icon_background_color'] as String?,
      iconMaskBaseUri: json['icon_mask_base_uri'] as String?,
      internationalPhoneNumber: json['international_phone_number'] as String?,
      name: json['name'] as String?,
      openingHours: json['opening_hours'] == null
          ? null
          : PlaceOpeningHours.fromJson(
              json['opening_hours'] as Map<String, dynamic>),
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => PlacePhoto.fromJson(e as Map<String, dynamic>))
          .toList(),
      placeId: json['place_id'] as String?,
      plusCode: json['plus_code'] == null
          ? null
          : PlusCode.fromJson(json['plus_code'] as Map<String, dynamic>),
      priceLevel: $enumDecodeNullable(_$PriceLevelEnumMap, json['price_level']),
      rating: (json['rating'] as num?)?.toDouble(),
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
      secondaryOpeningHours: (json['secondary_opening_hours'] as List<dynamic>?)
          ?.map((e) => PlaceOpeningHours.fromJson(e as Map<String, dynamic>))
          .toList(),
      takeout: json['takeout'] as bool?,
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
      url: json['url'] as String?,
      userRatingsTotal: json['user_ratings_total'] as int?,
      utcOffset: json['utc_offset'] as int?,
      vicinity: json['vicinity'] as String?,
      website: json['website'] as String?,
    );

Map<String, dynamic> _$GooglePlaceToJson(GooglePlace instance) =>
    <String, dynamic>{
      'address_components':
          instance.addressComponents?.map((e) => e.toJson()).toList(),
      'adr_address': instance.adrAddress,
      'business_status': _$BusinessStatusEnumMap[instance.businessStatus],
      'curbside_pickup': instance.curbsidePickup,
      'delivery': instance.delivery,
      'dine_in': instance.dineIn,
      'editorial_summary': instance.editorialSummary?.toJson(),
      'formatted_address': instance.formattedAddress,
      'formatted_phone_number': instance.formattedPhoneNumber,
      'geometry': instance.geometry?.toJson(),
      'icon': instance.icon,
      'icon_background_color': instance.iconBackgroundColor,
      'icon_mask_base_uri': instance.iconMaskBaseUri,
      'international_phone_number': instance.internationalPhoneNumber,
      'name': instance.name,
      'opening_hours': instance.openingHours?.toJson(),
      'photos': instance.photos?.map((e) => e.toJson()).toList(),
      'place_id': instance.placeId,
      'plus_code': instance.plusCode?.toJson(),
      'price_level': _$PriceLevelEnumMap[instance.priceLevel],
      'rating': instance.rating,
      'reviews': instance.reviews?.map((e) => e.toJson()).toList(),
      'secondary_opening_hours':
          instance.secondaryOpeningHours?.map((e) => e.toJson()).toList(),
      'takeout': instance.takeout,
      'types': instance.types,
      'url': instance.url,
      'user_ratings_total': instance.userRatingsTotal,
      'utc_offset': instance.utcOffset,
      'vicinity': instance.vicinity,
      'website': instance.website,
    };

const _$BusinessStatusEnumMap = {
  BusinessStatus.operational: 'OPERATIONAL',
  BusinessStatus.closedTemporarily: 'CLOSED_TEMPORARILY',
  BusinessStatus.closedPermanently: 'CLOSED_PERMANENTLY',
};

const _$PriceLevelEnumMap = {
  PriceLevel.free: 0,
  PriceLevel.inexpensive: 1,
  PriceLevel.moderate: 2,
  PriceLevel.expensive: 3,
  PriceLevel.veryExpensive: 4,
};

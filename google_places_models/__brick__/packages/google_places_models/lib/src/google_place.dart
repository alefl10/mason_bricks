import 'package:equatable/equatable.dart';
import 'package:google_places_models/google_places_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'google_place.g.dart';

/// {@template google_place}
/// Object returned by the Google Places API.
/// {@endtemplate}
@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class GooglePlace extends Equatable {
  /// {@macro google_place}
  const GooglePlace({
    this.addressComponents,
    this.adrAddress,
    this.businessStatus,
    this.curbsidePickup,
    this.delivery,
    this.dineIn,
    this.editorialSummary,
    this.formattedAddress,
    this.formattedPhoneNumber,
    this.geometry,
    this.icon,
    this.iconBackgroundColor,
    this.iconMaskBaseUri,
    this.internationalPhoneNumber,
    this.name,
    this.openingHours,
    this.photos,
    this.placeId,
    this.plusCode,
    this.priceLevel,
    this.rating,
    this.reviews,
    this.secondaryOpeningHours,
    this.takeout,
    this.types,
    this.url,
    this.userRatingsTotal,
    this.utcOffset,
    this.vicinity,
    this.website,
  });

  /// Converts the [Map<String, dynamic>] to [GooglePlace]
  factory GooglePlace.fromJson(Map<String, dynamic> json) {
    return _$GooglePlaceFromJson(json);
  }

  /// An array containing the separate components applicable to this address.
  final List<AddressComponent>? addressComponents;

  /// A representation of the place's address in the adr [microformat](http://microformats.org/wiki/adr).
  final String? adrAddress;

  /// {@macro business_status}
  final BusinessStatus? businessStatus;

  /// Specifies if the business supports curbside pickup.
  final bool? curbsidePickup;

  /// Specifies if the business supports delivery.
  final bool? delivery;

  /// Specifies if the business supports indoor or outdoor seating options.
  final bool? dineIn;

  /// {@macro editorial_summary}
  final EditorialSummary? editorialSummary;

  /// A string containing the human-readable address of this place.
  /// Often this address is equivalent to the postal address.
  final String? formattedAddress;

  /// Contains the place's phone number in its local format.
  final String? formattedPhoneNumber;

  /// {@macro geometry}
  final Geometry? geometry;

  /// Contains the URL of a suggested icon which may be displayed to the user
  /// when indicating this result on a map.
  final String? icon;

  /// Contains the default HEX color code for the place's category.
  final String? iconBackgroundColor;

  /// Contains the URL of a recommended icon, minus the .svg or .png file
  /// type extension.
  final String? iconMaskBaseUri;

  /// Contains the place's phone number in international format.
  /// International format includes the country code, and is prefixed with the
  /// plus, +, sign.
  /// For example, the international_phone_number for Google's Sydney,
  /// Australia office is +61 2 9374 4000.
  final String? internationalPhoneNumber;

  /// Contains the human-readable name for the returned result.
  /// For establishment results, this is usually the canonical form of the
  /// business name.
  final String? name;

  /// {@macro place_opening_hours}
  final PlaceOpeningHours? openingHours;

  /// A list of [PlacePhoto].
  final List<PlacePhoto>? photos;

  /// A textual identifier that uniquely identifies a place.
  /// To retrieve information about the place, pass this identifier in the
  /// place_id field of a Places API request.
  /// For more information about place IDs, see the [place ID overview](https://developers.google.com/maps/documentation/places/web-service/place-id).
  final String? placeId;

  /// {@macro plus_code}
  final PlusCode? plusCode;

  /// {@macro price_level}
  final PriceLevel? priceLevel;

  /// Contains the place's rating, from 1.0 to 5.0, based on aggregated
  /// user reviews.
  final double? rating;

  /// A JSON array of up to five reviews. By default, the reviews are sorted in
  /// order of relevance. Use the reviews_sort request parameter to
  /// control sorting.
  ///
  /// - For most_relevant (default), reviews are sorted by relevance;
  /// the service will bias the results to return reviews originally written in
  /// the preferred language.
  /// - For newest, reviews are sorted in chronological order; the preferred
  /// language does not affect the sort order.
  ///
  /// Google recommends indicating to users whether results are ordered by
  /// most_relevant or newest.
  ///
  /// See [PlaceReview](https://developers.google.com/maps/documentation/places/web-service/search-find-place#PlaceReview) for more information.
  final List<Review>? reviews;

  /// Contains an array of entries for the next seven days including
  /// information about secondary hours of a business. Secondary hours are
  /// different from a business's main hours ([openingHours]).
  /// For example, a restaurant can specify drive through hours or delivery
  /// hours as its secondary hours. This field populates the type subfield,
  /// which draws from a predefined list of opening hours types
  /// (such as DRIVE_THROUGH, PICKUP, or TAKEOUT) based on the types of the
  /// place. This field includes the special_days subfield of all hours, set
  /// for dates that have exceptional hours.
  final List<PlaceOpeningHours>? secondaryOpeningHours;

  /// Specifies if the business supports takeout.
  final bool? takeout;

  /// Contains an array of feature types describing the given result.
  /// See the list of supported types [here](https://developers.google.com/maps/documentation/places/web-service/supported_types#table2).
  final List<String>? types;

  /// Contains the URL of the official Google page for this place.
  /// This will be the Google-owned page that contains the best available
  /// information about the place. Applications must link to or embed this page
  /// on any screen that shows detailed results about the place to the user.
  final String? url;

  /// The total number of reviews, with or without text, for this place.
  final int? userRatingsTotal;

  /// Contains the number of minutes this place’s current timezone is offset
  /// from UTC. For example, for places in Sydney, Australia during daylight
  /// saving time this would be 660 (+11 hours from UTC), and for places in
  /// California outside of daylight saving time this would be -480
  /// (-8 hours from UTC).
  final int? utcOffset;

  /// For establishment (types:["establishment", ...]) results only,
  /// the vicinity field contains a simplified address for the place, including
  /// the street name, street number, and locality, but not the province/state,
  /// postal code, or country.
  ///
  /// For all other results, the vicinity field contains the name of the
  /// narrowest political (types:["political", ...]) feature that is present in
  /// the address of the result.
  ///
  /// This content is meant to be read as-is. Do not programmatically parse
  /// this field.
  final String? vicinity;

  /// The authoritative website for this place, such as a business' homepage.
  final String? website;

  /// Converts the [GooglePlace] to [Map<String, dynamic>]
  Map<String, dynamic> toJson() => _$GooglePlaceToJson(this);

  @override
  List<Object?> get props => [
        addressComponents,
        adrAddress,
        businessStatus,
        curbsidePickup,
        delivery,
        dineIn,
        editorialSummary,
        formattedAddress,
        formattedPhoneNumber,
        geometry,
        icon,
        iconBackgroundColor,
        iconMaskBaseUri,
        internationalPhoneNumber,
        name,
        openingHours,
        photos,
        placeId,
        plusCode,
        priceLevel,
        rating,
        reviews,
        secondaryOpeningHours,
        takeout,
        types,
        url,
        userRatingsTotal,
        utcOffset,
        vicinity,
        website,
      ];
}

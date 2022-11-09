import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_opening_hours.g.dart';

/// {@template place_opening_hours}
/// The price level of the place, on a scale of 0 to 4. The exact amount
/// indicated by a specific value will vary from region to region.
/// {@endtemplate}
@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PlaceOpeningHours extends Equatable {
  /// {@macro place_opening_hours}
  const PlaceOpeningHours({this.openNow, this.periods, this.weekdayText});

  /// Converts the [Map<String, dynamic>] to [PlaceOpeningHours]
  factory PlaceOpeningHours.fromJson(Map<String, dynamic> json) {
    return _$PlaceOpeningHoursFromJson(json);
  }

  /// A boolean value indicating if the place is open at the current time.
  final bool? openNow;

  /// An array of opening periods covering seven days, starting from Sunday,
  /// in chronological order.
  final List<PlaceOpeningHoursPeriod>? periods;

  /// An array of strings describing in human-readable text the hours of
  /// the place.
  final List<String>? weekdayText;

  /// Converts the [PlaceOpeningHours] to [Map<String, dynamic>]
  Map<String, dynamic> toJson() => _$PlaceOpeningHoursToJson(this);

  @override
  List<Object?> get props => [openNow, periods, weekdayText];
}

/// {@template place_opening_hours_period}
/// The opening period for a business.
/// {@endtemplate}
@JsonSerializable(explicitToJson: true)
class PlaceOpeningHoursPeriod extends Equatable {
  /// {@macro place_opening_hours_period}
  const PlaceOpeningHoursPeriod({required this.open, this.close});

  /// Converts the [Map<String, dynamic>] to [PlaceOpeningHoursPeriod]
  factory PlaceOpeningHoursPeriod.fromJson(Map<String, dynamic> json) {
    return _$PlaceOpeningHoursPeriodFromJson(json);
  }

  /// {@macro place_opening_hours_period_detail}
  final PlaceOpeningHoursPeriodDetail open;

  /// {@macro place_opening_hours_period_detail}
  /// If a place is always open, the close section will be missing from the
  /// response. Clients can rely on always-open being represented as an open
  /// period containing day with value 0 and time with value 0000, and no close.
  final PlaceOpeningHoursPeriodDetail? close;

  /// Converts the [PlaceOpeningHoursPeriod] to [Map<String, dynamic>]
  Map<String, dynamic> toJson() => _$PlaceOpeningHoursPeriodToJson(this);

  @override
  List<Object?> get props => [open, close];
}

/// {@template place_opening_hours_period_detail}
/// Contains a pair of day and time objects describing when the place opens.
/// {@endtemplate}
@JsonSerializable()
class PlaceOpeningHoursPeriodDetail extends Equatable {
  /// {@macro place_opening_hours_period_detail}
  const PlaceOpeningHoursPeriodDetail({required this.day, this.time});

  /// Converts the [Map<String, dynamic>] to [PlaceOpeningHoursPeriodDetail]
  factory PlaceOpeningHoursPeriodDetail.fromJson(Map<String, dynamic> json) {
    return _$PlaceOpeningHoursPeriodDetailFromJson(json);
  }

  /// A number from 0–6, corresponding to the days of the week,
  /// starting on Sunday. For example, 2 means Tuesday.
  final int day;

  /// It may contain a time of day in 24-hour hhmm format.
  /// Values are in the range 0000–2359. The time will be reported in the
  /// place’s time zone.
  final String? time;

  /// Converts the [PlaceOpeningHoursPeriodDetail] to [Map<String, dynamic>]
  Map<String, dynamic> toJson() => _$PlaceOpeningHoursPeriodDetailToJson(this);

  /// {@macro day_name}
  DayName get dayNumberToName {
    switch (day) {
      case 0:
        return DayName.sun;
      case 1:
        return DayName.mon;
      case 2:
        return DayName.tue;
      case 3:
        return DayName.wed;
      case 4:
        return DayName.thu;
      case 5:
        return DayName.fri;
      case 6:
        return DayName.sat;
      default:
        return DayName.unk;
    }
  }

  @override
  List<Object?> get props => [day, time];
}

/// {@template day_name}
/// Enum containing three-letter values representing all the days of the week.
/// {@endtemplate}
enum DayName {
  /// Sunday
  sun,

  /// Monday
  mon,

  /// Tuesday
  tue,

  /// Wednesday
  wed,

  /// Thursday
  thu,

  /// Friday
  fri,

  /// Saturday
  sat,

  /// Unknown
  unk,
}

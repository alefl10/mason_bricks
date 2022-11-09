/// Prefer results in a specified area, by specifying either a radius plus
/// lat/lng, or two lat/lng pairs representing the points of a rectangle.
enum LocationBias {
  /// Instructs the API to use IP address biasing. Pass the string ipbias.
  ipbias,

  /// A single lat/lng coordinate. Use the following format: point:lat,lng.
  point,

  /// A string specifying radius in meters, plus lat/lng in decimal degrees.
  circle,

  /// A string specifying two lat/lng pairs in decimal degrees, representing the
  /// south/west and north/east points of a rectangle. Use the following
  /// format:rectangle:south,west|north,east.
  /// Note that east/west values are wrapped to the range -180, 180,
  /// and north/south values are clamped to the range -90, 90.
  rectangle,
}

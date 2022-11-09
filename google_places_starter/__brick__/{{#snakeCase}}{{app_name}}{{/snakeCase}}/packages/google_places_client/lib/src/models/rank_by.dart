/// Specifies the order in which results are listed.
enum RankBy {
  /// This option sorts results based on their importance.
  /// Ranking will favor prominent places within the set radius over nearby
  /// places that match but that are less prominent. Prominence can be affected
  /// by a place's ranking in Google's index, global popularity, and other
  /// factors. When prominence is specified, the radius parameter is required.
  prominence,

  /// This option biases search results in ascending order by their
  /// distance from the specified location. When distance is specified, one or
  /// more of keyword, name, or type is required and radius is disallowed.
  distance,
}

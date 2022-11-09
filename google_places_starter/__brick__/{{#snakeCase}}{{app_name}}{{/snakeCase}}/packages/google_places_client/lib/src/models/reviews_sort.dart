/// {@template review_sort}
/// The sorting method to use when returning reviews.
/// {@endtemplate}
enum ReviewsSort {
  /// For mostRelevant, reviews are sorted by relevance; the service will bias
  /// the results to return reviews originally written in the preferred
  /// language.
  mostRelevant('most_relevant'),

  /// For newest, reviews are sorted in chronological order; the preferred
  /// language does not affect the sort order.
  newest('newest');

  /// {@macro review_sort}
  const ReviewsSort(this.toSnake);

  /// Encodes a field named snakeCase with a JSON key snake_case.
  final String toSnake;
}

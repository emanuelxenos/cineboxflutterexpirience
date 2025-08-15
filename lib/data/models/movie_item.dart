import 'package:json_annotation/json_annotation.dart';

part 'movie_item.g.dart';

@JsonSerializable()
class MovieItem {
  final int id;
  final String title;
  final String overview;
  final List<int>? genreIds;
  final String? posterPath;
  final String? backdroPath;
  final double voteAverage;
  final String? releaseDate;

  factory MovieItem.fromJson(Map<String, dynamic> json) =>
      _$MovieItemFromJson(json);

  MovieItem({
    required this.id,
    required this.title,
    required this.overview,
    this.genreIds,
    this.posterPath,
    this.backdroPath,
    required this.voteAverage,
    this.releaseDate,
  });

  Map<String, dynamic> toJson() => _$MovieItemToJson(this);
}

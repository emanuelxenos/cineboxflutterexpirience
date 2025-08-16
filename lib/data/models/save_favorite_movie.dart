import 'package:json_annotation/json_annotation.dart';

part 'save_favorite_movie.g.dart';

@JsonSerializable()
class SaveFavoriteMovie {
  final int id;
  final String postterUrl;
  final String title;
  final int year;

  SaveFavoriteMovie({
    required this.id,
    required this.postterUrl,
    required this.title,
    required this.year,
  });

  factory SaveFavoriteMovie.fromJson(Map<String, dynamic> json) =>
      _$SaveFavoriteMovieFromJson(json);

  Map<String, dynamic> toJson() => _$SaveFavoriteMovieToJson(this);
}

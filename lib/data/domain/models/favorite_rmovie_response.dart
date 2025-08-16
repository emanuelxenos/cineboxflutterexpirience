import 'package:json_annotation/json_annotation.dart';

part 'favorite_rmovie_response.g.dart';

@JsonSerializable()
class FavoriteRmovieResponse {
  final int id;
  final String posterUrl;
  final String title;
  final int year;

  factory FavoriteRmovieResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoriteRmovieResponseFromJson(json);

  FavoriteRmovieResponse({
    required this.id,
    required this.posterUrl,
    required this.title,
    required this.year,
  });

  Map<String, dynamic> toJson() => _$FavoriteRmovieResponseToJson(this);
}

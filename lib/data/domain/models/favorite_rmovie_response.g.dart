// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_rmovie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteRmovieResponse _$FavoriteRmovieResponseFromJson(
  Map<String, dynamic> json,
) => FavoriteRmovieResponse(
  movieId: (json['movie_id'] as num).toInt(),
  posterUrl: json['poster_url'] as String,
  title: json['title'] as String,
  year: (json['year'] as num).toInt(),
);

Map<String, dynamic> _$FavoriteRmovieResponseToJson(
  FavoriteRmovieResponse instance,
) => <String, dynamic>{
  'movie_id': instance.movieId,
  'poster_url': instance.posterUrl,
  'title': instance.title,
  'year': instance.year,
};

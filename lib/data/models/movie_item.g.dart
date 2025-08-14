// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieItem _$MovieItemFromJson(Map<String, dynamic> json) => MovieItem(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  overview: json['overview'] as String,
  genreIds: (json['genre_ids'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  posterPath: json['poster_path'] as String?,
  backdroPath: json['backdro_path'] as String?,
  voteAvarage: (json['vote_avarage'] as num).toDouble(),
  releaseDate: json['release_date'] as String?,
);

Map<String, dynamic> _$MovieItemToJson(MovieItem instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'overview': instance.overview,
  'genre_ids': instance.genreIds,
  'poster_path': instance.posterPath,
  'backdro_path': instance.backdroPath,
  'vote_avarage': instance.voteAvarage,
  'release_date': instance.releaseDate,
};

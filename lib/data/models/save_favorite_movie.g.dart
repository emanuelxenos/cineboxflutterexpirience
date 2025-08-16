// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_favorite_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveFavoriteMovie _$SaveFavoriteMovieFromJson(Map<String, dynamic> json) =>
    SaveFavoriteMovie(
      id: (json['id'] as num).toInt(),
      postterUrl: json['postter_url'] as String,
      title: json['title'] as String,
      year: (json['year'] as num).toInt(),
    );

Map<String, dynamic> _$SaveFavoriteMovieToJson(SaveFavoriteMovie instance) =>
    <String, dynamic>{
      'id': instance.id,
      'postter_url': instance.postterUrl,
      'title': instance.title,
      'year': instance.year,
    };

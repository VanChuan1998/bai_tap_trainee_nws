import 'package:json_annotation/json_annotation.dart';

part 'movie_entity.g.dart';

@JsonSerializable()
class MovieEntity {
  @JsonKey()
  String? title;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  @JsonKey()
  String? overview;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  @JsonKey(name: 'adult')
  bool? adult;
  @JsonKey(name: 'genre_ids')
  List<num>? genreIds;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  @JsonKey(name: 'popularity')
  num? popularity;
  @JsonKey(name: 'video')
  bool? video;
  @JsonKey(name: 'vote_count')
  int? voteCount;

  MovieEntity({
    this.title,
    this.posterPath,
    this.backdropPath,
    this.voteAverage,
    this.overview,
    this.releaseDate,
    this.adult,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.popularity,
    this.video,
    this.voteCount,
  });

  factory MovieEntity.fromJson(Map<String, dynamic> json) =>
      _$MovieEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MovieEntityToJson(this);

  String get posterUrl {
    return 'https://image.tmdb.org/t/p/w185${posterPath ?? ""}';
  }
}

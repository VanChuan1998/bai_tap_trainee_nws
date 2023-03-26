part of 'chap_5_home_cubit.dart';

class Chap5HomeState extends Equatable {
  final LoadStatus loadDataStatus;
  final int carouselBackdropIndex;
  final int carouselPosterIndex;
  final List<MovieEntity> movies;

  const Chap5HomeState({
    this.loadDataStatus = LoadStatus.initial,
    this.carouselBackdropIndex = 0,
    this.carouselPosterIndex = 0,
    this.movies = const [],
  });

  @override
  List<Object?> get props => [
        loadDataStatus,
        carouselBackdropIndex,
    carouselPosterIndex,
        movies,
      ];

  Chap5HomeState copyWith({
    LoadStatus? loadDataStatus,
    int? carouselBackdropIndex,
    int? carouselPosterIndex,
    List<MovieEntity>? movies,
  }) {
    return Chap5HomeState(
      loadDataStatus: loadDataStatus ?? this.loadDataStatus,
      carouselBackdropIndex: carouselBackdropIndex ?? this.carouselBackdropIndex,
      carouselPosterIndex: carouselPosterIndex ?? this.carouselPosterIndex,
      movies: movies ?? this.movies,
    );
  }
}

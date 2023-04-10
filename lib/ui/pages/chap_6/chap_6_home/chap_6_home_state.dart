part of 'chap_6_home_cubit.dart';

class Chap6HomeState extends Equatable {
  final LoadStatus loadDataStatus;
  final int carouselBackdropIndex;
  final int carouselPosterIndex;
  final List<MovieEntity> movies;

  const Chap6HomeState({
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

  Chap6HomeState copyWith({
    LoadStatus? loadDataStatus,
    int? carouselBackdropIndex,
    int? carouselPosterIndex,
    List<MovieEntity>? movies,
  }) {
    return Chap6HomeState(
      loadDataStatus: loadDataStatus ?? this.loadDataStatus,
      carouselBackdropIndex: carouselBackdropIndex ?? this.carouselBackdropIndex,
      carouselPosterIndex: carouselPosterIndex ?? this.carouselPosterIndex,
      movies: movies ?? this.movies,
    );
  }
}

part of 'chap_5_detail_cubit.dart';

class Chap5DetailState extends Equatable {
  final LoadStatus loadDataStatus;
  final MovieEntity? movie;

  const Chap5DetailState({
    this.loadDataStatus = LoadStatus.initial,
    this.movie,
  });

  @override
  List<Object?> get props => [
        loadDataStatus,
        movie,
      ];

  Chap5DetailState copyWith({
    LoadStatus? loadDataStatus,
    MovieEntity? movie,
  }) {
    return Chap5DetailState(
      loadDataStatus: loadDataStatus ?? this.loadDataStatus,
      movie: movie ?? this.movie,
    );
  }
}

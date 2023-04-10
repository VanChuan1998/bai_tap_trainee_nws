part of 'chap_6_detail_cubit.dart';

class Chap6DetailState extends Equatable {
  final LoadStatus loadDataStatus;
  final MovieEntity? movie;

  const Chap6DetailState({
    this.loadDataStatus = LoadStatus.initial,
    this.movie,
  });

  @override
  List<Object?> get props => [
        loadDataStatus,
        movie,
      ];

  Chap6DetailState copyWith({
    LoadStatus? loadDataStatus,
    MovieEntity? movie,
  }) {
    return Chap6DetailState(
      loadDataStatus: loadDataStatus ?? this.loadDataStatus,
      movie: movie ?? this.movie,
    );
  }
}

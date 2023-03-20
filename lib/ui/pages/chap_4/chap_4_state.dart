part of 'chap_4_cubit.dart';

class Chap4State extends Equatable {
  final LoadStatus loadDataStatus;

  const Chap4State({
    this.loadDataStatus = LoadStatus.initial,
  });

  @override
  List<Object?> get props => [
        loadDataStatus,
      ];

  Chap4State copyWith({
    LoadStatus? loadDataStatus,
  }) {
    return Chap4State(
      loadDataStatus: loadDataStatus ?? this.loadDataStatus,
    );
  }
}

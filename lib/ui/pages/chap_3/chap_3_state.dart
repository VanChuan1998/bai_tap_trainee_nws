part of 'chap_3_cubit.dart';

class Chap3State extends Equatable {
  final LoadStatus loadDataStatus;

  const Chap3State({
    this.loadDataStatus = LoadStatus.initial,
  });

  @override
  List<Object?> get props => [
        loadDataStatus,
      ];

  Chap3State copyWith({
    LoadStatus? loadDataStatus,
  }) {
    return Chap3State(
      loadDataStatus: loadDataStatus ?? this.loadDataStatus,
    );
  }
}

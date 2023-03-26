part of 'chap_5_cubit.dart';

class Chap5State extends Equatable {
  final LoadStatus loadDataStatus;
  final int selectedIndex;

  const Chap5State({
    this.loadDataStatus = LoadStatus.initial,
    this.selectedIndex = 0,
  });

  @override
  List<Object?> get props => [
        loadDataStatus,
        selectedIndex,
      ];

  Chap5State copyWith({
    LoadStatus? loadDataStatus,
    int? selectedIndex,
  }) {
    return Chap5State(
      loadDataStatus: loadDataStatus ?? this.loadDataStatus,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}

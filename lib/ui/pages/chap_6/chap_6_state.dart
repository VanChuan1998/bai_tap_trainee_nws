part of 'chap_6_cubit.dart';

class Chap6State extends Equatable {
  final LoadStatus loadDataStatus;
  final int selectedIndex;

  const Chap6State({
    this.loadDataStatus = LoadStatus.initial,
    this.selectedIndex = 0,
  });

  @override
  List<Object?> get props => [
        loadDataStatus,
        selectedIndex,
      ];

  Chap6State copyWith({
    LoadStatus? loadDataStatus,
    int? selectedIndex,
  }) {
    return Chap6State(
      loadDataStatus: loadDataStatus ?? this.loadDataStatus,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}

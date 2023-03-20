part of 'chap_4_cubit.dart';

class Chap4State extends Equatable {
  final LoadStatus loadDataStatus;
  final bool isShowSvg;

  const Chap4State(
      {this.loadDataStatus = LoadStatus.initial, this.isShowSvg = false});

  @override
  List<Object?> get props => [
        loadDataStatus,
        isShowSvg,
      ];

  Chap4State copyWith({
    LoadStatus? loadDataStatus,
    bool? isShowSvg,
  }) {
    return Chap4State(
      loadDataStatus: loadDataStatus ?? this.loadDataStatus,
      isShowSvg: isShowSvg ?? this.isShowSvg,
    );
  }
}

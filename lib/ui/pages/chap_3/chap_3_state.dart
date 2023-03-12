part of 'chap_3_cubit.dart';

class Chap3State extends Equatable {
  final LoadStatus loadDataStatus;
  final List<SaladEntity> saladList;
  final int totalPage;
  final int currentPage;

  const Chap3State({
    this.loadDataStatus = LoadStatus.initial,
    this.saladList = const [],
    this.currentPage = 1,
    this.totalPage = 2,
  });

  @override
  List<Object?> get props => [
        loadDataStatus,
        saladList,
    currentPage,
    totalPage,
      ];

  Chap3State copyWith({
    LoadStatus? loadDataStatus,
    List<SaladEntity>? saladList,
    int? totalPage,
    int? currentPage,
  }) {
    return Chap3State(
      loadDataStatus: loadDataStatus ?? this.loadDataStatus,
      saladList: saladList ?? this.saladList,
      totalPage: totalPage ?? this.totalPage,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}

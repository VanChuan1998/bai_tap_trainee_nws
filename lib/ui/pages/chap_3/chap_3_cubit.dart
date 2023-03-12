import 'package:bai_tap_trainee/models/entities/salad_entity.dart';
import 'package:bai_tap_trainee/models/entities/user/user_entity.dart';
import 'package:bai_tap_trainee/models/enums/load_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'chap_3_state.dart';

class Chap3Cubit extends Cubit<Chap3State> {
  Chap3Cubit() : super(const Chap3State());

  final List<SaladEntity> listData = [
    SaladEntity(
      title: "Salad 1",
      author: UserEntity.mockData(),
      isMarked: true,
    ),
    SaladEntity(
      title: "Salad 2",
      author: UserEntity.mockData(),
      isMarked: false,
    ),
    SaladEntity(
      title: "Salad 3",
      author: UserEntity.mockData(),
      isMarked: false,
    ),
    SaladEntity(
      title: "Salad 4",
      author: UserEntity.mockData(),
      isMarked: false,
    ),
    SaladEntity(
      title: "Salad 5",
      author: UserEntity.mockData(),
      isMarked: false,
    ),
    SaladEntity(
      title: "Salad 6",
      author: UserEntity.mockData(),
      isMarked: false,
    ),
    SaladEntity(
      title: "Salad 7",
      author: UserEntity.mockData(),
      isMarked: false,
    ),
    SaladEntity(
      title: "Salad 8",
      author: UserEntity.mockData(),
      isMarked: false,
    ),
  ];

  Future<void> loadInitialData() async {
    emit(state.copyWith(loadDataStatus: LoadStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 2));
      final result = listData;

      //Todo: add API calls
      emit(state.copyWith(
        loadDataStatus: LoadStatus.success,
        saladList: result,
        currentPage: 1,
        totalPage: 4,
      ));
    } catch (e) {
      //Todo: should print exception here
      emit(state.copyWith(loadDataStatus: LoadStatus.failure));
    }
  }

  void onBookMarkChange(SaladEntity salad){
    salad.isMarked = !(salad.isMarked ?? false);
  }

  Future<void> loadMore() async {
    if (state.currentPage >= state.totalPage) return;
    if (state.loadDataStatus != LoadStatus.success) return;
    emit(state.copyWith(loadDataStatus: LoadStatus.loadingMore));
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(
        loadDataStatus: LoadStatus.success,
        saladList: state.saladList + listData,
        currentPage: state.currentPage + 1,
      ));
    } catch (e) {
      //Todo: should print exception here
      emit(state.copyWith(loadDataStatus: LoadStatus.failure));
    }
  }

}

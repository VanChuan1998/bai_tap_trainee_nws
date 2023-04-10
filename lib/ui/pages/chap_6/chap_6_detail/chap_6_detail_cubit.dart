import 'package:bai_tap_trainee/models/entities/movie_entity.dart';
import 'package:bai_tap_trainee/models/enums/load_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'chap_6_detail_state.dart';

class Chap6DetailCubit extends Cubit<Chap6DetailState> {
  Chap6DetailCubit() : super(const Chap6DetailState());

  Future<void> loadInitialData({MovieEntity? movie}) async {
    emit(state.copyWith(loadDataStatus: LoadStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 2));
      //Todo: add API calls
      emit(state.copyWith(
        loadDataStatus: LoadStatus.success,
        movie: movie ?? state.movie,
      ));
    } catch (e) {
      //Todo: should print exception here
      emit(state.copyWith(loadDataStatus: LoadStatus.failure));
    }
  }
}

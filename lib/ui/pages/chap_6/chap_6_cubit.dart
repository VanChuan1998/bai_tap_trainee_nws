import 'package:bai_tap_trainee/models/enums/load_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'chap_6_state.dart';

class Chap6Cubit extends Cubit<Chap6State> {
  Chap6Cubit() : super(const Chap6State());

  Future<void> loadInitialData() async {
    emit(state.copyWith(loadDataStatus: LoadStatus.initial));
    try {
      //Todo: add API calls
      emit(state.copyWith(loadDataStatus: LoadStatus.success));
    } catch (e) {
      //Todo: should print exception here
      emit(state.copyWith(loadDataStatus: LoadStatus.failure));
    }
  }

  ///Switch tab
  void switchTap(int index) {
    emit(state.copyWith(selectedIndex: index));
  }
}

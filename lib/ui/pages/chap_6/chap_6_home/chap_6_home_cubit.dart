import 'package:bai_tap_trainee/models/entities/movie_entity.dart';
import 'package:bai_tap_trainee/models/enums/load_status.dart';
import 'package:bai_tap_trainee/repositories/movie_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'chap_6_home_state.dart';

class Chap6HomeCubit extends Cubit<Chap6HomeState> {
  final MovieRepository movieRepository;

  Chap6HomeCubit({required this.movieRepository,}) : super(const Chap6HomeState());


  Future<void> loadInitialData() async {
    emit(state.copyWith(loadDataStatus: LoadStatus.loading));
    try {
      final result = await movieRepository.getMovies(page: 1);
      emit(state.copyWith(
        loadDataStatus: LoadStatus.success,
        movies: result.results,
      ));
    } catch (e) {
      emit(state.copyWith(loadDataStatus: LoadStatus.failure));
    }
  }

  Future<void> onChangeBackdrop(int index) async {
    emit(state.copyWith(carouselBackdropIndex: index));
  }

  Future<void> onChangePoster(int index) async {
    emit(state.copyWith(carouselPosterIndex: index));
  }
}

import 'package:bai_tap_trainee/models/entities/movie_entity.dart';
import 'package:bai_tap_trainee/models/enums/load_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'chap_5_home_state.dart';

class Chap5HomeCubit extends Cubit<Chap5HomeState> {
  Chap5HomeCubit() : super(const Chap5HomeState());

  List<MovieEntity> movies = [
    MovieEntity(
      title: "Kamen Rider Black Sun",
      posterPath:
          'https://images.spiderum.com/sp-images/827046d0616911ed94cecd9d570ceaa0.png',
      backdropPath:
          'https://images.spiderum.com/sp-images/827046d0616911ed94cecd9d570ceaa0.png',
      voteAverage: 10,
      overview: "Kamen Rider Black Sun",
      releaseDate: '22/12/2022',
    ),
    MovieEntity(
      title: "Kamen Rider Shadow Moon",
      posterPath:
          'https://images.spiderum.com/sp-images/f4172010616911ed94cecd9d570ceaa0.jpeg',
      backdropPath:
          'https://images.spiderum.com/sp-images/f4172010616911ed94cecd9d570ceaa0.jpeg',
      voteAverage: 10,
      overview: "Kamen Rider Shadow Moon",
      releaseDate: '22/12/2022',
    ),
    MovieEntity(
      title: "Kamen Rider BlackRx",
      posterPath:
          'https://upload.motgame.vn/photos/motgame-vn/2022/10/d8b4511a0e3e9f2411e195c6774ed481.jpg',
      backdropPath:
          'https://upload.motgame.vn/photos/motgame-vn/2022/10/d8b4511a0e3e9f2411e195c6774ed481.jpg',
      voteAverage: 10,
      overview: "Kamen Rider BlackRx",
      releaseDate: '22/12/2022',
    ),
  ];

  Future<void> loadInitialData() async {
    emit(state.copyWith(loadDataStatus: LoadStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 2));

      //Todo: add API calls
      emit(state.copyWith(
        loadDataStatus: LoadStatus.success,
        movies: movies,
      ));
    } catch (e) {
      //Todo: should print exception here
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

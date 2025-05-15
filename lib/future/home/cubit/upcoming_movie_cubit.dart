import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/locator/locator.dart';
import 'package:movie_app/data/movie_repository.dart';
import 'package:movie_app/future/home/cubit/upcoming_movie_state.dart';

class UpcomingMovieCubit extends Cubit<UpcomingMovieState> {
  UpcomingMovieCubit() : super(UpcomingMovieInitial());

  MovieRepository movieRepository = locator<MovieRepository>();

  Future<void> getUpCommingMovie() async {
    emit(UpcomingMovieLoading());
    final res = await movieRepository.getUpCommingMovie();

    res.fold(
      (error) => emit(UpcomingMovieError(error: error.error)),
      (movies) => emit(UpcomingMovieSuccess(model: movies)),
    );
  }
}

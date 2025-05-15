import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/locator/locator.dart';
import 'package:movie_app/data/movie_repository.dart';
import 'package:movie_app/future/home/cubit/treanding_movie_state.dart';
import 'package:movie_app/future/home/model/movie_model.dart';

class TreandingMovieCubit extends Cubit<TreandingMovieState> {
  TreandingMovieCubit() : super(TreandingMovieInitial());

  final MovieRepository movieRepository = locator<MovieRepository>();

  Future<void> getTreandingMovie() async {
    emit(TreandingMovieLoading());
    final Either<Failure, List<MovieModel>> data =
        await movieRepository.getTrandingMovie();

    data.fold(
      (error) {
        return emit(TreandingMovieError(error: error.error));
      },
      (movieList) {
        return emit(TreandingMovieSuccess(movieModel: movieList));
      },
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/locator/locator.dart';
import 'package:movie_app/data/movie_repository.dart';
import 'package:movie_app/future/home/cubit/toprated_movie_state.dart';
import 'package:movie_app/future/home/model/movie_model.dart';

class TopratedMovieCubit extends Cubit<TopratedMovieState> {
  TopratedMovieCubit() : super(TopratedMovieInitial());

  final MovieRepository movieRepository = locator<MovieRepository>();

  Future<void> getTopRatedMovie() async {
    emit(TopratedMovieLoading());
    final Either<Failure, List<MovieModel>> res =
        await movieRepository.getTopRatedMovie();

    res.fold(
      (error) => emit(TopratedMovieError(error: error.error)),
      (movieModel) => emit(TopratedMovieSuccess(model: movieModel)),
    );
  }
}

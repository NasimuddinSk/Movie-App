import 'package:movie_app/future/home/model/movie_model.dart';

sealed class TreandingMovieState {}

final class TreandingMovieInitial extends TreandingMovieState {}

final class TreandingMovieLoading extends TreandingMovieState {}

final class TreandingMovieSuccess extends TreandingMovieState {
  final List<MovieModel> movieModel;

  TreandingMovieSuccess({required this.movieModel});
}

final class TreandingMovieError extends TreandingMovieState {
  final String error;

  TreandingMovieError({required this.error});
}

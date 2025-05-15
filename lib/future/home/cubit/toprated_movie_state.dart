import 'package:movie_app/future/home/model/movie_model.dart';

sealed class TopratedMovieState {}

final class TopratedMovieInitial extends TopratedMovieState {}

final class TopratedMovieLoading extends TopratedMovieState {}

final class TopratedMovieSuccess extends TopratedMovieState {
  final List<MovieModel> model;

  TopratedMovieSuccess({required this.model});
}

final class TopratedMovieError extends TopratedMovieState {
  final String error;

  TopratedMovieError({required this.error});
}

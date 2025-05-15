import 'package:movie_app/future/home/model/movie_model.dart';

sealed class UpcomingMovieState {}

final class UpcomingMovieInitial extends UpcomingMovieState {}

final class UpcomingMovieLoading extends UpcomingMovieState {}

final class UpcomingMovieSuccess extends UpcomingMovieState {
  final List<MovieModel> model;

  UpcomingMovieSuccess({required this.model});
}

final class UpcomingMovieError extends UpcomingMovieState {
  final String error;

  UpcomingMovieError({required this.error});
}

import 'package:get_it/get_it.dart';
import 'package:movie_app/data/movie_repository.dart';

final locator = GetIt.I;

void setUpLocator() {
  locator.registerLazySingleton<MovieRepository>(() => MovieRepository());
}

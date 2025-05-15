import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:movie_app/core/constrants.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/error/server_excepsion.dart';
import 'package:movie_app/future/home/model/movie_model.dart';
import "package:http/http.dart " as http;

abstract interface class IMovieRepository {
  Future<Either<Failure, List<MovieModel>>> getTrandingMovie();
  Future<Either<Failure, List<MovieModel>>> getTopRatedMovie();
  Future<Either<Failure, List<MovieModel>>> getUpCommingMovie();
}

class MovieRepository extends IMovieRepository {
  // "trending/movie/day?language=en-US&page=1&api_key=";
  // language=en-US&page=1&api_key=

  final Map<String, dynamic> urlQuery = {
    "language": "en-US",
    "page": "1",
    "api_key": Constrants.apiKey,
  };

  @override
  Future<Either<Failure, List<MovieModel>>> getTrandingMovie() async {
    try {
      final uri = Constrants.baseUrl + Constrants.trandingEndPoint;

      final res = await http.get(
        Uri.parse(uri).replace(queryParameters: urlQuery),

        // headers: {'User-Agent': 'FlutterApp/1.0'},
      );

      if (res.statusCode == 200) {
        final decodedData = json.decode(res.body)["results"] as List;

        return right(
          decodedData.map((movie) => MovieModel.fromJson(movie)).toList(),
        );
      } else {
        return left(Failure());
      }
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getTopRatedMovie() async {
    try {
      final url = Constrants.baseUrl + Constrants.topRatedEndPoint;

      final res = await http.get(
        Uri.parse(url).replace(queryParameters: urlQuery),
      );

      final decodedData = json.decode(res.body)["results"] as List;

      return right(
        decodedData.map((movie) => MovieModel.fromJson(movie)).toList(),
      );
    } on ServerException catch (error) {
      return left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getUpCommingMovie() async {
    try {
      final url = Constrants.baseUrl + Constrants.upCommingEndPoint;

      final res = await http.get(
        Uri.parse(url).replace(queryParameters: urlQuery),
      );
      if (res.statusCode == 200) {
        final decodedData = jsonDecode(res.body)["results"] as List;

        return right(
          decodedData.map((movie) => MovieModel.fromJson(movie)).toList(),
        );
      }

      return left(Failure());
    } on ServerException catch (error) {
      return left(Failure(error.message));
    }
  }
}

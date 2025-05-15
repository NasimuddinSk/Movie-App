class MovieModel {
  final String backDropPath;
  final String title;
  final String overView;
  final String posterPath;
  final String releaseDate;
  final double average;

  MovieModel({
    required this.backDropPath,
    required this.title,
    required this.overView,
    required this.posterPath,
    required this.releaseDate,
    required this.average,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      backDropPath: json["backdrop_path"],
      title: json["original_title"],
      overView: json["overview"],
      posterPath: json["poster_path"],
      releaseDate: json["release_date"],
      average: json["vote_average"] as double,
    );
  }
}

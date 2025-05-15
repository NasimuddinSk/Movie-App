import 'package:movie_app/core/app_string.dart';

class Failure {
  final String error;
  const Failure([this.error = AppString.serverError]);
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/locator/locator.dart';
import 'package:movie_app/future/home/cubit/toprated_movie_cubit.dart';
import 'package:movie_app/future/home/cubit/treanding_movie_cubit.dart';
import 'package:movie_app/future/home/cubit/upcoming_movie_cubit.dart';
import 'package:movie_app/future/home/page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setUpLocator();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TreandingMovieCubit()),
        BlocProvider(create: (_) => TopratedMovieCubit()),
        BlocProvider(create: (_) => UpcomingMovieCubit()),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

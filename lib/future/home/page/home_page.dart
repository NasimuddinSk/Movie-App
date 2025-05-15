import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/constrants.dart';
import 'package:movie_app/core/widget/top_and_upcoming.dart';
import 'package:movie_app/extansion/spacing_extansion.dart';
import 'package:movie_app/future/details/page/details.dart';
import 'package:movie_app/future/home/cubit/toprated_movie_cubit.dart';
import 'package:movie_app/future/home/cubit/toprated_movie_state.dart';
import 'package:movie_app/future/home/cubit/treanding_movie_cubit.dart';
import 'package:movie_app/future/home/cubit/treanding_movie_state.dart';
import 'package:movie_app/future/home/cubit/upcoming_movie_cubit.dart';
import 'package:movie_app/future/home/cubit/upcoming_movie_state.dart';
import 'package:movie_app/future/home/model/movie_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<TreandingMovieCubit>().getTreandingMovie();
    context.read<TopratedMovieCubit>().getTopRatedMovie();
    context.read<UpcomingMovieCubit>().getUpCommingMovie();
  }

  @override
  Widget build(Object context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.height,
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  "Trending Movies",
                  style: GoogleFonts.aBeeZee(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),

              BlocBuilder<TreandingMovieCubit, TreandingMovieState>(
                builder: (context, state) {
                  if (state is TreandingMovieSuccess) {
                    return TreandingMovies(model: state.movieModel);
                  }
                  if (state is TreandingMovieError) {
                    return Center(child: Text(state.error));
                  }
                  if (state is TreandingMovieLoading) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,

                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(50),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          width: MediaQuery.of(context).size.width / 4,
                          height: 200,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(50),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          width: MediaQuery.of(context).size.width / 2.5,
                          height: 200,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(50),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          width: MediaQuery.of(context).size.width / 4,
                          height: 200,
                        ),
                      ],
                    );
                  }
                  return SizedBox();
                },
              ),

              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  "Top Rated Movies",
                  style: GoogleFonts.aBeeZee(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),

              BlocBuilder<TopratedMovieCubit, TopratedMovieState>(
                builder: (context, state) {
                  if (state is TopratedMovieSuccess) {
                    return TopAndUpcoming(model: state.model);
                  }
                  if (state is TopratedMovieLoading) {
                    return rowView(context);
                  }

                  if (state is TopratedMovieError) {
                    return Center(child: Text(state.error));
                  }

                  return SizedBox();
                },
              ),

              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  "Upcoming Movies",
                  style: GoogleFonts.aBeeZee(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
              BlocBuilder<UpcomingMovieCubit, UpcomingMovieState>(
                builder: (context, state) {
                  if (state is UpcomingMovieSuccess) {
                    return TopAndUpcoming(model: state.model);
                  }
                  if (state is UpcomingMovieLoading) {
                    return rowView(context);
                  }
                  if (state is UpcomingMovieError) {
                    return Center(child: Text(state.error));
                  }

                  return SizedBox();
                },
              ),
              10.height,
            ],
          ),
        ],
      ),
    );
  }

  Row rowView(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(50),
            borderRadius: BorderRadius.circular(12),
          ),
          width: MediaQuery.of(context).size.width / 1.4,
          height: 200,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(50),
            borderRadius: BorderRadius.circular(12),
          ),
          width: MediaQuery.of(context).size.width / 4,
          height: 200,
        ),
      ],
    );
  }
}

class TreandingMovies extends StatelessWidget {
  final List<MovieModel> model;

  const TreandingMovies({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: model.length,
      options: CarouselOptions(
        autoPlay: true,
        autoPlayAnimationDuration: Duration(seconds: 1),
        enlargeCenterPage: true,
        viewportFraction: 0.4,
      ),
      itemBuilder: (context, index, realIndex) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => Details(model: model[index])),
            );
          },
          child: Hero(
            tag: model[index].posterPath,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                Constrants.imageUrl + model[index].posterPath,
              ),
            ),
          ),
        );
      },
    );
  }
}

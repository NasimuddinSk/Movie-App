import 'package:flutter/material.dart';
import 'package:movie_app/core/constrants.dart';
import 'package:movie_app/future/details/page/details.dart';
import 'package:movie_app/future/home/model/movie_model.dart';

class TopAndUpcoming extends StatelessWidget {
  final List<MovieModel> model;
  const TopAndUpcoming({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: ListView.builder(
        itemCount: model.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 12, right: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Details(model: model[index]),
                  ),
                );
              },
              child: Hero(
                tag: model[index].posterPath,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    Constrants.imageUrl + model[index].posterPath,
                    fit: BoxFit.fill,
                    width: 170,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

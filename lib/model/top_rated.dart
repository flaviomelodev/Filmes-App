import 'package:filme_app/components/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'description.dart';

class TopRatedMovies extends StatelessWidget {
  final List? topRated;

  const TopRatedMovies({Key? key, this.topRated}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: customTheme.backgroundColor,
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filmes + Votados',
              style: Theme.of(context).primaryTextTheme.subtitle1,
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: topRated!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(
                        Description(
                          name: topRated![index]['title'],
                          bannerurl: 'https://image.tmdb.org/t/p/w500' +
                              topRated![index]['backdrop_path'],
                          posterurl: 'https://image.tmdb.org/t/p/w500' +
                              topRated![index]['poster_path'],
                          description: topRated![index]['overview'],
                          vote: topRated![index]['vote_average'].toString(),
                          launch_on: topRated![index]['release_date'],
                        ),
                      );
                    },
                    child: SizedBox(
                      width: 200,
                      child: Column(
                        children: [
                          Container(
                            height: 210,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      topRated![index]['poster_path'],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            topRated![index]['title'] ?? 'Carregando',
                            style: Theme.of(context).primaryTextTheme.subtitle2,
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(context);
                            },
                            child: const Icon(
                              Icons.movie,
                              color: Color(0xFF139893),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

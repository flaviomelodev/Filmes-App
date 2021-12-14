import 'package:filme_app/components/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'description.dart';

class PopularMovies extends StatelessWidget {
  final List? popular;

  const PopularMovies({Key? key, this.popular}) : super(key: key);
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
              'Filmes Populares',
              style: Theme.of(context).primaryTextTheme.subtitle1,
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: popular!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      //Rota para a tela de descrição do filme
                      Get.to(
                        () => Description(
                          name: popular![index]['title'],
                          bannerurl: 'https://image.tmdb.org/t/p/w500' +
                              popular![index]['backdrop_path'],
                          posterurl: 'https://image.tmdb.org/t/p/w500' +
                              popular![index]['poster_path'],
                          description: popular![index]['overview'],
                          vote: popular![index]['vote_average'].toString(),
                          launch_on: popular![index]['release_date'],
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
                                      popular![index]['poster_path'],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            popular![index]['title'] ?? 'Carregando',
                            style: Theme.of(context).primaryTextTheme.subtitle2,
                          ),
                          TextButton(
                            //Rota para a descrição dos filmes
                            // VER SE VAI DEIXAR ASSIM!!!
                            onPressed: () {
                              Get.to(
                                () => Description(
                                  name: popular![index]['title'],
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      popular![index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      popular![index]['poster_path'],
                                  description: popular![index]['overview'],
                                  vote: popular![index]['vote_average']
                                      .toString(),
                                  launch_on: popular![index]['release_date'],
                                ),
                              );
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

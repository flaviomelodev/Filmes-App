import 'package:filme_app/model/top_rated.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import '../components/theme.dart';
import '../model/popular_movies.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => AppWidgetState();
}

class AppWidgetState extends State<AppWidget> {
  List popularMovies = [];
  List topRatedMovies = [];

  final String apiKey = 'cc4e3dbe55ff1cd5d6af570381b2ec6f';
  final apiReadAcessTokenV4 =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjYzRlM2RiZTU1ZmYxY2Q1ZDZhZjU3MDM4MWIyZWM2ZiIsInN1YiI6IjYwYjUwOWExYzU4YWNkMDAyYjJkOTk1YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.gWsxfs-gscvPoha-PkMwIH11C4YN-hkEUrvdASo-4gk';
  //Controle de atualização da tela

  // ignore: prefer_typing_uninitialized_variables
  var popularResult;
  // ignore: prefer_typing_uninitialized_variables
  var topRatedResult;

  @override
  void initState() {
    loadMovies();

    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, apiReadAcessTokenV4),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    popularResult = await tmdbWithCustomLogs.v3.movies.getPouplar();
    topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();

    setState(() {
      popularMovies = popularResult['results'];
      topRatedMovies = topRatedResult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: customTheme.backgroundColor,
          elevation: 1,
          centerTitle: true,
          title: const Text(
            'FILMES App',
            style: TextStyle(
              color: Color(0xFF139893),
              fontSize: 22,
              fontFamily: 'Roboto',
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(
                Icons.refresh,
              ),
            ),
          ],
        ),
        body: Container(
          color: customTheme.backgroundColor,
          // Lista dos filmes: populares e mais votados
          child: ListView(
            children: [
              PopularMovies(
                popular: popularMovies,
              ),
              TopRatedMovies(
                topRated: topRatedMovies,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: non_constant_identifier_names

import 'package:filme_app/components/theme.dart';
import 'package:flutter/material.dart';

// Modelo para as telas de filmes populares e mais votados

class Description extends StatelessWidget {
  final String? name, description, bannerurl, posterurl, vote, launch_on;

  const Description(
      {Key? key,
      this.name,
      this.description,
      this.bannerurl,
      this.posterurl,
      this.vote,
      this.launch_on})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: customTheme.backgroundColor,
        body: ListView(
          children: [
            SizedBox(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerurl!,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Text(
                      '⭐ Votos - ' + vote!,
                      style: Theme.of(context).primaryTextTheme.subtitle2,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                name ?? 'Erro ao carregar',
                style: Theme.of(context).primaryTextTheme.subtitle1,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Lançamento - ' + launch_on!,
                style: Theme.of(context).primaryTextTheme.subtitle1,
              ),
            ),
            Row(
              children: [
                SizedBox(
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl!),
                ),
                Flexible(
                    child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    description!,
                    style: Theme.of(context).primaryTextTheme.subtitle1,
                  ),
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomeHeroiDetalhes extends StatelessWidget {
  HomeHeroiDetalhes({this.heroi});

  late final heroi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(heroi.name),
      ),
      body: Column(
        children: [
          Image.network(
            '${heroi.thumbnail.path}.${heroi.thumbnail.extension}',
            fit: BoxFit.cover,
          ),
          Text(heroi.description),
        ],
      ),
    );
  }

  _voltarMenu(context) {
    Navigator.pop(context);
  }
}

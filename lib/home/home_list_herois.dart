import 'package:flutter/material.dart';
import 'package:marvelapi/controller/heroi_controller.dart';
import 'package:marvelapi/home/home_heroi_detalhes.dart';

class HomeListHerois extends StatelessWidget {
  HomeListHerois({this.listaHerois});

  late final listaHerois;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Heróis Buscados'),
      ),
      body: GridView.builder(
        itemCount: listaHerois.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          var heroiDaVez = listaHerois[index];
          return _constroiHeroiVez(heroiDaVez, index, context);
        },
      ),
    );
  }

  Widget _constroiHeroiVez(heroiDaVez, index, context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HomeHeroiDetalhes(
                heroi: heroiDaVez,
              );
            },
          ),
        );
      },
      child: Card(
        elevation: 5,
        shadowColor: Colors.grey,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              '${heroiDaVez.thumbnail.path}.${heroiDaVez.thumbnail.extension}',
              fit: BoxFit.cover,
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(321))),
                child: Container(
                  child: 
                    Text(
                      listaHerois[index].name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

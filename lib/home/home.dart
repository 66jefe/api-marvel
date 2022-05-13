import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:marvelapi/controller/heroi_controller.dart';
import 'package:marvelapi/home/home_list_herois.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final heroiController = HeroiController();
  final _textPesquisaController = TextEditingController();
  var carregando = false;

  @override
  void initState() {
    heroiController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MARVEL'),
      ),
      body: _constroiBody(),
    );
  }

  Widget _constroiBody() {
    return Center(
      child: Column(
        children: [
          Image.network(
              'https://upload.wikimedia.org/wikipedia/pt/3/30/Universo_Marvel.png'),
          const Text(
            'Carregar herois',
            style: TextStyle(fontSize: 25),
          ),
          Expanded(
            child: Container(
              height: 20,
              margin: const EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width,
              child: TextField(
                controller: _textPesquisaController,
                decoration: const InputDecoration(
                    hintText: 'Digite herói a ser pesquisado'),
              ),
            ),
          ),
          Expanded(
            child: _constroiBotao(),
          ),
        ],
      ),
    );
  }

  Widget _constroiBotao() {
    if (!heroiController.carregando) {
      return TextButton(
        onPressed: () {
          buscarHerois();
        },
        child: Text(_controiTituloBotao()),
      );
    }
    return _constroiCarregando();
  }

  String _controiTituloBotao() {
    if (heroiController.listaHerois.isEmpty) {
      return 'BUSCAR';
    } else if (heroiController.carregando) {
      return 'CARREGANDO';
    }
    return 'AVANÇAR';
  }

  Widget _constroiCarregando() {
    if (heroiController.carregando) {
      return const CircularProgressIndicator();
    }
    return SizedBox();
  }

  void buscarHerois() {
    if (heroiController.listaHerois.isNotEmpty) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => HomeListHerois(
                    listaHerois: heroiController.listaHerois,
                  )));
    }
    if (_textPesquisaController.text.isEmpty) {
      heroiController.buscarHerois();
    } else {
      heroiController.buscarHeroisPesquisa(_textPesquisaController.text);
    }
  }
}

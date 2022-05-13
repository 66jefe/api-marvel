//@dart=2.9
import 'package:flutter/material.dart';
import 'package:marvelapi/home/home.dart';
import 'package:marvelapi/home/home_heroi_detalhes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/':(_) => const HomePage(),
        '/detalhes':(_) => HomeHeroiDetalhes(), 
      },
    );
  }
}

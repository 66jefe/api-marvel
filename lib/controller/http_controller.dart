import 'dart:convert';
import 'package:crypto/crypto.dart';

class HttpController {
  final _url = 'http://gateway.marvel.com/v1/public/characters';
  final _publicKey = '3a396f93250dda9db9b4c99f0bdf633c';
  final _privateKey = 'ce18d9e69715963e321585b0cc63c066ec1a23c2';
  var _timeStamp;
  late var _hash;
  late var _urlFinal;

  void getHash() {
    _timeStamp = DateTime.now();
    var cripto = _timeStamp.toIso8601String() + _privateKey + _publicKey;
    _hash = md5.convert(utf8.encode(cripto)).toString();
  }

  String getUrlFinal() {
    getHash();
    _urlFinal =
        '$_url?ts=${_timeStamp.toIso8601String()}&apikey=$_publicKey&hash=$_hash&limit=50';
    return _urlFinal;
  }

  String getUrlFinalPesquisa(String nomePesquisa) {
    getHash();
    _urlFinal =
        '$_url?ts=${_timeStamp.toIso8601String()}&apikey=$_publicKey&hash=$_hash&limit=100&nameStartsWith=$nomePesquisa';
    return _urlFinal;
  }



  String get url => _url;
  String get timeStamp => _timeStamp.toString();
  String get privateKey => _privateKey;
}

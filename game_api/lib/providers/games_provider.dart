import 'dart:async';

import 'package:game_api/models/games_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GamesProvider{

  String _url = 'freetogame.com';
  String _sortBy = 'popularity';
  String _platForm = 'pc';

  int _platformsPage = 0;

  List<Game> _platforms = [];
  final _platformsStreamController = StreamController<List<Game>>.broadcast();

  //Método para cerrar el stream
  void disposeStream(){
    _platformsStreamController.close();
  }

  //inserta información al stream:
  Function(List<Game>) get platformsSink => _platformsStreamController.sink.add;

  //Escucha información del stream
  Stream<List<Game>> get platformsStream => _platformsStreamController.stream;

  //método que hace la petición a get-relevens
  Future<List<Game>> getRelevantes() async {

    final url = Uri.https(_url, 'api/games',{
      'sort-by': _sortBy,
    });

    final resp = await http.get(url);

    //decodificamos la respuesta
    final decodedData = json.decode(resp.body);
    
    //print(decodedData['results']);
    final games = new Games.fromJsonList(decodedData);

    return games.items;

    //print(decodedData);
    //return [];

  }

  //Método que hace la petición a plataformas de juegos:
  
  Future<List<Game>> getPlatforms() async {

    final url = Uri.https(_url, 'api/games',{
      'platform': _platForm,
    });

    final resp = await http.get(url);

    //decodificamos la respuesta
    final decodedData = json.decode(resp.body);
    
    //print(decodedData['results']);
    final games = new Games.fromJsonList(decodedData);

    return games.items;

    //print(decodedData);
    //return [];

  }

}
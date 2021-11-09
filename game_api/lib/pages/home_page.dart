import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:game_api/providers/games_provider.dart';
import 'package:game_api/models/games_model.dart';
import 'package:game_api/widgets/card_swiper_widget.dart';
import 'package:game_api/widgets/game_horizontal.dart';

class HomePage extends StatelessWidget {
  final gamesProvider = GamesProvider();

  @override
  Widget build(BuildContext context) {
    gamesProvider.getRelevantes();
    gamesProvider.getPlatforms();

    return Scaffold(
      appBar: AppBar(
        title: Text('Los mejores juegos gratis'),
        backgroundColor: Colors.deepPurple[300],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _crearSwiper(),
              SizedBox(
                height: 30.0,
              ),
              Text(
                //padding: EdgeInsets.only(left: 20.0),
                'Juegos para PC:',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              _crearCarrusel(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _crearSwiper() {
    return FutureBuilder(
        future: gamesProvider.getRelevantes(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return CardSwiper(
              games: snapshot.data as List<Game>,
            );
          } else {
            return Container(
              height: 400.0,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }

  Widget _crearCarrusel(){
    return FutureBuilder(
        future: gamesProvider.getPlatforms(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return CardSwiper2(
              games: snapshot.data as List<Game>,
            );
          } else {
            return Container(
              height: 400.0,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }

}

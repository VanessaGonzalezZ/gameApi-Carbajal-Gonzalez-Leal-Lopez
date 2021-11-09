import 'package:game_api/models/games_model.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class CardSwiper2 extends StatelessWidget {
  final List<Game> games;

  const CardSwiper2({Key? key, required this.games}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 20.0),
      /* width: double.infinity,
      height: 300.0, */
      child: Swiper(
        layout: SwiperLayout.TINDER,
        itemWidth: _screenSize.width * 0.8,
        itemHeight: _screenSize.height * 0.3,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              image: NetworkImage(games[index].getThumbnail()),
              placeholder: AssetImage('assets/img/no-image.jpg'),
              fit: BoxFit.fill,
            ),
          );
          //return new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
        },
        itemCount: games.length,
        viewportFraction: 0.8,
        scale: 0.9,
        //control: new SwiperControl(),
      ),
    );
  }
}

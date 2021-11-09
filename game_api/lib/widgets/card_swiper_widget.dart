import 'package:game_api/models/games_model.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class CardSwiper extends StatelessWidget {
  final List<Game> games;

  const CardSwiper({Key? key, required this.games}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 30.0),
      /* width: double.infinity,
      height: 300.0, */
      child: Swiper(
        layout: SwiperLayout.CUSTOM,
        customLayoutOption:
            new CustomLayoutOption(startIndex: -1, stateCount: 3)
                .addRotate([-45.0 / 180, 0.0, 45.0 / 180]).addTranslate([
          new Offset(-370.0, -40.0),
          new Offset(0.0, 0.0),
          new Offset(370.0, -40.0)
        ]),
        itemWidth: _screenSize.width * 0.9,
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
        //pagination: new SwiperPagination(),
        //control: new SwiperControl(),
      ),
    );
  }
}

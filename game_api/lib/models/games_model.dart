class Games {

  List<Game> items = [];

  Games();

  Games.fromJsonList( List<dynamic> jsonList  ) {

    if ( jsonList == null ) return;

    for ( var item in jsonList  ) {
      final game = new Game.fromJsonMap(item);
      items.add( game );
    }

  }

}

class Game {
  int? id;
  String? title;
  String? thumbnail;
  String? shortDescription;
  String? gameUrl;
  String? genre;
  String? platform;
  String? publisher;
  String? developer;
  String? releaseDate;
  String? freetogameProfileUrl;

  Game(
    {
      this.id,
      this.title,
      this.thumbnail,
      this.shortDescription,
      this.gameUrl,
      this.genre,
      this.platform,
      this.publisher,
      this.developer,
      this.releaseDate,
      this.freetogameProfileUrl
    }
  );

  Game.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    shortDescription = json['short_description'];
    gameUrl = json['game_url'];
    genre = json['genre'];
    platform = json['platform'];
    publisher = json['publisher'];
    developer = json['developer'];
    releaseDate = json['release_date'];
    freetogameProfileUrl = json['freetogame_profile_url'];
  }

  //Método para obtener la imagen del juego
  getThumbnail(){
    if(thumbnail == null){
      return 'https://www.freeiconspng.com/thumbs/no-image-icon/no-image-icon-6.png';
    }else{
      return '$thumbnail';
    }
  }

}
class TeamModel {
  String ?name;
  String? flag;
  int? play;
  int?win;
  int?lose;
  int?draw;
  int ?gd;
  int ?points;
  int ?position;


  TeamModel(this.name, this.flag, this.play, this.win, this.lose, this.draw,
      this.gd, this.points);

  TeamModel.fromJson(Map<String,dynamic >json){
    name=json['name'];
    flag=json['flag'];
    play=json['play'];
    win=json['win'];
    lose=json['lose'];
    draw=json['draw'];
    gd=json['gd'];
    points=json['points'];
    position=json['position'];

  }

  Map<String ,dynamic> toMap(){
    return {
      'name':name,
      'flag':flag,
      'play':play,
      'win':win,
      'lose':lose,
      'draw':draw,
      'gd':gd,
      'points':points,
      'position':position,

    };
  }
}
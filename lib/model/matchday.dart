class MatchDayModel {
  String ?firstTeamName;
  int ?firstTeamGoals;
  String ?firstTeamLogo;
  String? secondTeamName;
  int? secondTeamGoals;
  String? secondTeamLogo;
  bool? isPlaying;
  String? time;
  String? date;
  int ?day;



  MatchDayModel(
      this.firstTeamName,
      this.firstTeamGoals,
      this.firstTeamLogo,
      this.secondTeamName,
      this.secondTeamGoals,
      this.secondTeamLogo,
      this.isPlaying,
      this.time,

      );

  MatchDayModel.fromJson(Map<String,dynamic >json){
    firstTeamName=json['firstteamname'];
    secondTeamName=json['secondteamname'];
    firstTeamGoals=json['firstteamgoals'];
    secondTeamGoals=json['secondteamgoals'];
    firstTeamLogo=json['firstteamlogo'];
    secondTeamLogo=json['secondteamlogo'];
    isPlaying=json['isplaying'];
    time=json['time']??'';
    date=json['date']??'';
    day=json['day']??0;

  }

  Map<String ,dynamic> toMap(){
    return {
      'firstteamname':firstTeamName,
      'secondteamname':secondTeamName,
      'firstteamgoals':firstTeamGoals,
      'secondteamgoals':secondTeamGoals,
      'firstteamlogo':firstTeamLogo,
      'secondteamlogo':secondTeamLogo,
      'isplaying':isPlaying,
      'time':time,

    };
  }
}
class MatchDayDateModel {
  String? date;
  bool? isLive;





  MatchDayDateModel.fromJson(Map<String,dynamic >json){
    date=json['date'];
    isLive=json['isLive'];
  }

  Map<String ,dynamic> toMap(){
    return {
      'date':date,
      'isLive':isLive,
    };
  }
}
// class MatchWeekModel{
//   String? date;
//   int ?day;
//   String ?firstTeamName;
//   int ?firstTeamGoals;
//   String ?firstTeamLogo;
//   String? secondTeamName;
//   int? secondTeamGoals;
//   String? secondTeamLogo;
//   bool? isPlaying;
//   String? time;
//
//   MatchWeekModel.fromJson(Map<String,dynamic >json){
//     date=json['date'];
//     day=json['day'];
//     firstTeamName=json['firstteamname'];
//     secondTeamName=json['secondteamname'];
//     firstTeamGoals=json['firstteamgoals'];
//     secondTeamGoals=json['secondteamgoals'];
//     firstTeamLogo=json['firstteamlogo'];
//     secondTeamLogo=json['secondteamlogo'];
//     isPlaying=json['isplaying'];
//     time=json['time'];
//
//   }
//
//   Map<String ,dynamic> toMap(){
//     return {
//       'date':date,
//       'day':day,
//       'firstteamname':firstTeamName,
//       'secondteamname':secondTeamName,
//       'firstteamgoals':firstTeamGoals,
//       'secondteamgoals':secondTeamGoals,
//       'firstteamlogo':firstTeamLogo,
//       'secondteamlogo':secondTeamLogo,
//
//     };
//   }
// }
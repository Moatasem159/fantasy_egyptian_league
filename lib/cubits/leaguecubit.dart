import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantasy/model/matchday.dart';
import 'package:fantasy/model/teammodel.dart';
import 'package:fantasy/states/leaguestates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeagueCubit extends Cubit<LeagueStates>{

  LeagueCubit (): super(LeagueInitialState());
  static LeagueCubit get(context)=>BlocProvider.of(context);




  List<TeamModel> ?shortLeagueTeams;
  getShortLeagueTable()async{
    emit(GetLeagueTableLoadingState());
    FirebaseFirestore.instance
        .collection("league table")
        .snapshots()
        .listen((teams){
          shortLeagueTeams=[];
          for (var team in teams.docs){
            if(TeamModel.fromJson(team.data()).position!<=4) {
              shortLeagueTeams!.add(TeamModel.fromJson(team.data()));
            }
          }
          shortLeagueTeams!.sort((item1,item2)=>item1.position!.compareTo(item2.position!));
          emit(GetLeagueTableSuccessState());
    });
  }



  List<TeamModel> ?leagueTeams;
  getLeagueTable()async{
    emit(GetLeagueTableLoadingState());
    FirebaseFirestore.instance
        .collection("league table")
        .snapshots()
        .listen((teams){
      leagueTeams=[];
      for (var team in teams.docs){
          leagueTeams!.add(TeamModel.fromJson(team.data()));
      }
      leagueTeams!.sort((item1,item2)=>item1.position!.compareTo(item2.position!));
      emit(GetLeagueTableSuccessState());
    });
  }


  List<MatchDayModel> ? matchDay;
  List<MatchDayDateModel> ? matchDayDateModel;
  getMatchDay()async{
    emit(GetMatchDayLoadingState());
    await FirebaseFirestore.instance
        .collection("matchday date")
    .get()
    .then((value){
      matchDayDateModel=[];
      for (var element in value.docs) {
        matchDayDateModel!.add(MatchDayDateModel.fromJson(element.data()));
      }});
     FirebaseFirestore.instance
     .collection("matchweek")
     .get()
     .then((matches){
       matchDay=[];
       for (var match in matches.docs) {
         if(MatchDayModel.fromJson(match.data()).date==matchDayDateModel![0].date){
           matchDay!.add(MatchDayModel.fromJson(match.data()));
         }
       }
       matchDay!.sort((item1,item2)=>item1.time!.compareTo(item2.time!));
       emit(GetMatchDaySuccessState());
     });
  }


  List<MatchDayModel> ? matchWeekModel;

  getMatchweek()async{
    emit(GetMatchWeekLoadingState());
    FirebaseFirestore.instance
        .collection("matchweek")
        .get()
        .then((days){
          matchWeekModel=[];
          for (var day in days.docs) {
            matchWeekModel!.add(MatchDayModel.fromJson(day.data()));
                }
          matchWeekModel!.sort((item1,item2)=>item1.day!.compareTo(item2.day!));
      emit(GetMatchWeekSuccessState());
        });



  }














}
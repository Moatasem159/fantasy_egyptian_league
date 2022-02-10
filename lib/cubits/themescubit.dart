import 'package:fantasy/assets/icons/myicons.dart';
import 'package:fantasy/screens/fantasyscreen.dart';
import 'package:fantasy/screens/latestscreen.dart';
import 'package:fantasy/screens/leaguescreen.dart';
import 'package:fantasy/screens/morescreen.dart';
import 'package:fantasy/screens/statsscreen.dart';
import 'package:fantasy/states/themesstates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ThemeCubit extends Cubit<ThemesStates>{

  ThemeCubit():super(ThemeInitialState());
  static ThemeCubit get(context)=>BlocProvider.of(context);


  int current = 0;
  List<BottomNavigationBarItem> navigationItems =
  [
    const BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.newspaper), label: "Latest"),
    const BottomNavigationBarItem(icon: Icon(MyIcons.eplLogo,size: 24,), label: "EL"),
    const BottomNavigationBarItem(icon: Icon(LineAwesomeIcons.t_shirt), label: "fantasy"),
    const BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "stats"),
    const BottomNavigationBarItem(icon: Icon(Icons.more_vert_sharp), label: "more"),
  ];
  List<Widget> screens =
  [
    const LatestScreen(),
    const LeagueScreen(),
    const FantasyScreen(),
    const StatsScreen(),
    const MoreScreen()
  ];

  void changeIndex(int index){
    current=index;
    emit(ChangeBottomNavBarState());
  }






}
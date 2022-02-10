import 'package:fantasy/cubits/leaguecubit.dart';
import 'package:fantasy/cubits/themescubit.dart';
import 'package:fantasy/helper/myblocobserver.dart';
import 'package:fantasy/helper/mysharedpreferences.dart';
import 'package:fantasy/screens/mainscreen.dart';
import 'package:fantasy/states/themesstates.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await MyShared.init();
  BlocOverrides.runZoned(
          () {
            runApp(const MyApp());
      },blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers:[
      BlocProvider(create: (context) => ThemeCubit(),),
      BlocProvider(create: (context) => LeagueCubit()..getShortLeagueTable()..getMatchDay()..getMatchweek(),),
    ],
        child:BlocConsumer<ThemeCubit,ThemesStates>(
            listener:(context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const MainScreen(),
            );
          },
        )
    );
  }
}





import 'package:fantasy/cubits/themescubit.dart';
import 'package:fantasy/states/themesstates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeCubit,ThemesStates>(
        listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: ThemeCubit.get(context).screens[ThemeCubit.get(context).current],
          bottomNavigationBar: BottomNavigationBar(
              elevation: 0,
              // unselectedItemColor: Theme.of(context).primaryColorLight,
              // backgroundColor: Theme.of(context).primaryColor,
              // selectedItemColor: Theme.of(context).primaryColorDark,
              // unselectedLabelStyle: Theme.of(context).textTheme.subtitle1,
              // selectedLabelStyle:Theme.of(context).textTheme.subtitle1,
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                ThemeCubit.get(context).changeIndex(value);
              },
              currentIndex: ThemeCubit.get(context).current,
              items:  ThemeCubit.get(context).navigationItems),
        );
      },
    );
  }
}
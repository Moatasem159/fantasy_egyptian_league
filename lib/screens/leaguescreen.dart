import 'package:flutter/material.dart';

class LeagueScreen extends StatelessWidget {
  const LeagueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body:Center(child: Text("Egyptian league")),
      ),
    );
  }
}
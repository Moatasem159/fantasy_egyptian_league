import 'package:fantasy/cubits/fantasycubit.dart';
import 'package:fantasy/states/fantasystates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateTeamScreen extends StatelessWidget {
  const CreateTeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FantasyCubit(),
      child: BlocConsumer<FantasyCubit,FantasyStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
              child:
              Scaffold(
                appBar: AppBar(
                  title: const Text("Create team"),
                ),
                body: Column(

                  children: [

                    fieldWithPlayers()
                  ],
                ),
              ));

        },),
    );
  }

  Widget field(){
    return  Stack(
      children:  [
        Column(
          children: [
            Container(
              color: Colors.green,
              height: 100,
              width: 400,
            ),
            Container(
              color: Colors.green[600],
              height:50,
              width: 400,
            ),
            Container(
              color: Colors.green,
              height: 50,
              width: 400,
            ),
            Container(
              color: Colors.green[600],
              height: 50,
              width: 400,
            ),
            Container(
              color: Colors.green,
              height: 50,
              width: 400,
            ),
            Container(
              color: Colors.green[600],
              height: 50,
              width: 400,
            ),
            Container(
              color: Colors.green,
              height: 50,
              width: 400,
            ),
            Container(
              color: Colors.green[600],
              height: 50,
              width: 400,
            ),
            Container(
              color: Colors.green,
              height: 10,
              width: 400,
            ),
          ],
        ),
        //العارضه
        Positioned(
          top: 10,
          left: 140,
          right: 140,
          child: Container(
            decoration:  const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 2, color: Colors.white),
                  left: BorderSide(width: 2, color: Colors.white),
                  right: BorderSide(width: 2, color: Colors.white),
                )
            ),
            height:31,
          ),
        ),
        //الملعب
        Positioned(
          top: 40,
          left: 5.5,
          child: Container(
            decoration:  const BoxDecoration(
                border: Border(
                  right: BorderSide(width: 1, color: Colors.white),
                  left:  BorderSide(width: 1, color: Colors.white),
                  top:  BorderSide(width: 1, color: Colors.white),
                )
            ),
            height:440,
            width: 350,
          ),
        ),
        // خط ال18
        Positioned(
          top: 40,
          left: 50,
          right: 50,
          child: Container(
            decoration:  BoxDecoration(
                border: Border.all(width: 1, color: Colors.white)
            ),
            height:65,
          ),
        ),
        //قوس ال18
        Positioned(
          top: 104,
          left: 120,
          right: 120,
          child: Container(
            decoration:  const BoxDecoration(
              border: Border(
                top: BorderSide(width: 1, color: Colors.white,),
                left: BorderSide(width: 1, color: Colors.white),
                right: BorderSide(width: 1, color: Colors.white),
                bottom: BorderSide(width: 1, color: Colors.white),
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(90),
                bottomRight: Radius.circular(90),
                topLeft: Radius.circular(0),
              ),
            ),
            height:25,
          ),
        ),
        // خط ال 6
        Positioned(
          top: 40,
          left: 100,
          right: 100,
          child: Container(
            decoration:  BoxDecoration(
                border: Border.all(width: 1, color: Colors.white)
            ),
            height:40,
          ),
        ),
        //خط الستنر
        Positioned(
          top: 265,
          left: 5,
          right: 5,
          child: Container(
            decoration:  BoxDecoration(
                border: Border.all(width: 1, color: Colors.white)
            ),
            height:1,
          ),
        ),
        //دايره السنتر
        Positioned(
          top: 200,
          left: 5,
          right: 5,
          child: Container(
            decoration:  BoxDecoration(
                border: Border.all(width: 1, color: Colors.white),
                shape: BoxShape.circle
            ),
            height:130,
          ),
        ),
      ],
    );
  }

  Widget fieldWithPlayers(){
    return Stack(
      children: [
        field(),
        Column(
          children:const [],
        )
      ],
    );
  }
}

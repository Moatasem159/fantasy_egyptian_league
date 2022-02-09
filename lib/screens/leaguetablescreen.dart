import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fantasy/assets/icons/myicons.dart';
import 'package:fantasy/cubits/leaguecubit.dart';
import 'package:fantasy/global/constwidget.dart';
import 'package:fantasy/states/leaguestates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LeagueTableScreen extends StatelessWidget {
  const LeagueTableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      LeagueCubit.get(context).getLeagueTable();
      return BlocConsumer<LeagueCubit,LeagueStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return  SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    myAppBar(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20,left: 20,top: 25),
                            child: Container(
                              decoration: const BoxDecoration(gradient: LinearGradient(colors:[
                                Colors.red,
                                Colors.purple
                              ])),
                              width: double.infinity,
                              height: 10,
                            ),
                          ),
                          Column(
                            children: [
                              const SizedBox( height: 30,),
                              Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ) ,
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text("League Table",style: GoogleFonts.beVietnamPro(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17
                                            ) ,),
                                            const Spacer(),
                                            const Icon(MyIcons.eplLogo)
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Container(
                                          width: MediaQuery.of(context).size.width-20,
                                          height: 1,
                                          color: Colors.black,
                                        ),
                                      ),
                                      ConditionalBuilder(condition: LeagueCubit.get(context).leagueTeams !=null,
                                        builder: (context) {
                                          return  Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                                child: SingleChildScrollView(
                                                  child: DataTable(
                                                    columnSpacing: 45,
                                                    dividerThickness: 3,
                                                    headingRowHeight:25,
                                                    horizontalMargin: 10,
                                                    dataRowHeight: 45,
                                                    headingTextStyle:GoogleFonts.karla(color: Colors.black),
                                                    dataTextStyle:GoogleFonts.karla(color: Colors.black,),
                                                    showBottomBorder: true,
                                                    columns: const [
                                                      DataColumn(label: Text("pos",)),
                                                      DataColumn(label: Text("club")),
                                                      DataColumn(label: Text("P")),
                                                      DataColumn(label: Text("W")),
                                                      DataColumn(label: Text("L")),
                                                      DataColumn(label: Text("D")),
                                                      DataColumn(label: Text("GD")),
                                                      DataColumn(label: Text("Pts")),],
                                                    rows: LeagueCubit.get(context)
                                                        .leagueTeams!
                                                        .map((e) =>
                                                        DataRow(cells: [
                                                          DataCell(Center(child: Text(e.position.toString()))),
                                                          DataCell(Row(
                                                            children: [
                                                              Image(
                                                                width: 15,
                                                                image: NetworkImage(e.flag!),
                                                              ),
                                                              Text(e.name!),
                                                            ],
                                                          )),
                                                          DataCell(Text(e.play.toString())),
                                                          DataCell(Text(e.win.toString())),
                                                          DataCell(Text(e.lose.toString())),
                                                          DataCell(Text(e.draw.toString())),
                                                          DataCell(Text(e.gd.toString())),
                                                          DataCell(Text(e.points.toString())),
                                                        ]))
                                                        .toList(),
                                                  ),
                                                  scrollDirection:Axis.horizontal,
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                        fallback:(context) => const Center(child: CircularProgressIndicator()),
                                      ),


                                    ],
                                  )

                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },);
  }
}

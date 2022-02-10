import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fantasy/assets/icons/myicons.dart';
import 'package:fantasy/cubits/leaguecubit.dart';
import 'package:fantasy/global/constwidget.dart';
import 'package:fantasy/model/matchday.dart';
import 'package:fantasy/states/leaguestates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LatestScreen extends StatelessWidget {
  const LatestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LeagueCubit,LeagueStates>(
        listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: RefreshIndicator(
            onRefresh: () {
               LeagueCubit.get(context).getMatchDay();
             return  LeagueCubit.get(context).getMatchweek();
            },
            child: Scaffold(
              body: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.blue,
                      Colors.purpleAccent,
                    ],
                      begin: Alignment.center,
                      end: Alignment.topRight,
                    )
                ),
                width: double.infinity,
                height:double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children:  [
                      myAppBar(),
                      //matchday tile
                      ConditionalBuilder(
                          condition:LeagueCubit.get(context).matchDay!=null && LeagueCubit.get(context).matchDayDateModel != null && LeagueCubit.get(context).matchDayDateModel![0].isLive==true,
                          builder:(context) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Matchday Live",style: GoogleFonts.beVietnamPro(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17
                                  ) ,),
                                  Text(LeagueCubit.get(context).matchDayDateModel![0].date!,style: GoogleFonts.beVietnamPro(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13
                                  ) ,),
                                  const SizedBox(height: 15,),
                                  ListView.separated(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: LeagueCubit.get(context).matchDay!.length,
                                    itemBuilder: (context, index) => matchDayTile(
                                      model: LeagueCubit.get(context).matchDay![index]
                                    ),
                                    separatorBuilder: (context, index) => const SizedBox(height: 10,),
                                  )
                                ],
                              ),
                            );
                          },
                          fallback: (context) => const SizedBox(),),
                      //matchweek tile
                      ConditionalBuilder(condition:LeagueCubit.get(context).matchWeekModel!=null,
                         builder:(context) {
                           return  Padding(
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
                                     height: 30,
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.symmetric(horizontal: 0),
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       const SizedBox(height: 30,),
                                       Container(
                                           decoration: const BoxDecoration(
                                             color: Colors.white,
                                           ) ,
                                           width: double.infinity,
                                           child: Column(
                                             children: [
                                               Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: Row(
                                                   children: [
                                                     Text("Matchweek 15",style: GoogleFonts.beVietnamPro(
                                                         fontWeight: FontWeight.bold,
                                                         fontSize: 17
                                                     ) ,),
                                                     const Spacer(),
                                                     const Icon(MyIcons.eplLogo)
                                                   ],
                                                 ),
                                               ),
                                               Container(
                                                 width: 200,
                                                 height: 1,
                                                 color: Colors.black,
                                               ),
                                               ListView.builder(
                                                 shrinkWrap: true,
                                                 physics: const NeverScrollableScrollPhysics(),
                                                 itemCount:LeagueCubit.get(context).matchWeekModel!.length,
                                                   itemBuilder:(context, index) {
                                                      return matchWeekTile(model: LeagueCubit.get(context).matchWeekModel![index]);
                                                   },),
                                             ],
                                           )

                                       ),
                                     ],
                                   ),
                                 ),
                               ],
                             ),
                           );
                         },
                         fallback: (context) => const SizedBox(),),
                      //league table
                      ConditionalBuilder(
                          condition:  LeagueCubit.get(context).shortLeagueTeams !=null,
                          builder: (context) {
                            return Padding(
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
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 8),
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
                                                        DataColumn(label: Text("GD")),
                                                        DataColumn(label: Text("Pts")),],
                                                      rows: LeagueCubit.get(context)
                                                          .shortLeagueTeams!
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
                                                            DataCell(Text(e.gd.toString())),
                                                            DataCell(Text(e.points.toString())),
                                                          ]))
                                                          .toList(),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      TextButton(
                                                          style: ButtonStyle(
                                                              overlayColor: MaterialStateProperty.all(const Color(0x00000000)),
                                                              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 5)),
                                                              textStyle: MaterialStateProperty.all(GoogleFonts.karla()),
                                                              foregroundColor: MaterialStateProperty.all(Colors.black),
                                                              fixedSize: MaterialStateProperty.all(const Size(90,5))
                                                          ),
                                                          onPressed: (){
                                                            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LeagueTableScreen(),));
                                                          },
                                                          child: Row(
                                                            children: const [
                                                              Text("Full table"),
                                                              Icon(Icons.arrow_forward_sharp,size: 20,)
                                                            ],
                                                          ))
                                                    ],),
                                                ],
                                              ),
                                            ],
                                          )
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          fallback: (context) => Container(height: 200,),),
                      //newsTile
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20, left: 20, top: 25),
                              child: Container(
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [Colors.red, Colors.purple])),
                                width: double.infinity,
                                height: 10,
                              ),
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Latest news",
                                                style: GoogleFonts.beVietnamPro(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17),
                                              ),
                                              const Spacer(),
                                              const Icon(MyIcons.eplLogo)
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context).size.width-350),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width - 20,
                                            height: 1,
                                            color: Colors.black,
                                          ),
                                        ),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount: 5,
                                            itemBuilder:(context, index) =>latestNewsTile(context: context) ,
                                        ),


                                      ],
                                    )),
                              ],
                        ),
                      ],
                    ),
                  ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget matchWeekTile({required MatchDayModel model})
  {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //firstTeamName
          Expanded(
            flex: 1,
            child: Align(
              alignment:Alignment.centerRight,
                child: Text(model.firstTeamName!)),
          ),
          const SizedBox(width: 5,),
          //logosAndTime
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: 10,
                    child: Image(
                      height: 35,
                      image: NetworkImage(model.firstTeamLogo!),
                    ),
                  ),
                ),
                if(!model.isPlaying!)
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(model.time!,
                            style: GoogleFonts.aBeeZee()),
                        if(model.date!='')
                        Text(model.date!,
                            style: GoogleFonts.aBeeZee(
                              fontSize: 6
                            )),
                      ],
                    )),
                if(model.isPlaying!)
                  Expanded(child:
                  Container(
                    width: 40,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: Center(child: Text(model.firstTeamGoals!.toString(),style: const TextStyle(color: Colors.white),))),
                        Container(width: 1,height: 5,color: Colors.white,),
                        Expanded(child: Center(child: Text(model.secondTeamGoals!.toString(),style: const TextStyle(color: Colors.white),)))
                      ],
                    ),
                  )
                  ),

                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: 20,
                    child: Image(
                      height: 35,
                      image: NetworkImage(model.secondTeamLogo!),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //secondTeamName
          Expanded(
            flex:1,
            child: Align(
              alignment: Alignment.centerLeft,
                child: Text(model.secondTeamName!,)),
          ),
        ],
      ),
    );
  }
  Widget matchDayTile({required MatchDayModel model})
  {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //firstTeamName
          Expanded(
            flex: 1,
            child: Center(child: Text(model.firstTeamName!)),
          ),
          const SizedBox(width: 5,),
          //logosAndTime
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: 10,
                    child: Image(
                      height: 35,
                      image: NetworkImage(model.firstTeamLogo!),
                    ),
                  ),
                ),
                if(!model.isPlaying!)
                  Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(model.time!,
                            style: GoogleFonts.aBeeZee()),
                      )),
                if(model.isPlaying!)
                  Expanded(child:
                  Container(
                    width: 40,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: Center(child: Text(model.firstTeamGoals!.toString(),style: const TextStyle(color: Colors.white),))),
                        Container(width: 1,height: 5,color: Colors.white,),
                        Expanded(child: Center(child: Text(model.secondTeamGoals!.toString(),style: const TextStyle(color: Colors.white),)))
                      ],
                    ),
                  )
                  ),

                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: 20,
                    child: Image(
                      height: 35,
                      image: NetworkImage(model.secondTeamLogo!),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //secondTeamName
          Expanded(
            flex:1,
            child: Center(child: Text(model.secondTeamName!,)),
          ),
        ],
      ),
    );
  }

  Widget latestNewsTile({required BuildContext context}){
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.center,

      children:  [
        //Image
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          child: Image(
            width: 100,
            height: 100,
            image:AssetImage("lib/assets/image/1188254.jpg"),),
        ),
        Column(
          children:   [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width:MediaQuery.of(context).size.width-150 ,
                child:  Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry ",
                  style: GoogleFonts.beVietnamPro(
                  ),),
              ),
            ),
          ],
        )

      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class TransfersScreen extends StatelessWidget {
  const TransfersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child:Scaffold(
          appBar: AppBar(
            title: const Text("Transfers"),
          ),
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
            child:Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  color: Colors.white,
                  child: const Center(child: Text("Gameweek 24 Deadline 8 Feb 2022 20:15")),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 2.5),
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 2),
                                child: Container(
                                    child:  Center(child: Text('Free Transfers',style: GoogleFonts.karla(
                                      color: Colors.black,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold
                                    ),)),
                                  decoration: BoxDecoration(
                                      color: Colors.white38,
                                      borderRadius: BorderRadius.circular(5)),
                                  width: 95,
                                ),
                              ),
                              const Center(child: Text("1")),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 2.5),
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 2),
                                child: Container(
                                    child:  Center(child: Text('Wildcard',style: GoogleFonts.karla(
                                      color: Colors.black,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold
                                    ),)),
                                  decoration: BoxDecoration(
                                      color: Colors.white38,
                                      borderRadius: BorderRadius.circular(5)),
                                  width: 95,
                                ),
                              ),
                              const Center(child: Text("Available")),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 2.5),
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 2),
                                child: Container(
                                    child:  Center(child: Text('Cost',style: GoogleFonts.karla(
                                      color: Colors.black,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold
                                    ),)),
                                  decoration: BoxDecoration(
                                      color: Colors.white38,
                                      borderRadius: BorderRadius.circular(5)),
                                  width: 95,
                                ),
                              ),
                              const Center(child: Text("0")),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 2.5),
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 2),
                                child: Container(
                                    child:  Center(child: Text('Bank',style: GoogleFonts.karla(
                                      color: Colors.black,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold
                                    ),)),
                                  decoration: BoxDecoration(
                                      color: Colors.white38,
                                      borderRadius: BorderRadius.circular(5)),
                                  width: 95,
                                ),
                              ),
                              const Center(child: Text("100m")),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                field(),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          style:  ButtonStyle(
                              minimumSize: MaterialStateProperty.all(const Size(150,50)),
                              backgroundColor: MaterialStateProperty.all(Colors.white)

                          ),
                          onPressed: (){}, child:  Text("Add player",style: GoogleFonts.karla(color: Colors.black))),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          style:  ButtonStyle(
                              minimumSize: MaterialStateProperty.all(const Size(150,50)),
                            backgroundColor: MaterialStateProperty.all(Colors.white)

                          ),
                          onPressed: (){}, child: Text("next",style: GoogleFonts.karla(color: Colors.black),)),
                    ),
                  ],
                ),
              ],
            )
          ),
    ));
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
}

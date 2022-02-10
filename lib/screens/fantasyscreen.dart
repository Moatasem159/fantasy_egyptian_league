import 'package:fantasy/assets/icons/myicons.dart';
import 'package:fantasy/helper/mysharedpreferences.dart';
import 'package:fantasy/screens/loginscreen.dart';
import 'package:fantasy/screens/registerscreen.dart';
import 'package:fantasy/screens/transfersscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class FantasyScreen extends StatelessWidget {
  const FantasyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50,),
               Padding(
                 padding: const EdgeInsets.only(left: 15),
                 child: Text("Fantasy",style: GoogleFonts.ubuntu(
                   fontSize: 40
                 ),),
               ),
              const SizedBox(height: 15,),
              if(MyShared.getData(key: 'uId')==null)
              welcomeToFantasy(context: context),
              if(MyShared.getData(key: 'uId')!=null)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      width: MediaQuery.of(context).size.width-15,
                      height: 140,
                      color: Colors.blue[900],
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 25),
                            child: Column(
                              children: [
                                Text("0",style:GoogleFonts.copse(
                                  color: Colors.white,fontSize: 30
                                ),),
                                const SizedBox(height: 15,),
                                Text(
                                  "AVERAGE",
                                  style: GoogleFonts.karla(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 10),
                            child: Column(
                              children: [
                                Text("0",style:GoogleFonts.copse(
                                  color: Colors.white,fontSize: 30
                                ),),
                                const SizedBox(height: 15,),
                                Text(
                                  "YOUR SCORE",
                                  style: GoogleFonts.karla(
                                    fontWeight: FontWeight.bold,
                                      color: Colors.white, fontSize: 20),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 25),
                            child: Column(
                              children: [
                                Text("0",style:GoogleFonts.copse(
                                  color: Colors.white,fontSize: 30
                                ),),
                                const SizedBox(height: 15,),
                                Text(
                                  "HIGHEST",
                                  style: GoogleFonts.karla(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white, fontSize: 20),
                                )
                              ],
                            ),
                          ),

                        ],
                      ),

                    ),
                  ),
                  const SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                        style:  ButtonStyle(
                            minimumSize: MaterialStateProperty.all(const Size(300,40)),
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          overlayColor: MaterialStateProperty.all(Colors.black38),
                          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 5))
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              "Points",
                              style: GoogleFonts.karla(color: Colors.black),
                            ),
                            const Spacer(),
                            const Icon(Icons.arrow_right_alt_sharp,color: Colors.black,),
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                        style:  ButtonStyle(
                            minimumSize: MaterialStateProperty.all(const Size(300,40)),
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          overlayColor: MaterialStateProperty.all(Colors.black38),
                          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 5))
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              "Pick Team",
                              style: GoogleFonts.karla(color: Colors.black),
                            ),
                            const Spacer(),
                            const Icon(Icons.arrow_right_alt_sharp,color: Colors.black,),
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                        style:  ButtonStyle(
                            minimumSize: MaterialStateProperty.all(const Size(300,40)),
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          overlayColor: MaterialStateProperty.all(Colors.black38),
                          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 5))
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TransfersScreen(),));
                        },
                        child: Row(
                          children: [
                            Text(
                              "Transfers",
                              style: GoogleFonts.karla(color: Colors.black),
                            ),
                            const Spacer(),
                            const Icon(Icons.arrow_right_alt_sharp,color: Colors.black,),
                          ],
                        )),
                  ),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }




  Widget welcomeToFantasy({required BuildContext context}){

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Egyptian",style: GoogleFonts.ubuntu(),),
                const SizedBox(width: 3,),
                const Icon(MyIcons.eplLogo),
                const SizedBox(width: 5,),
                Text("League",style: GoogleFonts.ubuntu(),),

              ],),
            const SizedBox(height: 5,),
            Text("Welcome To Fantasy",style: GoogleFonts.chakraPetch(
                fontWeight: FontWeight.bold
            ),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text("The official fantasy football game of the Egyptian league",
                style:GoogleFonts.chakraPetch(),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 5,),
            ElevatedButton(
                style:  ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(300,40))

                ),
                onPressed: (){

                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen(),));
                }, child: const Text("login")),
            ElevatedButton(
                style:  ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(300,40))

                ),
                onPressed:(){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterScreen(),));
              },
                child: const Text("register")),
            const SizedBox(height: 15,)
          ],),
      ),
    );
  }


}
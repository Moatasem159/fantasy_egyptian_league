import 'package:fantasy/assets/icons/myicons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget myAppBar ()=>Padding(
  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
  child: Row(
    children:[
      const Icon(MyIcons.eplLogo,size:90,),
      Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Egyptian",style: GoogleFonts.beVietnamPro(
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),),
            Text("league",style: GoogleFonts.beVietnamPro(
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),),
          ],
        ),
      )

    ],
  ),
);
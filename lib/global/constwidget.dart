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


Widget myTextFormField(
    {
      required BuildContext context,
      required String labelText,
      IconData ?prefixIcon,
      required TextEditingController controller,
      String? Function(String ?value)? validator,
      bool obscure = false,
      Widget? suffixIcon,
      Color  focusedErrorBorderColor= Colors.red,
      Color focusedBorderColor=const Color(0xFFD4F1F4),
      Color  enabledBorderColor=Colors.white,
      Color  labelColor=Colors.blue,
      Color  prefixColor=Colors.blue,
      Color  inputTextColor= Colors.white,
      bool readOnly=false,
      TextInputType? inputType,
    })
{
  double radius=12;
  return Padding(
    padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
    child: TextFormField(
      keyboardType: inputType,
      onChanged: (value) => print(value),
      autocorrect: true,
      obscureText: obscure,
      validator: validator,
      controller: controller,
      style: GoogleFonts.aBeeZee(
          color: inputTextColor
      ),
      readOnly: readOnly,
      textInputAction: TextInputAction.done,
      cursorColor: inputTextColor,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal:20,vertical: 10),
        suffixIcon: suffixIcon,
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1, style: BorderStyle.solid, color:  focusedErrorBorderColor),
            borderRadius: BorderRadius.circular(radius)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1, style: BorderStyle.solid, color: focusedErrorBorderColor),
            borderRadius: BorderRadius.circular(radius)),
        errorStyle: GoogleFonts.mulish(color: Colors.red, fontSize: 10),
        labelStyle: Theme.of(context).textTheme.subtitle1,
        labelText: labelText,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1, style: BorderStyle.solid, color:focusedBorderColor),
            borderRadius: BorderRadius.circular(radius)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width:1, style: BorderStyle.solid, color: enabledBorderColor),
            borderRadius: BorderRadius.circular(radius)),
        // prefixIcon: Icon(
        //   prefixIcon,
        //   color: prefixColor,
        // ),
      ),
    ),
  );
}


Widget defaultButton({
  required BuildContext context,
  required Widget title,
  required void Function() onPressed,

}) {
  return ElevatedButton(
      style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Theme.of(context).primaryColorDark),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(11))),
          backgroundColor: MaterialStateProperty.all(Theme
              .of(context)
              .primaryColor)),
      onPressed: onPressed,
      child: title);
}
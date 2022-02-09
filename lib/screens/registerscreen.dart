import 'package:fantasy/assets/icons/myicons.dart';
import 'package:fantasy/cubits/registercubit.dart';
import 'package:fantasy/global/constwidget.dart';
import 'package:fantasy/states/registerstates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(create: (context) => RegisterCubit(),
      child:BlocConsumer<RegisterCubit,RegisterStates>(
          listener:(context, state) {},
        builder: (context, state) {
            TextEditingController firstNameController=TextEditingController();
          return  SafeArea(
            child: Scaffold(
              appBar: AppBar(),
              body: SingleChildScrollView(
                child: Column(
                  children:  [
                    const Center(child: Icon(MyIcons.eplLogo,size: 150,)),
                    Center(child: Text("Welcome to Fantasy Egyptian league",
                      style:GoogleFonts.karla(
                        fontSize: 15
                      ) ,)),
                    myTextFormField(
                        context: context,
                        labelText: "first name",
                        controller: firstNameController,
                      enabledBorderColor: Colors.black,
                      focusedBorderColor: Colors.black,
                      inputTextColor: Colors.black,
                    ),
                    myTextFormField(
                      context: context,
                      labelText: "Last name",
                      controller: firstNameController,
                      enabledBorderColor: Colors.black,
                      focusedBorderColor: Colors.black,
                      inputTextColor: Colors.black,
                    ),
                    myTextFormField(
                      context: context,
                      labelText: "email",
                      controller: firstNameController,
                      enabledBorderColor: Colors.black,
                      focusedBorderColor: Colors.black,
                      inputTextColor: Colors.black,
                    ),
                    myTextFormField(
                      context: context,
                      labelText: "Phone",
                      controller: firstNameController,
                      enabledBorderColor: Colors.black,
                      focusedBorderColor: Colors.black,
                      inputTextColor: Colors.black,
                      inputType: TextInputType.number
                    ),
                    myTextFormField(
                      context: context,
                      labelText: "Password",
                      controller: firstNameController,
                      enabledBorderColor: Colors.black,
                      focusedBorderColor: Colors.black,
                      inputTextColor: Colors.black,
                    ),
                    myTextFormField(
                      context: context,
                      labelText: "Confirm Password",
                      controller: firstNameController,
                      enabledBorderColor: Colors.black,
                      focusedBorderColor: Colors.black,
                      inputTextColor: Colors.black,
                    ),
                  ],
                ),
              ),

            ),
          );
        },
      ) ,);
  }
}

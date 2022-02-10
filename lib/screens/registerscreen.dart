import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:email_validator/email_validator.dart';
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
    GlobalKey<FormState> formKey = GlobalKey();
    return  BlocProvider(create: (context) => RegisterCubit(),
      child:BlocConsumer<RegisterCubit,RegisterStates>(
          listener:(context, state) {

            if(state is CollectDataRegisterSuccessState)
              {
                Navigator.of(context).pop(context);
              }

          },
        builder: (context, state) {
          return  SafeArea(
            child: GestureDetector(
              onTap:() =>  FocusScope.of(context).unfocus(),
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
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            //first name
                            myTextFormField(
                              context: context,
                              labelText: "first name",
                              controller: RegisterCubit.get(context).firstNameController,
                              enabledBorderColor: Colors.black,
                              focusedBorderColor: Colors.black,
                              inputTextColor: Colors.black,
                              suffixIcon: GestureDetector(
                                onTap: () => RegisterCubit.get(context).clearFirstName(),
                                  child:  const Icon(
                                Icons.clear,
                                color: Colors.black,
                                    size: 15,
                              )),
                              validator: (value) {
                                if(value!.isEmpty){
                                  return'First name required';
                                }
                                return null;
                              },
                            ),
                            //last name
                            myTextFormField(
                              context: context,
                              labelText: "Last name",
                              controller: RegisterCubit.get(context).lastNameController,
                              enabledBorderColor: Colors.black,
                              focusedBorderColor: Colors.black,
                              inputTextColor: Colors.black,
                              suffixIcon: GestureDetector(
                                onTap: () => RegisterCubit.get(context).clearLastName(),
                                child: const Icon(
                                  Icons.clear,
                                  size: 15,
                                  color: Colors.black,
                                ),
                              ),
                              validator: (value) {
                                if(value!.isEmpty){
                                  return'Last name required';
                                }
                                return null;
                              },
                            ),
                            //e-mail
                            myTextFormField(
                              context: context,
                              labelText: "email",
                              controller: RegisterCubit.get(context).emailController,
                              enabledBorderColor: Colors.black,
                              focusedBorderColor: Colors.black,
                              inputTextColor: Colors.black,
                              suffixIcon: GestureDetector(
                                onTap: () => RegisterCubit.get(context).clearEmailName(),
                                child: const Icon(
                                  Icons.clear,
                                  size: 15,
                                  color: Colors.black,
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "E-mail is required";
                                }
                                else if (!EmailValidator.validate(value)) {
                                  return "Wrong E-mail";
                                }
                                else if (state is RegisterErrorState &&
                                    state.error.toString() ==
                                        "[firebase_auth/email-already-in-use] The email address is already in use by another account.") {
                                  return "email already in use";
                                }
                                else {
                                  return null;
                                }
                              },
                            ),
                            //phone
                            myTextFormField(
                              context: context,
                              labelText: "Phone",
                              controller: RegisterCubit.get(context).phoneController,
                              enabledBorderColor: Colors.black,
                              focusedBorderColor: Colors.black,
                              inputTextColor: Colors.black,
                              inputType: TextInputType.number,
                              suffixIcon: GestureDetector(
                                onTap: () => RegisterCubit.get(context).clearPhoneName(),
                                child: const Icon(
                                  Icons.clear,
                                  size: 15,
                                  color: Colors.black,
                                ),
                              ),
                              validator: (value) {
                                if(value!.isEmpty){
                                  return'Phone number required';
                                }
                                return null;
                              },
                            ),
                            //password
                            myTextFormField(
                              context: context,
                              labelText: "Password",
                              controller: RegisterCubit.get(context).passwordController,
                              enabledBorderColor: Colors.black,
                              focusedBorderColor: Colors.black,
                              inputTextColor: Colors.black,
                              obscure: RegisterCubit.get(context).obscurePassword,
                              suffixIcon: GestureDetector(
                                onTap: () => RegisterCubit.get(context).changePasswordVisibility(),
                                  child: Icon(
                                    RegisterCubit.get(context).passwordIcon,
                                color: Colors.black,
                                    size: 20,
                              )),
                              validator: (value) {
                                if(value!.isEmpty){
                                  return'Password required';
                                }
                                return null;
                              },
                            ),
                            //confirm Password
                            myTextFormField(
                              context: context,
                              labelText: "Confirm Password",
                              controller: RegisterCubit.get(context).confirmPasswordController,
                              enabledBorderColor: Colors.black,
                              focusedBorderColor: Colors.black,
                              inputTextColor: Colors.black,
                              obscure: RegisterCubit.get(context).obscureConfirmPassword,
                              suffixIcon: GestureDetector(
                                onTap: () => RegisterCubit.get(context).changeConfirmPasswordVisibility(),
                                  child:Icon(
                                    RegisterCubit.get(context).confirmPasswordIcon,
                                color: Colors.black,
                                    size: 20,
                              )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Confirm Password is required";
                                } else if (RegisterCubit.get(context).passwordController.text !=
                                    RegisterCubit.get(context).confirmPasswordController.text) {
                                  return "Wrong Password";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            ConditionalBuilder(condition: state is!RegisterLoadingState,
                                builder: (context) {
                                  return defaultButton(context: context, title: const Text("register"), onPressed: (){
                                    if(formKey.currentState!.validate())
                                    {
                                      RegisterCubit.get(context).userRegister(
                                          firstName: RegisterCubit.get(context).firstNameController.text,
                                          lastName: RegisterCubit.get(context).lastNameController.text,
                                          email: RegisterCubit.get(context).emailController.text,
                                          phone: RegisterCubit.get(context).phoneController.text,
                                          password: RegisterCubit.get(context).passwordController.text);
                                    }
                                  });
                                },
                                fallback:(context) => loading(),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              ),
            ),
          );
        },
      ) ,);
  }
}

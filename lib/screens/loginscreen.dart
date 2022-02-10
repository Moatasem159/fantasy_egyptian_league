import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fantasy/cubits/logincubit.dart';
import 'package:fantasy/global/constwidget.dart';
import 'package:fantasy/helper/mysharedpreferences.dart';
import 'package:fantasy/screens/mainscreen.dart';
import 'package:fantasy/states/loginstates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
          listener: (context, state) {
            if(state is LoginSuccessState)
            {
              MyShared.saveData(key: 'uId', value: state.uId).then((value){
                uid=state.uId;
              });
              LoginCubit.get(context).loginSuccess();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                builder: (context) => const MainScreen(),), (route) => false);
            }
          },
        builder:(context, state) {
          return  SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: const Text("Sign in"),
              ),
              body: Form(
                key: formKey,
                child: Column(
                  children: [
                    //email
                    myTextFormField(
                      context: context,
                      labelText: "email",
                      controller: LoginCubit.get(context).emailController,
                      enabledBorderColor: Colors.black,
                      focusedBorderColor: Colors.black,
                      inputTextColor: Colors.black,
                      suffixIcon: GestureDetector(
                        onTap: () => LoginCubit.get(context).clearEmailName(),
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

                        else if (state is LoginErrorState &&
                            state.error.toString() ==
                                "[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.")
                          {
                            return "user not found";
                          }
                        else {
                          return null;
                        }
                      },
                    ),
                    //password
                    myTextFormField(
                      context: context,
                      labelText: "Password",
                      controller: LoginCubit.get(context).passwordController,
                      enabledBorderColor: Colors.black,
                      focusedBorderColor: Colors.black,
                      inputTextColor: Colors.black,
                      obscure: LoginCubit.get(context).obscurePassword,
                      suffixIcon: GestureDetector(
                          onTap: () => LoginCubit.get(context).changePasswordVisibility(),
                          child: Icon(
                            LoginCubit.get(context).passwordIcon,
                            color: Colors.black,
                            size: 20,
                          )),
                      validator: (value) {
                        if(value!.isEmpty){
                          return'Password required';
                        }
                        else if (state is LoginErrorState &&
                            state.error.toString() ==
                                "[firebase_auth/wrong-password] The password is invalid or the user does not have a password.")
                          {
                            return "wrong password";
                          }
                          return null;

                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                      child: defaultButton(context: context,
                        backgroundColor: Colors.black,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:  [
                        const Text("Sign in"),
                        const SizedBox(width: 75,),
                        ConditionalBuilder(condition: state is LoginLoadingState,
                            builder: (context) => loading(),
                            fallback: (context) => const SizedBox(width: 52,height: 52,),)
                      ],), onPressed: (){
                          if(formKey.currentState!.validate()){
                            LoginCubit.get(context).userLogin(
                                email: LoginCubit.get(context).emailController.text,
                                password: LoginCubit.get(context)
                                    .passwordController
                                    .text);
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),

            ),
          );
        },
      ),
    );
  }
}

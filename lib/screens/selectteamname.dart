import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fantasy/cubits/fantasycubit.dart';
import 'package:fantasy/global/constwidget.dart';
import 'package:fantasy/screens/createteamscreen.dart';
import 'package:fantasy/states/fantasystates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectTeamName extends StatelessWidget {
  const SelectTeamName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    return BlocProvider(
      create: (context) => FantasyCubit(),
      child: BlocConsumer<FantasyCubit,FantasyStates>(
        listener: (context, state) {
          if(state is UpdateTeamNameSuccessState)
            {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreateTeamScreen(),));
            }
        },
        builder: (context, state) {
          return SafeArea(
              child: Scaffold(
            body: Form(
              key:formKey ,
              child: Column(

                children: [
                  const SizedBox(height: 100,),
                  myTextFormField(
                    context: context,
                    labelText: "Team name",
                    controller: FantasyCubit.get(context).teamNameController,
                    enabledBorderColor: Colors.black,
                    focusedBorderColor: Colors.black,
                    inputTextColor: Colors.black,
                    suffixIcon: GestureDetector(
                        child:  const Icon(
                          Icons.clear,
                          color: Colors.black,
                          size: 15,
                        )),
                    validator: (value) {
                      if(value!.isEmpty){
                        return'team name required';
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
                          const Text("Select Name"),
                          const SizedBox(width: 55,),
                          ConditionalBuilder(condition: state is UpdateTeamNameLoadingState,
                            builder: (context) => loading(),
                            fallback: (context) => const SizedBox(width: 52,height: 52,),)
                        ],), onPressed: (){
                        if(formKey.currentState!.validate()){
                          FantasyCubit.get(context).updateTeamName(
                              teamName: FantasyCubit
                                  .get(context)
                                  .teamNameController
                                  .text);
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}

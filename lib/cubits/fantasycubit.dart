import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantasy/global/constwidget.dart';
import 'package:fantasy/model/managermodel.dart';
import 'package:fantasy/states/fantasystates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FantasyCubit extends Cubit<FantasyStates>{

  FantasyCubit(): super(FantasyInitialState());
  static FantasyCubit get(context)=>BlocProvider.of(context);

  TextEditingController teamNameController=TextEditingController();
  

  ManagerModel manager=ManagerModel();
  
  getManagerData(){
    
    FirebaseFirestore.instance
        .collection("Managers")
        .doc(uid)
        .get()
        .then((value){
          manager=ManagerModel.fromJson(value.data()!);
    }).catchError((onError){});
    
  }

  updateTeamName({required String teamName}){
    ManagerModel managerModel = ManagerModel(
        email: manager.email,
        phoneNumber: manager.phoneNumber,
        lastName: manager.lastName,
        firstName: manager.firstName,
        uId: manager.uId,
        teamName:teamName,
        password: manager.password
    );
    emit(UpdateTeamNameLoadingState());
    FirebaseFirestore.instance
      .collection("Managers")
    .doc(manager.uId)
    .set(managerModel.toMap())
    .then((value){
      getManagerData();
      emit(UpdateTeamNameSuccessState());

    })
    .catchError((error){
      emit(UpdateTeamNameErrorState());
    });
  }


}
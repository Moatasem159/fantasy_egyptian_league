import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantasy/model/managermodel.dart';
import 'package:fantasy/states/registerstates.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates>{


  RegisterCubit (): super(RegisterInitialState());
  static RegisterCubit get(context)=>BlocProvider.of(context);



  userRegister({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String password,
  }) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      userData(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          phone: phone,
          uId: value.user!.uid);
    }).catchError((onError) {
      emit(RegisterErrorState(error: onError));
    });
  }


  userData({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String password,
    required String uId,})async{
    emit(CollectDataRegisterLoadingState());
    ManagerModel managerModel = ManagerModel(
      email: email,
      phoneNumber: phone,
      lastName: lastName,
      firstName: firstName,
      uId: uId,
      password: password
    );
    FirebaseFirestore.instance
        .collection('')
        .doc(uId)
        .set(managerModel.toMap())
        .then((value) {
      emit(CollectDataRegisterSuccessState());
    }).catchError((onError){
      emit(CollectDataRegisterErrorState());
    });
  }














}
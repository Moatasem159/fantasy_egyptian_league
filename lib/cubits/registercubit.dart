
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantasy/model/managermodel.dart';
import 'package:fantasy/states/registerstates.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates>{


  RegisterCubit (): super(RegisterInitialState());
  static RegisterCubit get(context)=>BlocProvider.of(context);


  TextEditingController firstNameController=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmPasswordController=TextEditingController();


  IconData passwordIcon=Icons.visibility;
  bool obscurePassword=true;
  bool obscureConfirmPassword=true;
  IconData confirmPasswordIcon=Icons.visibility;

  clearFirstName(){
    firstNameController.clear();
    emit(ClearFirstNameState());
  }
  clearLastName(){
    lastNameController.clear();
    emit(ClearLastNameState());
  }
  clearEmailName(){
    emailController.clear();
    emit(ClearEmailNameState());
  }
  clearPhoneName(){
    phoneController.clear();
    emit(ClearPhoneNameState());
  }

  changePasswordVisibility(){
    obscurePassword=!obscurePassword;
    passwordIcon=obscurePassword?Icons.visibility:Icons.visibility_off_rounded;
    emit(ChangePasswordVisibilityState());

  }
  changeConfirmPasswordVisibility(){
    obscureConfirmPassword=!obscureConfirmPassword;
    confirmPasswordIcon=obscureConfirmPassword?Icons.visibility:Icons.visibility_off_rounded;
    emit(ChangeConfirmPasswordVisibilityState());

  }











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
        .collection('Managers')
        .doc(uId)
        .set(managerModel.toMap())
        .then((value) {
      emit(CollectDataRegisterSuccessState());
    }).catchError((onError){
      emit(CollectDataRegisterErrorState());
    });
  }














}
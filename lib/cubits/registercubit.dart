import 'package:bloc/bloc.dart';
import 'package:fantasy/states/registerstates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates>{


  RegisterCubit (): super(RegisterInitialState());
  static RegisterCubit get(context)=>BlocProvider.of(context);


















}
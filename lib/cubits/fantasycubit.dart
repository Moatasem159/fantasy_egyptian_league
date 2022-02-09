import 'package:bloc/bloc.dart';
import 'package:fantasy/states/fantasystates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FantasyCubit extends Cubit<FantasyStates>{

  FantasyCubit(): super(FantasyInitialState());
  static FantasyCubit get(context)=>BlocProvider.of(context);


}
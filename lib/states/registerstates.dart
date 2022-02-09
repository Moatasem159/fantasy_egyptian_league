abstract class RegisterStates{}

class RegisterInitialState extends RegisterStates{}

class RegisterLoadingState extends RegisterStates{}
class RegisterErrorState extends RegisterStates{
  final dynamic error;

  RegisterErrorState({this.error});
}
class RegisterSuccessState extends RegisterStates{}

class CollectDataRegisterLoadingState extends RegisterStates{}
class CollectDataRegisterErrorState extends RegisterStates{}
class CollectDataRegisterSuccessState extends RegisterStates{}

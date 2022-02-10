abstract class LoginStates{}

class LoginInitialState extends LoginStates{}

class ClearEmailNameState extends LoginStates{}
class ChangePasswordVisibilityState extends LoginStates{}

class LoginLoadingState extends LoginStates{}
class LoginErrorState extends LoginStates{
  final dynamic error;

 LoginErrorState({this.error});
}
class LoginSuccessState extends LoginStates{
  final String uId;

 LoginSuccessState({required this.uId});
}
class LoginSuccessFinishState extends LoginStates{}

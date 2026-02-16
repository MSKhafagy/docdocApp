class RegisterStates {}

class RegisterInitialState extends RegisterStates{}

class RegisterLoadingState extends RegisterStates{}

class RegisterSuccessState extends RegisterStates{
  final String token;
  final String userName;

  RegisterSuccessState({required this.token, required this.userName});

}

class RegisterErrorState extends RegisterStates{
  String errorMessage;
  RegisterErrorState({required this.errorMessage});
}
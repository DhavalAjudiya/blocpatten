abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginvalidState extends LoginState {}

class LoginErrorState extends LoginState {
  final String errormassage;

  LoginErrorState(this.errormassage);
}

class LoginLodingState extends LoginState {}

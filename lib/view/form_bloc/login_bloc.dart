import 'package:blocpatten/view/form_bloc/login_event.dart';
import 'package:blocpatten/view/form_bloc/login_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  var email = "fredrik@gmail.com";
  LoginBloc() : super(LoginInitialState()) {
    on<LoginTextEvent>((event, emit) {
      if (event.Emailvalue == "" && EmailValidator.validate(email) == false) {
        emit(
          LoginErrorState("Please Enter a Valid Address"),
        );
      } else if (event.Passwordvale.length <= 8) {
        emit(
          LoginErrorState("Please Enter a Valid Password"),
        );
      } else {
        emit(
          LoginvalidState(),
        );
      }
    });
    on<LoginButtonEvent>((event, emit) {
      emit(
        LoginLodingState(),
      );
    });
  }
}

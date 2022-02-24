abstract class LoginEvent{}

class LoginTextEvent extends LoginEvent{

  final String Emailvalue;
  final String Passwordvale;

  LoginTextEvent(this.Emailvalue, this.Passwordvale);


}
class LoginButtonEvent extends LoginEvent{


  final String Email;
  final String Password;

  LoginButtonEvent(this.Email, this.Password);

}
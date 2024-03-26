class AuthEvent {}

class InitAuthEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {
  final String username;
  final String password;

  LoginEvent(this.username, this.password);
}

class RegisterEvent extends AuthEvent {
  final String username;
  final String password;
  final String confirmPassword;

  RegisterEvent(this.username, this.password, this.confirmPassword);
}

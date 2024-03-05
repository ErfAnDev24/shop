class AuthState {}

class InitAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class LoginState extends AuthState {
  final String response;

  LoginState(this.response);
}

import 'package:either_dart/either.dart';

class AuthState {}

class InitAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class LoginState extends AuthState {
  Either<String, String> response;
  LoginState(this.response);
}

class RegisterState extends AuthState {
  Either<String, String> response;
  RegisterState(this.response);
}

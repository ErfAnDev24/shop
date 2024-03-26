import 'package:digikala/bloc/loginScreenBloc/AuthEvent.dart';
import 'package:digikala/bloc/loginScreenBloc/AuthState.dart';
import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/repository/AuthenticationRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final reposiroty = locator.get<IAuthenticationRepository>();

  AuthBloc() : super(InitAuthState()) {
    on<LoginEvent>((event, emit) async {
      emit(LoadingAuthState());
      var response = await reposiroty.login(event.username, event.password);
      emit(LoginState(response));
    });

    on<InitAuthEvent>((event, emit) => emit(InitAuthState()));

    on<RegisterEvent>((event, emit) async {
      var response = await reposiroty.register(
          event.username, event.password, event.confirmPassword);
      emit(RegisterState(response));
    });
  }
}

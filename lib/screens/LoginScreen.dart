import 'package:digikala/bloc/loginScreenBloc/AuthBloc.dart';
import 'package:digikala/bloc/loginScreenBloc/AuthEvent.dart';
import 'package:digikala/bloc/loginScreenBloc/AuthState.dart';
import 'package:digikala/constants/CustomColors.dart';
import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/repository/AuthenticationRepository.dart';
import 'package:digikala/screens/DashboardScreen.dart';
import 'package:digikala/screens/RegisterScreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final repository = locator.get<IAuthenticationRepository>();

  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        body: Container(
          color: CustomeColors.blue,
          child: Column(
            children: [
              const Expanded(
                flex: 4,
                child: SizedBox(
                  width: 140,
                  height: 140,
                  child: Image(
                    image: AssetImage('images/appleIcon.png'),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            cursorColor: CustomeColors.blue,
                            controller: usernameController,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: CustomeColors.blue),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: CustomeColors.blue),
                              ),
                              labelText: 'نام کاربری',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              labelStyle: TextStyle(
                                  color: CustomeColors.blue,
                                  fontFamily: 'vazir'),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextField(
                            cursorColor: CustomeColors.blue,
                            controller: passwordController,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: CustomeColors.blue),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: CustomeColors.blue),
                              ),
                              labelText: 'رمز عبور',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              labelStyle: TextStyle(
                                  color: CustomeColors.blue,
                                  fontFamily: 'vazir'),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          BlocConsumer<AuthBloc, AuthState>(
                            listener: (context, state) {
                              if (state is LoginState) {
                                state.response.fold(
                                  (left) => context
                                      .read<AuthBloc>()
                                      .add(InitAuthEvent()),
                                  (right) {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const DashBoardScreen(),
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                            builder: (context, state) {
                              if (state is InitAuthState) {
                                return ElevatedButton(
                                  onPressed: () {
                                    BlocProvider.of<AuthBloc>(context).add(
                                      LoginEvent(usernameController.text,
                                          passwordController.text),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: CustomeColors.blue,
                                    foregroundColor: Colors.white,
                                    minimumSize: const Size(150, 50),
                                  ),
                                  child: const Text(
                                    'ورود',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'vazir',
                                        fontSize: 20),
                                  ),
                                );
                              }

                              if (state is LoadingAuthState) {
                                return const CircularProgressIndicator();
                              }

                              return const Text('');
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const RegisterScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'اگر حساب کاربری ندارید ثبت نام کنید',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 96, 96, 96),
                                  fontFamily: 'vazir',
                                  fontSize: 15),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

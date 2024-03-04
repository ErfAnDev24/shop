import 'package:digikala/constants/CustomColors.dart';
import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/repository/AuthenticationRepository.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      body: Expanded(
        child: Container(
          color: CustomeColors.blue,
          child: Column(
            children: [
              const Expanded(
                flex: 6,
                child: SizedBox(
                  width: 140,
                  height: 140,
                  child: Image(
                    image: AssetImage('images/appleIcon.png'),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
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
                              labelText: 'username',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              labelStyle: TextStyle(color: CustomeColors.blue),
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
                              labelText: 'password',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              labelStyle: TextStyle(color: CustomeColors.blue),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              repository.login(usernameController.text,
                                  passwordController.text);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CustomeColors.blue,
                              foregroundColor: Colors.white,
                              minimumSize: const Size(150, 50),
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
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
}

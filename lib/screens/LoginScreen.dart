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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              var response =
                  repository.register('ErfAnPz244', 'erfan1234', 'erfan1234');

              response.fold((faildMessage) {
                print(faildMessage);
              }, (successMessage) {
                print(successMessage);
              });
            },
            child: const Text('register user'),
          ),
          ElevatedButton(
            onPressed: () {
              var response = repository.login('ErfAnPz244', 'erfan1234');

              response.fold((faildMessage) {
                print(faildMessage);
              }, (successMessage) {
                print(successMessage);
              });
            },
            child: const Text('login'),
          ),
        ],
      ),
    ));
  }
}

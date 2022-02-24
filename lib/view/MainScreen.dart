import 'package:blocpatten/utils/app_string.dart';
import 'package:blocpatten/view/form_bloc/login_bloc.dart';
import 'package:blocpatten/view/loginscreen.dart';
import 'package:blocpatten/widget/eleveted_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomElevetedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => LoginBloc(),
                        child: Loginscreen(),
                      ),
                    ),
                  );
                },
                text: AppString.login,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomElevetedButton(
                onPressed: () {},
                text: AppString.signin,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

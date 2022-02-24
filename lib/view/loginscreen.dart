import 'package:blocpatten/utils/app_string.dart';
import 'package:blocpatten/view/form_bloc/login_bloc.dart';
import 'package:blocpatten/view/form_bloc/login_event.dart';
import 'package:blocpatten/view/form_bloc/login_state.dart';
import 'package:blocpatten/widget/eleveted_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loginscreen extends StatelessWidget {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppString.loginappbar,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is LoginErrorState) {
                    return Text(
                      state.errormassage,
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _emailcontroller,
                onChanged: (val) {
                  BlocProvider.of<LoginBloc>(context).add(
                    LoginTextEvent(
                      _emailcontroller.text,
                      _passwordcontroller.text,
                    ),
                  );
                },
                decoration: const InputDecoration(
                  hintText: AppString.emailhinttext,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _passwordcontroller,
                onChanged: (val) {
                  BlocProvider.of<LoginBloc>(context).add(
                    LoginTextEvent(
                      _emailcontroller.text,
                      _passwordcontroller.text,
                    ),
                  );
                },
                decoration: const InputDecoration(
                  hintText: AppString.passwordlhinttext,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is LoginLodingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return CupertinoButton(
                    color:
                        (state is LoginvalidState) ? Colors.blue : Colors.grey,
                    child: const Text(
                      AppString.loginbutton,
                    ),
                    onPressed: () {
                      if (state is LoginvalidState) {
                        BlocProvider.of<LoginBloc>(context).add(
                          LoginButtonEvent(
                            _emailcontroller.text,
                            _passwordcontroller.text,
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

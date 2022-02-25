import 'package:blocpatten/bloc/internet_bloc.dart';
import 'package:blocpatten/bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BLOC"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<InternetBloc, InternetState>(
              listener: (context, state) {
                if (state is InternetGainedState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("INTERNET CONNECTED"),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else if (state is InternetLostState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("INTERNET NOT CONNECTED"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is InternetGainedState) {
                  return const Text("Connected!");
                } else if (state is InternetLostState) {
                  return const Text(" Not Connected!");
                } else {
                  return const Text("Loading...");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

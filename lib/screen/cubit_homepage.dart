import 'package:blocpatten/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitHomeScreen extends StatelessWidget {
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
            BlocConsumer<InternetCubit, InternetState>(
              listener: (context, state) {
                if (state == InternetState.Gained) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("INTERNET CONNECTED"),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else if (state == InternetState.Lost) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("INTERNET NOT CONNECTED"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state == InternetState.Gained) {
                  return Text("Connected!");
                } else if (state == InternetState.Lost) {
                  return Text(" Not Connected!");
                } else {
                  return Text("Loading...");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

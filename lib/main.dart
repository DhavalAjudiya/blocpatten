import 'package:blocpatten/apicalling_cubit/repository/api-repository.dart';
import 'package:blocpatten/apicalling_cubit/scervice/api_service.dart';
import 'package:blocpatten/cubit/internet_cubit.dart';
import 'package:blocpatten/view/MainScreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'apicalling_cubit/cubit/cricket_cubit_bloc.dart';
import 'apicalling_cubit/screen/apiscreen.dart';

void main() {
  runApp(MyApp(
    apiService: ApiService(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({required this.apiService});
  final ApiService apiService;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CricketFetchCubit(
            apiRepository: ApiRepository(
              apiService: apiService,
            ),
          )..fetchCricketApi(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ApiScreen(),
      ),
    );
  }
}

import 'package:blocpatten/apicalling_cubit/repository/api-repository.dart';
import 'package:blocpatten/apicalling_cubit/scervice/api_service.dart';
import 'package:blocpatten/apicalling_cubit/screen/apiscreen.dart';
import 'package:blocpatten/camera.dart';
import 'package:blocpatten/mainscreen.dart';
import 'package:blocpatten/pagination/apicalling_new_cubit/cubit/cricket_cubit.dart';
import 'package:blocpatten/pagination/apicalling_new_cubit/screen/apiscreen.dart';
import 'package:blocpatten/qr_code.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'aaaaaa.dart';
import 'apicalling_cubit/cubit/cricket_cubit_bloc.dart';
import 'countrty_coud_picer.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   cameras = await availableCameras();
//   runApp(MaterialApp(home: CameraApp()));
// }
// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PagintionCubit()..fetchCricketApi(""),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CountryCodePicker(),
      ),
    );
  }
}
// import 'package:adv_camera/adv_camera.dart';
//
// void main() {
//   String id = DateTime.now().toIso8601String();
//   runApp(MaterialApp(home: MyApp(id: id)));
// }
//
// class MyApp extends StatefulWidget {
//   final String id;
//
//   const MyApp({Key? key, required this.id}) : super(key: key);
//
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//       ),
//       body: Center(child: Text('Press Floating Button to access camera')),
//       floatingActionButton: FloatingActionButton(
//         heroTag: "test3",
//         child: Icon(Icons.camera),
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (BuildContext context) {
//                 String id = DateTime.now().toIso8601String();
//                 return CameraApp();
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

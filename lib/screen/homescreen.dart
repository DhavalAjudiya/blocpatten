// import 'package:blocpatten/bloc/internet_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../bloc/internet_bloc.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("BLOC"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 showBottomSheet(context);
//               },
//               child: const Text("ON TAP"),
//             ),
//             BlocConsumer<InternetBloc, InternetState>(
//               listener: (context, state) {
//                 if (state is InternetGainedState) {
//                   showModalBottomSheet(
//                       context: context,
//                       builder: (context) {
//                         return Container(
//                           height: 80,
//                           color: Colors.red,
//                         );
//                       });
//                   // ScaffoldMessenger.of(context).showSnackBar(
//                   //   const SnackBar(
//                   //     content: Text("INTERNET CONNECTED"),
//                   //     backgroundColor: Colors.green,
//                   //   ),
//                   // );
//                 } else if (state is InternetLostState) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text("INTERNET NOT CONNECTED"),
//                       backgroundColor: Colors.red,
//                     ),
//                   );
//                 }
//               },
//               builder: (context, state) {
//                 if (state is InternetGainedState) {
//                   return const Text("Connected!");
//                 } else if (state is InternetLostState) {
//                   return const Text(" Not Connected!");
//                 } else {
//                   return const Text("Loading...");
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future showBottomSheet(context) {
//     return showModalBottomSheet(
//       builder: (BuildContext context) {
//         return BlocProvider.value(
//           value: BlocProvider.of<InternetBloc>(context),
//           child: Container(color: Colors.red, height: 500),
//         );
//       },
//       context: context,
//     );
//   }
// }

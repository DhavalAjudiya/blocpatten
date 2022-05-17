// import 'package:blocpatten/apicalling_cubit/cubit/cricket_cubit_bloc.dart';
// import 'package:blocpatten/apicalling_cubit/cubit/cricket_cubit_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class ApiScreen extends StatelessWidget {
//   const ApiScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("ApiCalling"),
//       ),
//       body: Center(
//         child: BlocBuilder<CricketFetchCubit, CricketFetchState>(
//           builder: (context, state) {
//             if (state is CricketFetchLoading) {
//               return const CircularProgressIndicator();
//             } else if (state is CricketFetchError) {
//               return Text(state.failuer.Message);
//             } else if (state is CricketFetchLoaded) {
//               return Column(
//                 children: [
//                   ListView.builder(
//                     itemCount: state.cricketList.newsdata!.length,
//                     itemBuilder: (context, index) {
//                       final newData = state.cricketList.newsdata![index];
//                       return Column(
//                         children: [
//                           Text('${newData.newsid}'),
//                           Text('${newData.seasonid}'),
//                           Text('${newData.title}'),
//                           Text('${newData.postdate}'),
//                           Text('${newData.description}'),
//                         ],
//                       );
//                     },
//                   ),
//                 ],
//               );
//             }
//             return const SizedBox.shrink();
//           },
//         ),
//       ),
//     );
//   }
//
//   Future showBottomSheet(context) {
//     return showModalBottomSheet(
//       builder: (BuildContext context) {
//         return BlocProvider.value(
//           value: BlocProvider.of<CricketFetchCubit>(context),
//           child: Container(color: Colors.red, height: 500),
//         );
//       },
//       context: context,
//     );
//   }
// }

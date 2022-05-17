// import 'dart:developer';
//
// import 'package:blocpatten/apicalling_cubit/cubit/cricket_cubit_state.dart';
// import 'package:blocpatten/apicalling_cubit/modal/cricket_modal.dart';
// import 'package:blocpatten/apicalling_cubit/modal/failure_modal.dart';
// import 'package:blocpatten/apicalling_cubit/repository/api-repository.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class CricketFetchCubit extends Cubit<CricketFetchState> {
//   CricketFetchCubit() : super(CricketFetchInitial());
//
//   Future<void> fetchCricketApi() async {
//     emit(CricketFetchLoading());
//     try {
//       log("cubitError==>>00");
//
//       final Cricket? criketlist = await ApiRepository().getCricketList();
//       log("cubitError==>>111");
//       print("cubit==${criketlist?.toJson().toString()}");
//       emit(CricketFetchLoaded(cricketList: criketlist!));
//     } on Failuer catch (e) {
//       emit(CricketFetchError(failuer: e));
//     } catch (e) {
//       log("cubitError==>>${e}");
//     }
//   }
// }

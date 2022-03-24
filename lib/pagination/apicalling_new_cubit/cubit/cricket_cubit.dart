import 'dart:developer';
import 'package:blocpatten/pagination/apicalling_new_cubit/modal/pagination_modal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../modal/failure_modal.dart';
import '../repository/api-repository.dart';
import 'cricket_cubit_state.dart';

class PagintionCubit extends Cubit<PaginationCubitState> {
  PagintionCubit() : super(PaginationInitailState());
  int page = 0;
  // bool isFetching = false;
  // final List data = [];

  Future<void> fetchCricketApi(String data) async {
    try {
      emit(
        PaginationLoadingState(massage: " Loading..."),
      );
      if (data.isEmpty) {
        return;
      }
      final Pagination? pagination = await ApiRepository().getCricketData(data);

      // if (pagination!.items!.isNotEmpty) {
      //   data.addAll(pagination.items!);
      //   print("data==>>>>${data.length}");
      // }

      // print("cubit==${pagination?.toJson().toString()}");\
      // state.items.addAll(pagination!.items!);

      emit(
        PaginationLoadedtState(pagination: pagination!),
      );
    } on Failuer catch (e) {
      emit(
        PaginationErrorState(massage: " data not loaded"),
      );
    } catch (e) {
      log("cubitError==>>${e}");
    }
  }
}

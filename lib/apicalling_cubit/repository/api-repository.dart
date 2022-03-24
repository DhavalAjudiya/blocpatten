import 'dart:developer';

import 'package:blocpatten/apicalling_cubit/modal/cricket_modal.dart';
import 'package:blocpatten/apicalling_cubit/scervice/api_service.dart';

class ApiRepository {
  Future<Cricket?> getCricketList() async {
    final response = await ApiService().getCricketData();

    log("response repository  ====${response!.newsdata![0].title}");
    return response;
  }
}

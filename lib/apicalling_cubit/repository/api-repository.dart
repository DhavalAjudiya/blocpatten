import 'dart:developer';

import 'package:blocpatten/apicalling_cubit/modal/cricket_modal.dart';
import 'package:blocpatten/apicalling_cubit/scervice/api_service.dart';
import 'package:flutter/material.dart';

class ApiRepository {
  final ApiService apiService;

  const ApiRepository({
    required this.apiService,
  });
  Future<Cricket?> getCricketList() async {
    final response = await apiService.getCricketData();

    log("response repository  ====${response!.newsdata![0].title}");
    return response;
  }
}

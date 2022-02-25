import 'dart:convert';
import 'dart:developer';

import 'package:blocpatten/apicalling_cubit/modal/cricket_modal.dart';
import 'package:blocpatten/utils/app_string.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<Cricket?> getCricketData() async {
    try {
      final response = await http.get(
        Uri.parse(
            "https://successoftinfotech.com/SuccessoftPanel/cricketAPI/cricketapi.php?what=news&data=0"),
      );
      log("getcricketdata ===>${response.body}");
      return Cricket.fromJson(jsonDecode(response.body));
    } catch (e, st) {
      print("====e${e}===>>>>>${st}");
    }
    return null;
  }
}

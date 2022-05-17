import 'dart:convert';
import 'dart:developer';
import 'package:blocpatten/pagination/apicalling_new_cubit/scervice/api_service.dart';

import '../modal/pagination_modal.dart';
import 'package:http/http.dart' as http;

class ApiRepository {
  static final ApiRepository _apiRepository = ApiRepository._();
  ApiRepository._();
  factory ApiRepository() {
    return _apiRepository;
  }

  Future<Pagination?> getCricketData(String data) async {
    const url = "https://yeay-dev.xc.io/search";
    Map<String, dynamic> body = {
      "searchText": "",
      "pageIndex": '0',
      "limit": 20,
      "returnQueryCount": true
    };
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    try {
      // log("getcricketdata ===>000");
      final response = await http.post(Uri.parse(url),
          body: jsonEncode(body), headers: headers);
      // log("getcricketdata ===>111");
      log('API body: $body');

      log("getcricketdata ===>${response.body}");

      if (response.statusCode == 200) {
        return Pagination.fromJson(jsonDecode(response.body));
      }
    } catch (e, st) {
      print("====e${e}===>>>>>${st}");
    }
    return null;
  }
  //
  // Future<Pagination?> getCricketList() async {
  //   final response = await ApiService().getCricketData();
  //   log("response repository  ====${response!.items![0].title}");
  //   return response;
  // }
}

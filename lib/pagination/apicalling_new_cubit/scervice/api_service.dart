import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modal/pagination_modal.dart';

class ApiService {
  // Future<Pagination?> getCricketData() async {
  //   const url = "https://yeay-dev.xc.io/search";
  //   Map<String, dynamic> body = {
  //     "searchText": "wom",
  //     "pageIndex": 0,
  //     "limit": 20,
  //     "returnQueryCount": true
  //   };
  //   Map<String, String> headers = {
  //     "Content-Type": "application/json",
  //   };
  //
  //   try {
  //     // log("getcricketdata ===>000");
  //     final response = await http.post(Uri.parse(url),
  //         body: jsonEncode(body), headers: headers);
  //     // log("getcricketdata ===>111");
  //     // log("getcricketdata ===>${response.body}");
  //     if (response.statusCode == 200) {
  //       return Pagination.fromJson(jsonDecode(response.body));
  //     }
  //   } catch (e, st) {
  //     print("====e${e}===>>>>>${st}");
  //   }
  //   return null;
  // }
}

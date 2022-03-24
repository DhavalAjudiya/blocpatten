import 'dart:convert';
import 'package:blocpatten/modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // final List<Data> newData = [];
  Future<Data?> fetchData() async {
    try {
      var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      var request = http.Request(
          'POST',
          Uri.parse(
              'https://phpstack-724435-2413431.cloudwaysapps.com/sagardata'));
      request.bodyFields = {'token': 'sagardata'};
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final result = await response.stream.bytesToString();
      print("data==>>>${result}");
      if (result != null) {
        // newData.addAll(jsonDecode(result)["AppDataSet"]);
        Data.fromJson(json.decode(result));
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }

    // final url = "https://phpstack-724435-2413431.cloudwaysapps.com/sagardata";

    // Map<String, dynamic> body = {"token": "sagardata"};
    // Map<String, String> header = {"Content-Type": "text/html"};
    // try {
    //   final respons = await http.post(
    //     Uri.parse(url),
    //     body: jsonEncode(body),
    //     headers: headers,
    //   );
    //   print("data==>>>${respons}");
    //   return Data.fromJson(jsonDecode(respons.body));
    // } catch (e) {
    //   print("error==$e");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: fetchData(),
              builder: (BuildContext context, AsyncSnapshot<Data?> snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  return ListView.builder(
                    itemCount: snapshot.data!.userImage!.length,
                    itemBuilder: (context, index) {
                      final get = snapshot.data!.userImage![index];
                      return Column(
                        children: [
                          Text("${get.name}"),
                        ],
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:social_share/social_share.dart';
//
// class Shareed extends StatefulWidget {
//   const Shareed({Key? key}) : super(key: key);
//
//   @override
//   _ShareedState createState() => _ShareedState();
// }
//
// class _ShareedState extends State<Shareed> {
//   final searchcontroller = TextEditingController();
// //   void onCreate(Bundle savedInstanceState) {
// //     super.onCreate(savedInstanceState);
// //     setContentView(R.layout.main);
// //     //Put the package name here...
// //     boolean installed = isAppInstalled("com.whatsapp");
// //     if (installed) {
// //       System.out.println("App is already installed on your phone");
// //     } else {
// //       System.out.println("App is not currently installed on your phone");
// //     }
// //   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           TextFormField(
//             onChanged: (value) {},
//             controller: searchcontroller,
//             decoration: InputDecoration(
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(40),
//                 borderSide: BorderSide.none,
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(40),
//                 borderSide: BorderSide.none,
//               ),
//               contentPadding:
//                   const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//               hintText: "Search",
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () async {
//               await SocialShare.shareWhatsapp(
//                 searchcontroller.text,
//               ).then((value) async {
//                 if (Platform.isAndroid) {
//                   final _installedApps = await AppAvailabity.getInstalledApps();
//
//                   print(await AppAvailability.checkAvailability(
//                       "com.android.chrome"));
//                   // Returns: Map<String, String>{app_name: Chrome, package_name: com.android.chrome, versionCode: null, version_name: 55.0.2883.91}
//
//                   print(
//                       await AppAvailability.isAppEnabled("com.android.chrome"));
//                   // Returns: true
//
//                 }
//               });
//             },
//             child: Text("Share"),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'dart:io';
//
// import 'package:flutter_appavailability/flutter_appavailability.dart';
//
// void main() => runApp(new MyApp());
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => new _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   List<Map<String, String>>? installedApps;
//   List<Map<String, String>> iOSApps = [
//     {"app_name": "Calendar", "package_name": "calshow://"},
//     {"app_name": "Facebook", "package_name": "fb://"},
//     {"app_name": "Whatsapp", "package_name": "whatsapp://"}
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> getApps() async {
//     List<Map<String, String>>? _installedApps;
//
//     if (Platform.isAndroid) {
//       _installedApps = await AppAvailability.getInstalledApps();
//
//       print(await AppAvailability.checkAvailability("com.android.chrome"));
//       // Returns: Map<String, String>{app_name: Chrome, package_name: com.android.chrome, versionCode: null, version_name: 55.0.2883.91}
//
//       print(await AppAvailability.isAppEnabled("com.android.chrome"));
//       // Returns: true
//
//     } else if (Platform.isIOS) {
//       // iOS doesn't allow to get installed apps.
//       _installedApps = iOSApps;
//
//       print(await AppAvailability.checkAvailability("calshow://"));
//       // Returns: Map<String, String>{app_name: , package_name: calshow://, versionCode: , version_name: }
//
//     }
//
//     setState(() {
//       installedApps = _installedApps;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (installedApps == null) getApps();
//
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin flutter_appavailability app'),
//         ),
//         body: ListView.builder(
//           itemCount: installedApps == null ? 0 : installedApps!.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               // title: Text(installedApps[index]?["app_name"]),
//               trailing: IconButton(
//                   icon: const Icon(Icons.open_in_new),
//                   onPressed: () {
//                     Scaffold.of(context).hideCurrentSnackBar();
//                     AppAvailability.launchApp(
//                             installedApps![index]["package_name"])
//                         .then((_) {
//                       print(
//                           "App ${installedApps![index]["app_name"]} launched!");
//                     }).catchError((err) {
//                       Scaffold.of(context).showSnackBar(SnackBar(
//                           content: Text(
//                               "App ${installedApps![index]["app_name"]} not found!")));
//                       print(err);
//                     });
//                   }),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

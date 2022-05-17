// import 'dart:developer';
// import 'dart:io';
//
// // import 'package:country_code_picker/country_code_picker.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_share/flutter_share.dart';
// import 'package:flutter_share_me/flutter_share_me.dart';
// import 'package:flutter_social_content_share/flutter_social_content_share.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:social_share/social_share.dart';
// import 'package:http/http.dart' as http;
// import 'package:url_launcher/url_launcher.dart';
//
// class LoginAA extends StatefulWidget {
//   const LoginAA({Key? key}) : super(key: key);
//
//   @override
//   _LoginAAState createState() => _LoginAAState();
// }
//
// class _LoginAAState extends State<LoginAA> {
//   final TextEditingController _MobileNumberController = TextEditingController();
//   final TextEditingController _codecontroller = TextEditingController();
//
//   String phoneNumber = " ";
//
//   void _onCountryChange(CountryCode countryCode) {
//     this.phoneNumber = countryCode.toString();
//     print("======>>>New Country selected: " + countryCode.toString());
//   }
//
//   // PickedFile? imageFile;imageFile
//
//   // void _openCamera() async {
//   //   final pickedFile = await ImagePicker().getImage(
//   //     source: ImageSource.gallery,
//   //   );
//   //   setState(() {
//   //     imageFile = pickedFile!;
//   //   });
//   // }
//
//   String? response;
//   final FlutterShareMe flutterShareMe = FlutterShareMe();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Login with Otp"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 8, right: 8, top: 25),
//         child: Column(children: [
//           IntlPhoneField(
//             showCountryFlag: false,
//             decoration: InputDecoration(
//               fillColor: Colors.white,
//               filled: true,
//               focusedErrorBorder: OutlineInputBorder(
//                 borderSide: BorderSide.none,
//                 borderRadius: BorderRadius.circular(25),
//               ),
//               contentPadding:
//                   const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//               enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide.none,
//                   borderRadius: BorderRadius.circular(25)),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide.none,
//                 borderRadius: BorderRadius.circular(25),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           // InkWell(
//           //   onTap: () {
//           //     _openCamera();
//           //   },
//           //   child: SizedBox(
//           //     height: 100,
//           //     width: 400,
//           //     child: (imageFile == null)
//           //         ? const Text("Choose Image")
//           //         : Image.file(File(imageFile!.path)),
//           //   ),
//           // ),
//           ElevatedButton(
//             child: const Text('Share to Twitter'),
//             onPressed: () async {
//               final image = await ImagePicker.platform
//                   .pickImage(source: ImageSource.gallery);
//               await Share.shareFiles([image!.path]);
//             },
//           ),
//           ElevatedButton(
//             child: const Text('Share to Twitter'),
//             onPressed: () async {
//               final image = await ImagePicker.platform
//                   .pickImage(source: ImageSource.gallery);
//
//               // SocialShare.shareTwitter(image!.path);
//
//               flutterShareMe.shareToTwitter(msg: image!.path);
//             },
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           TextFormField(
//             decoration: InputDecoration(
//                 contentPadding: const EdgeInsets.symmetric(vertical: 2),
//                 prefixIcon: CountryCodePicker(
//                   // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
//                   initialSelection: '+91',
//                   favorite: const ['+221', 'SN'],
//                   textStyle: TextStyle(color: Colors.orange[900]),
//                   showFlag: false,
//                   showFlagDialog: true,
//                   comparator: (a, b) => a.name!.compareTo(a.name!),
//
//                   onInit: (code) => print("${code!.name} ${code.dialCode}"),
//                 ),
//                 focusColor: Colors.orange[900],
//                 labelStyle:
//                     TextStyle(fontSize: 15.0, color: Colors.orange[900]),
//                 /* hintStyle: TextStyle(
//               color: Colors.orange[900]
//               ) */
//                 enabledBorder: const OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                     borderSide: BorderSide(color: Colors.white)),
//                 focusedBorder: const OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                     borderSide: BorderSide(color: Colors.white)),
//                 floatingLabelBehavior: FloatingLabelBehavior.never),
//             keyboardType: TextInputType.phone,
//             style: TextStyle(
//               color: Colors.orange[900],
//               decorationColor: Colors.white,
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           ElevatedButton(
//             onPressed: () async {
//               final image = await ImagePicker.platform
//                   .pickImage(source: ImageSource.gallery);
//
//               flutterShareMe.shareToWhatsApp(imagePath: image!.path);
//             },
//             child: const Text(
//               'Share to Whatsapp',
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () async {
//               final image = await ImagePicker.platform
//                   .pickImage(source: ImageSource.gallery);
//               FlutterSocialContentShare.share(
//                   type: ShareType.instagramWithImageUrl, imageUrl: image!.path);
//             },
//             child: const Text(
//               'Twitter',
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () async {
//               final image = await ImagePicker.platform
//                   .pickImage(source: ImageSource.gallery);
//               SocialShare.shareOptions(" ", imagePath: image?.path);
//
//               // FlutterSocialContentShare.share(
//               //     type: ShareType.instagramWithImageUrl, imageUrl: image!.path);
//             },
//             child: const Text(
//               'Twitter',
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
//
//   openTelegram() async {
//     final image =
//         await ImagePicker.platform.pickImage(source: ImageSource.gallery);
//     var telegramUrl = 'https://telegram.me/ ?text=hello${image!.path} ';
//     if (Platform.isAndroid) {
//       if (await canLaunch(telegramUrl)) {
//         await launch(telegramUrl);
//       } else {
//         SocialShare.shareTelegram(telegramUrl);
//       }
//     } else {
//       await launch(telegramUrl);
//     }
//   }
// }

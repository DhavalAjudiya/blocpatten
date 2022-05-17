import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:social_share/social_share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:device_apps/device_apps.dart';

class Telegram extends StatefulWidget {
  Telegram({Key? key}) : super(key: key);

  @override
  State<Telegram> createState() => _TelegramState();
}

class _TelegramState extends State<Telegram> {
  final TextEditingController controller = TextEditingController();

  openTelegram() async {
    var telegramUrl = 'https://telegram.me/telegramUsername';
    if (Platform.isAndroid) {
      if (await canLaunch(telegramUrl)) {
        await launch(telegramUrl);
        SocialShare.shareTelegram(controller.text);
      }
    } else {
      await launch(telegramUrl);
    }
  }

  String? birthDateInString;
  DateTime? birthDate;
  bool isDateSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Telegram Share')),
      body: Column(
        children: [
          TextField(
            controller: controller,
          ),
          Center(
            child: Column(
              children: [
                // ElevatedButton(
                //   onPressed: () async {
                //     if(await canLaunch('https://telegram.me/telegramUsername')) {
                //       Text(controller.text);
                //     }
                //   },
                //   child: Text('telegram'),
                // ),
                // ElevatedButton(
                //   onPressed: () async {
                //     bool isInstalled =  await DeviceApps.isAppInstalled(
                //         'https://play.google.com/store/search?q=telegram');
                //     //  const url = 'https://telegram.org/android';
                //     var url1 = 'https://telegram.me/telegramUsername';
                //     if (isInstalled) {
                //       await launch(url1);
                //       // canLaunch(controller.text);
                //       // print(controller.text);
                //     } else {
                //       throw 'could not launch$url1';
                //     }
                //   },
                //   child: const Text(
                //     'Telegram Share',
                //   ),
                // ),
                // ElevatedButton(
                //   onPressed: () async {
                //     //  const url = 'https://telegram.org/android';
                //     var url1 = 'https://telegram.me/telegramUsername';
                //     if (await canLaunch(url1)) {
                //       await launch(url1);
                //       //    FlutterShare.share(text: controller.text,linkUrl: url1,title: '');
                //       // Share.shareWithResult(controller.text);
                //       print(controller.text);
                //     } else {
                //       throw 'could not launch$url1';
                //     }
                //   },
                //   child: const Text(
                //     'Telegram Share 1',
                //   ),
                // ),
                // ElevatedButton(
                //   onPressed: () async {
                //     bool isInstalled = await DeviceApps.isAppInstalled(
                //         'https://play.google.com/store/search?q=telegram');
                //     print("asd${isInstalled}");
                //     var url1 = 'https://telegram.me/telegramUsername';
                //     if (isInstalled) {
                //       canLaunch(url1);
                //     } else {
                //       SocialShare.shareTelegram(controller.text);
                //     }
                //   },
                //   child: const Text('Social Share'),
                // ),
                // ElevatedButton(
                //   onPressed: () async {
                //     //  const url = 'https://telegram.org/android';
                //     var url1 = 'https://telegram.me/telegramUsername';
                //     if (await canLaunch(url1)) {
                //       await launch(url1);
                //       Share.share(controller.text);
                //       print(controller.text);
                //     } else {
                //       throw 'could not launch$url1';
                //     }
                //   },
                //   child: const Text(
                //     'Telegram Share 1',
                //   ),
                // ),
                // ElevatedButton(
                //   onPressed: () async {
                //     //  const url = 'https://telegram.org/android';
                //     var url1 = 'https://telegram.me/telegramUsername';
                //     if (await canLaunch(url1)) {
                //       await launch(url1);
                //       Share.share(controller.text);
                //       print('==>>>${Share.share(controller.text)}');
                //       print(controller.text);
                //     } else {
                //       throw 'could not launch$url1';
                //     }
                //   },
                //   child: const Text(
                //     'Telegram Share 1',
                //   ),
                //)

                ElevatedButton(
                  onPressed: () {
                    openTelegram();
                  },
                  child: const Text(
                    'URlLauch',
                  ),
                ),
                GestureDetector(
                    child: new Icon(Icons.calendar_today),
                    onTap: () async {
                      final datePick = await showDatePicker(
                          context: context,
                          initialDate: new DateTime.now(),
                          firstDate: new DateTime(1900),
                          lastDate: new DateTime(2100));
                      if (datePick != null && datePick != birthDate) {
                        setState(() {
                          birthDate = datePick;
                          isDateSelected = true;

                          // put it here
                          birthDateInString =
                              "${birthDate?.month}/${birthDate?.day}/${birthDate?.year}"; // 08/14/2019
                        });
                      }
                    }),
                Text("${birthDateInString}")
              ],
            ),
          ),
        ],
      ),
    );
  }
}

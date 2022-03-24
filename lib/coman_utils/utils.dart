import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  static String deCompressData(String compressedString) {
    final compressedData = base64Decode(compressedString);
    final decodedData = GZipCodec().decode(compressedData);
    return utf8.decode(decodedData, allowMalformed: true);
  }

  static void dismissKeyboard(BuildContext context) =>
      FocusScope.of(context).requestFocus(FocusNode());

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  static void hideKeyboardInApp(BuildContext context) {
    var currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }

  static String convertMillisecondsToFormatDate(int date, {String? format}) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(date);
    return DateFormat(format ?? 'dd MMM yyyy hh:mm a').format(dateTime);
  }

  static String getProfit({num? avgPrice, num? quantity, num? marketPrice}) {
    if (avgPrice != null && quantity != null && marketPrice != null) {
      num invest = avgPrice * quantity;
      num currentValue = marketPrice * quantity;
      num profit = currentValue - invest;
      return profit.toStringAsFixed(3);
    } else {
      return '-';
    }
  }

  static String getTotalProfit(
      {num? avgPrice, num? quantity, num? marketPrice}) {
    if (avgPrice != null && quantity != null && marketPrice != null) {
      num profit = (marketPrice - avgPrice) * quantity;
      return profit.setAfterDotValue();
    } else {
      return '-';
    }
  }

  static bool isNegativeValue(String profit) {
    return num.parse(profit) < 0;
  }

  static String getPercentage(
      {num? avgPrice, num? quantity, num? marketPrice}) {
    if (avgPrice != null && quantity != null && marketPrice != null) {
      num invest = avgPrice * quantity;
      num currentValue = marketPrice * quantity;
      num profit = currentValue - invest;
      if (invest <= 0.0) {
        return 0.0.toStringAsFixed(2);
      }
      num percentage = profit / invest * 100;
      return percentage.toStringAsFixed(2);
    } else {
      return '-';
    }
  }

  // static String getRemainTimeFromMilliSecond(int milliSecond) {
  //   String result;
  //
  //   Duration dif = DateTime.fromMillisecondsSinceEpoch(milliSecond)
  //       .difference(DateTime.now());
  //
  //   var test = dif.toString().split(':');
  //
  //   if (dif.inMinutes < 60) {
  //     result = '${test[1]}m ${test[2].split('.').first}s';
  //   } else if (dif.inMinutes < 2840) {
  //     result = '${test[0]}h ${test[1]}m';
  //   } else {
  //     result = '${dif.inDays} days';
  //   }
  //   return result;
  // }

  static String timeAgoSinceDate(int milliSecond) {
    //week 1646110200000 Tue Mar 01 2022 04:50:00
    //days 1646455800000 Sat Mar 05 2022 04:50:00
    //year 1614919800000 Fri Mar 05 2021 04:50:00
    //month 1644382200000  9-2-2022
    DateTime date = DateTime.fromMillisecondsSinceEpoch(milliSecond);
    final date2 = DateTime.now();
    final difference = date2.difference(date);
    final duration = Duration(
        days: date.day,
        hours: date.hour,
        minutes: date.minute,
        seconds: date.second);
    var hours = date2.subtract(duration).hour;
    var minutes = date2.subtract(duration).minute;

    if ((difference.inDays / 365).floor() >= 1) {
      return '${(difference.inDays / 365).floor()}Y ${hours}H ${minutes}m';
    } else if ((difference.inDays /
                daysInMonth(monthNum: date.month, year: date.year))
            .floor() >=
        1) {
      return '${(difference.inDays / daysInMonth(monthNum: date.month, year: date.year)).floor()}M ${hours}H ${minutes}m';
    } else if ((difference.inDays / 7).floor() >= 1) {
      return '${(difference.inDays / 7).floor()}W ${hours}H ${minutes}m';
    } else if ((difference.inDays).floor() >= 1) {
      return '${(difference.inDays).floor()}D ${hours}H ${minutes}m';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours}H ${minutes}s';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes}m';
    } else {
      return '${difference.inSeconds}s';
    }
  }

  static int daysInMonth({required int monthNum, required int year}) {
    if (monthNum > 12) {
      return 0;
    }
    List<int> monthLength = List.filled(12, 0);
    monthLength[0] = 31;
    monthLength[2] = 31;
    monthLength[4] = 31;
    monthLength[6] = 31;
    monthLength[7] = 31;
    monthLength[9] = 31;
    monthLength[11] = 31;
    monthLength[3] = 30;
    monthLength[8] = 30;
    monthLength[5] = 30;
    monthLength[10] = 30;

    if (leapYear(year) == true)
      monthLength[1] = 29;
    else
      monthLength[1] = 28;

    return monthLength[monthNum - 1];
  }

  static bool leapYear(int year) {
    bool leapYear = false;
    bool leap = ((year % 100 == 0) && (year % 400 != 0));
    if (leap == true)
      leapYear = false;
    else if (year % 4 == 0) leapYear = true;

    return leapYear;
  }

  static void changeProfilePicDialog(BuildContext context,
      {required Function(bool) onProcessSelection}) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeUtils.horizontalBlockSize * 2),
          child: CupertinoActionSheet(
            actions: <Widget>[
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                  onProcessSelection.call(true);
                },
                child: Text(
                  S.of(context).takePhoto,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: SizeUtils.horizontalBlockSize * 4.95,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                  onProcessSelection.call(false);
                },
                child: Text(
                  S.of(context).chooseFormGallery,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: SizeUtils.horizontalBlockSize * 4.95,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                S.of(context).cancel,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: SizeUtils.horizontalBlockSize * 4.95,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

extension NumericExtension on num? {
  String setAfterDotValue() {
    if (this != null && this != 0.0) {
      if ((this ?? 0) < 0) {
        if ((this ?? 0) < 0.00) {
          return "${this?.toStringAsFixed(3)}";
        }
        return "${this?.toStringAsFixed(8)}";
      } else {
        return "${this?.toStringAsFixed(3)}";
      }
    }
    return "0.0";
  }
}

extension StringExtension on String {
  String addUSDT() {
    if (this.toLowerCase().endsWith("usdt")) {
      return this.replaceRange(this.length - 4, this.length, "/USDT");
    }
    return this;
  }
}

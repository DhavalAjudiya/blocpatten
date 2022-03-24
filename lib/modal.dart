// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    this.appDataSet,
    this.userImage,
    this.native,
    this.banner,
    this.moreApps,
    this.msg,
    this.success,
    this.errorCode,
  });

  AppDataSet? appDataSet;
  List<UserImage>? userImage;
  List<Banner>? native;
  List<Banner>? banner;
  List<MoreApp>? moreApps;
  String? msg;
  String? success;
  String? errorCode;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        appDataSet: AppDataSet.fromJson(json["AppDataSet"]),
        userImage: List<UserImage>.from(
            json["UserImage"].map((x) => UserImage.fromJson(x))),
        native:
            List<Banner>.from(json["Native"].map((x) => Banner.fromJson(x))),
        banner:
            List<Banner>.from(json["Banner"].map((x) => Banner.fromJson(x))),
        moreApps: List<MoreApp>.from(
            json["MoreApps"].map((x) => MoreApp.fromJson(x))),
        msg: json["msg"],
        success: json["success"],
        errorCode: json["error_code"],
      );

  Map<String, dynamic> toJson() => {
        "AppDataSet": appDataSet!.toJson(),
        "UserImage": List<dynamic>.from(userImage!.map((x) => x.toJson())),
        "Native": List<dynamic>.from(native!.map((x) => x.toJson())),
        "Banner": List<dynamic>.from(banner!.map((x) => x.toJson())),
        "MoreApps": List<dynamic>.from(moreApps!.map((x) => x.toJson())),
        "msg": msg,
        "success": success,
        "error_code": errorCode,
      };
}

class AppDataSet {
  AppDataSet({
    this.admobAppOpen,
    this.admobInterstitial,
    this.admobNative,
    this.admobBanner,
    this.adType,
    this.adCount,
    this.isAdOnBack,
    this.appOpenCount,
    this.nativeButtonColor,
    this.nativeAdStyle,
    this.apr,
  });

  String? admobAppOpen;
  String? admobInterstitial;
  String? admobNative;
  String? admobBanner;
  String? adType;
  String? adCount;
  String? isAdOnBack;
  String? appOpenCount;
  String? nativeButtonColor;
  String? nativeAdStyle;
  String? apr;

  factory AppDataSet.fromJson(Map<String, dynamic> json) => AppDataSet(
        admobAppOpen: json["AdmobAppOpen"],
        admobInterstitial: json["AdmobInterstitial"],
        admobNative: json["AdmobNative"],
        admobBanner: json["AdmobBanner"],
        adType: json["AdType"],
        adCount: json["AdCount"],
        isAdOnBack: json["IsAdOnBack"],
        appOpenCount: json["AppOpenCount"],
        nativeButtonColor: json["NativeButtonColor"],
        nativeAdStyle: json["NativeAdStyle"],
        apr: json["APR"],
      );

  Map<String, dynamic> toJson() => {
        "AdmobAppOpen": admobAppOpen,
        "AdmobInterstitial": admobInterstitial,
        "AdmobNative": admobNative,
        "AdmobBanner": admobBanner,
        "AdType": adType,
        "AdCount": adCount,
        "IsAdOnBack": isAdOnBack,
        "AppOpenCount": appOpenCount,
        "NativeButtonColor": nativeButtonColor,
        "NativeAdStyle": nativeAdStyle,
        "APR": apr,
      };
}

class Banner {
  Banner({
    this.image,
    this.link,
  });

  String? image;
  String? link;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        image: json["image"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "link": link,
      };
}

class MoreApp {
  MoreApp({
    this.name,
    this.icon,
    this.link,
  });

  String? name;
  String? icon;
  String? link;

  factory MoreApp.fromJson(Map<String, dynamic> json) => MoreApp(
        name: json["name"],
        icon: json["icon"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "icon": icon,
        "link": link,
      };
}

class UserImage {
  UserImage({
    this.imageUrl,
    this.name,
  });

  String? imageUrl;
  String? name;

  factory UserImage.fromJson(Map<String, dynamic> json) => UserImage(
        imageUrl: json["imageUrl"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl,
        "name": name,
      };
}

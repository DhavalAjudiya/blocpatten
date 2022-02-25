// To parse this JSON data, do
//
//     final cricket = cricketFromJson(jsonString);

import 'dart:convert';

Cricket cricketFromJson(String str) => Cricket.fromJson(json.decode(str));

String cricketToJson(Cricket data) => json.encode(data.toJson());

class Cricket {
  Cricket({
    this.newsdata,
  });

  List<Newsdatum>? newsdata;

  factory Cricket.fromJson(Map<String, dynamic> json) => Cricket(
        newsdata: List<Newsdatum>.from(
            json["newsdata"].map((x) => Newsdatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "newsdata": List<dynamic>.from(newsdata!.map((x) => x.toJson())),
      };
}

class Newsdatum {
  Newsdatum({
    this.seasonid,
    this.newsid,
    this.title,
    this.photo,
    this.description,
    this.postdate,
  });

  String? seasonid;
  String? newsid;
  String? title;
  String? photo;
  String? description;
  DateTime? postdate;

  factory Newsdatum.fromJson(Map<String, dynamic> json) => Newsdatum(
        seasonid: json["seasonid"],
        newsid: json["newsid"],
        title: json["title"],
        photo: json["photo"],
        description: json["description"],
        postdate: DateTime.parse(json["postdate"]),
      );

  Map<String, dynamic> toJson() => {
        "seasonid": seasonid,
        "newsid": newsid,
        "title": title,
        "photo": photo,
        "description": description,
        "postdate":
            "${postdate!.year.toString().padLeft(4, '0')}-${postdate!.month.toString().padLeft(2, '0')}-${postdate!.day.toString().padLeft(2, '0')}",
      };
}

// To parse this JSON data, do
//
//     final myApiFile = myApiFileFromJson(jsonString);

import 'dart:convert';

List<MyApiFile> myApiFileFromJson(String str) => List<MyApiFile>.from(json.decode(str).map((x) => MyApiFile.fromJson(x)));

String myApiFileToJson(List<MyApiFile> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyApiFile {
  int userId;
  int id;
  String title;
  String body;

  MyApiFile({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory MyApiFile.fromJson(Map<String, dynamic> json) => MyApiFile(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}

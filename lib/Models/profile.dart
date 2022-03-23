// To parse this JSON data, do
//
//     final dumyModel = dumyModelFromJson(jsonString);

import 'dart:convert';

List<DumyModel> dumyModelFromJson(String str) =>
    List<DumyModel>.from(json.decode(str).map((x) => DumyModel.fromJson(x)));

String dumyModelToJson(List<DumyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DumyModel {
  DumyModel({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  factory DumyModel.fromJson(Map<String, dynamic> json) => DumyModel(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );
  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}

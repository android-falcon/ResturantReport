// To parse this JSON data, do
//
//     final discDetailsModel = discDetailsModelFromJson(jsonString);

import 'dart:convert';

List<DiscDetailsModel> discDetailsModelFromJson(String str) => List<DiscDetailsModel>.from(json.decode(str).map((x) => DiscDetailsModel.fromJson(x)));

String discDetailsModelToJson(List<DiscDetailsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DiscDetailsModel {
  DiscDetailsModel({
    this.discno,
    this.discdescreption,
    this.disc,
  });

  String? discno;
  String? discdescreption;
  String? disc;

  factory DiscDetailsModel.fromJson(Map<String, dynamic> json) => DiscDetailsModel(
    discno: json["DISCNO"],
    discdescreption: json["DISCDESCREPTION"],
    disc: json["DISC"],
  );

  Map<String, dynamic> toJson() => {
    "DISCNO": discno,
    "DISCDESCREPTION": discdescreption,
    "DISC": disc,
  };
}

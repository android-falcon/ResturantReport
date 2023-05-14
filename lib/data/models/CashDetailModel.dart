import 'dart:convert';

List<CashDetailModel> cashDetailModelFromJson(String str) => List<CashDetailModel>.from(json.decode(str).map((x) => CashDetailModel.fromJson(x)));

String cashDetailModelToJson(List<CashDetailModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CashDetailModel {
  CashDetailModel({
    this.name,
    this.amoumt,
  });

  String? name;
  String? amoumt;


  factory CashDetailModel.fromJson(Map<String, dynamic> json) => CashDetailModel(
    name: json["CNAME"],
    amoumt: json["AMOUNT"],
  );

  Map<String, dynamic> toJson() => {
    "CNAME": name,
    "AMOUNT": amoumt,
  };
}
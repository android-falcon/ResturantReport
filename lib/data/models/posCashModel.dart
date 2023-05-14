import 'dart:convert';

List<PosCashModel> posCashModelFromJson(String str) => List<PosCashModel>.from(json.decode(str).map((x) => PosCashModel.fromJson(x)));

String posCashModelToJson(List<PosCashModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PosCashModel {
  PosCashModel({
    this.sales,
    this.returned,
    this.net,
  });

  String? sales;
  String? returned;
  String? net;

  factory PosCashModel.fromJson(Map<String, dynamic> json) => PosCashModel(
    sales: json["SALES"],
    returned: json["RETURNED"],
    net: json["NET"],
  );

  Map<String, dynamic> toJson() => {
    "SALES": sales,
    "RETURNED": returned,
    "NET": net,
  };
}
// To parse this JSON data, do
//
//     final soledQtyModel = soledQtyModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final soledQtyModel = soledQtyModelFromJson(jsonString);

import 'dart:convert';

List<SoledQtyModel> soledQtyModelFromJson(String str) => List<SoledQtyModel>.from(json.decode(str).map((x) => SoledQtyModel.fromJson(x)));

String soledQtyModelToJson(List<SoledQtyModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SoledQtyModel {
  SoledQtyModel({
    this.itemk,
    this.itemm,
    this.itemg,
    this.itemocode,
    this.itemonamea,
    this.price,
    this.hints,
    this.disc,
    this.qty,
    this.gross,
    this.tax,
    this.service,
    this.servicetax,
    this.grossperc,
    this.net,
  });

  String? itemk;
  String? itemm;
  String? itemg;
  String? itemocode;
  String? itemonamea;
  String? price;
  String? hints;
  String? disc;
  String? qty;
  String? gross;
  String? tax;
  String? service;
  String? servicetax;
  String? grossperc;
  String? net;

  factory SoledQtyModel.fromJson(Map<String, dynamic> json) => SoledQtyModel(
    itemk: json["ITEMK"]!,
    itemm: json["ITEMM"]!,
    itemg: json["ITEMG"],
    itemocode: json["ITEMOCODE"],
    itemonamea: json["ITEMONAMEA"],
    price: json["PRICE"],
    hints: json["HINTS"],
    disc: json["DISC"],
    qty: json["QTY"],
    gross: json["GROSS"],
    tax: json["TAX"],
    service: json["SERVICE"],
    servicetax: json["SERVICETAX"],
    grossperc: json["GROSSPERC"],
    net: json["NET"],
  );

  Map<String, dynamic> toJson() => {
    "ITEMK": itemk,
    "ITEMM": itemm,
    "ITEMG": itemg,
    "ITEMOCODE": itemocode,
    "ITEMONAMEA": itemonamea,
    "PRICE": price,
    "HINTS": hints,
    "DISC": disc,
    "QTY": qty,
    "GROSS": gross,
    "TAX": tax,
    "SERVICE": service,
    "SERVICETAX": servicetax,
    "GROSSPERC": grossperc,
    "NET": net,
  };
}







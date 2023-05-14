
import 'dart:convert';

List<Pos_Info> groupSalesFromJson(String str) => List<Pos_Info>.from(
    json.decode(str).map((x) => Pos_Info.fromJson(x)));

String groupSalesToJson(List<Pos_Info> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pos_Info{
  String? posno;
  String ? posName;
  Pos_Info.fromJson(Map<String, dynamic> json) {
    posName = json['POSNAME'];
    posno = json['POSNO'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['POSNAME'] = this.posName;
    data['POSNO'] = this.posno;
    return data;
  }
}
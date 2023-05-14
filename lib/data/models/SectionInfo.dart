
import 'dart:convert';

List<SectionInfo> groupSalesFromJson(String str) => List<SectionInfo>.from(
    json.decode(str).map((x) => SectionInfo.fromJson(x)));

String groupSalesToJson(List<SectionInfo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SectionInfo{
  String? sectioNO;
  String ? secName;

  SectionInfo(this.sectioNO, this.secName);

  SectionInfo.fromJson(Map<String, dynamic> json) {
    secName = json['TSCNAMEA'];
    sectioNO = json['TSCNO'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['POSNAME'] = this.secName;
    data['TSCNO'] = this.sectioNO;
    return data;
  }
}
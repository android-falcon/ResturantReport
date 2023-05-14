import 'dart:convert';

List<Group_Detail> groupSalesFromJson(String str) => List<Group_Detail>.from(
    json.decode(str).map((x) => Group_Detail.fromJson(x)));

String groupSalesToJson(List<Group_Detail> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Group_Detail {
  String? iTEMK;
  String? iTEMM;
  String? iTEMG;
  String? hINTS;
  String? qTY;
  String? tAX;
  String? dISC;
  String? gROSS;
  String? gROSSSUM;
  String? tOTAFTRDISC;
  String? sERVICE;
  String? sERVICETAX;
  String? nET;
  String? pOSNO;

  Group_Detail.fromJson(Map<String, dynamic> json) {
    iTEMK= json['ITEMK'] ?? "";
    iTEMM = json['ITEMM'] ?? "";

    iTEMG = json['ITEMG'] ?? "";

    hINTS = json['HINTS'] ?? "";

    qTY = json['QTY'] ?? "";

    tAX = json['TAX'] ?? "";

    dISC = json['DISC'] ?? "";

    gROSS = json['GROSS'] ?? "";

    gROSSSUM = json['GROSSSUM'] ?? "";

    tOTAFTRDISC = json['TOTAFTRDISC'] ?? "";

    sERVICE = json['SERVICE'] ?? "";

    sERVICETAX = json['SERVICETAX'] ?? "";

    nET = json['NET'] ?? "";

    pOSNO = json['POSNO'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ITEMK'] = this.iTEMK;
    data['ITEMM'] = this.iTEMM;
    data['ITEMG'] = this.iTEMG;
    data['HINTS'] = this.hINTS;
    data['QTY'] = this.qTY;
    data['TAX'] = this.tAX;
    data['DISC'] = this.dISC;
    data['GROSS'] = this.gROSS;
    data['GROSSSUM'] = this.gROSSSUM;
    data['TOTAFTRDISC'] = this.tOTAFTRDISC;
    data['SERVICE'] = this.sERVICE;
    data['SERVICETAX'] = this.sERVICETAX;
    data['NET'] = this.nET;
    data['POSNO'] = this.pOSNO;
    return data;
  }
}

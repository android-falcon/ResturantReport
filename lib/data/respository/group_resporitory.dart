

import 'package:report_resturant_flutter/data/models/pos_info.dart';

import '../models/group_detail.dart';
import '../webservice/group_webservices.dart';

class GroupRespository{
  final GroupWebServices groupWebServices;

  GroupRespository(this.groupWebServices);

  Future<List<Group_Detail>> getGroupReportReposotery()  async {
   // final groupsData= await groupWebServices.getGroupReportData();
   // print("getGroupReportReposotery"+groupsData.toString());


  return [];
    // groupsData.map((groupD)=> Group_Detail.fromJson(groupD)).toList();
  }
  Future<List<Pos_Info>> getPOSReposotery()  async {
    final groupsData= await groupWebServices.getPOSData();
    print("getgetPOSReposotery"+groupsData.toString());


    return   groupsData.map((groupD)=> Pos_Info.fromJson(groupD)).toList();
  }



}
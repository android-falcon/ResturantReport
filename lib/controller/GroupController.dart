import 'package:get/state_manager.dart';
import 'package:report_resturant_flutter/Utils/utils.dart';

import '../data/models/group_detail.dart';
import '../data/models/pos_info.dart';
import '../data/webservice/group_webservices.dart';
class GroupController extends GetxController{
  var listGroup= <Group_Detail>[].obs;
  var listGroup_all= <Group_Detail>[].obs;

  var listGroup_filter= <Group_Detail>[].obs;

  var listPos= <Pos_Info>[].obs;
  var isLoading=true.obs;
  var listFilterGroup=<String>[].obs;
  GroupWebServices groupWebServices=new GroupWebServices();//as RxList<Group_Detail>
  Future<List<Group_Detail>>  fetchReportGroupData(var fromDate,var toDate,var posNo) async{


    try{
      isLoading(true);
      print("listData******2fromDate=="+fromDate+" \t"+toDate+" \t"+posNo);

      GroupWebServices groupWebServices=new GroupWebServices();//as RxList<Group_Detail>
      var listData= await groupWebServices.getGroupDetails(fromDate,toDate,posNo) ;
      print("listData******2"+listData.length.toString());
      if(listData!=null)
      {
        listGroup.value=listData;
        listGroup_all.value=listData;
        var y = listData.where((e) => e.iTEMG!.isNotEmpty).map((obj) => obj.iTEMG).toSet().toList();
        listFilterGroup.add("All");
        listData.forEach((element) {listFilterGroup.add(element.iTEMG.toString());});
        print("listData+lengthy="+y.length.toString());
        print("listData+lengthy="+listFilterGroup.length.toString());
        listFilterGroup= listFilterGroup.toSet().toList().obs;
        return listData;
      }return [];
    }finally{
      isLoading(false);
    }

  }
  Future<List<Pos_Info>>  fetchPosData() async{
    try{
      var listData= await groupWebServices.getPosData() ;
      print("fetchPosData******2"+listData.length.toString());
      if(listData!=null)
      {
        listPos.value=listData;
        return listData;
      }return [];
    }finally{
      isLoading(false);
    }
    isLoading(false);

  }
  filterByGroup(var group){
    // listGroup.value.addAll(listGroup_all.value);
    if(group.toString().isNotEmpty)
      if(group.toString().contains("All"))
        listGroup.value=listGroup_all.value;
      else{
        listGroup_filter.value = listGroup_all.where((e) => e.iTEMG!.contains(group)).map((obj) => obj).toSet().toList();
        listGroup.value=listGroup_filter.value;
      }

    print("listData+lengthy="+listGroup.length.toString());

  }
  @override
  void onInit() {
    // TODO: implement onInit
    // fetchReportGroup();
    fetchPosData();
    super.onInit();
  }

}
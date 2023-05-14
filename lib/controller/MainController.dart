

import 'package:get/state_manager.dart';
import 'package:report_resturant_flutter/Utils/utils.dart';
import 'package:report_resturant_flutter/data/models/SectionInfo.dart';

import '../data/models/group_detail.dart';
import '../data/models/pos_info.dart';
import '../data/webservice/group_webservices.dart';
class MainController extends GetxController{
   var listPos= <Pos_Info>[].obs;
   var listSection= <SectionInfo>[].obs;

   GroupWebServices groupWebServices=new GroupWebServices();//as RxList<Group_Detail>

  Future<void>  fetchPosData() async{
    try{
      var listData= await groupWebServices.getPosData() ;
      print("fetchPosData******2"+listData.length.toString());
      if(listData!=null)
      {
        listPos.value=listData;
        fetchSectionData();
        // return listData;
      }
      // return [];
    }finally{
    }

  }
   Future<List<SectionInfo>>  fetchSectionData() async{
     try{
       var listData= await groupWebServices.getSectionData() ;
       print("fetchlistSectionData******"+listData.length.toString());
       listSection.clear();
       if(listData!=null)
       {

         listSection.value.addAll(listData);
         listSection.value.insert(0,SectionInfo("0","All"));

         print("fetchlistSectionData******"+listSection.length.toString());

         return listData;
       }return [];
     }finally{
     }

   }
  @override
  void onInit() {
    // TODO: implement onInit
    if(listSection.length==0)
    fetchSectionData();
    if(listPos.length==0)
    fetchPosData();

    super.onInit();
  }

}
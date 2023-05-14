import 'package:get/state_manager.dart';
import 'package:report_resturant_flutter/Utils/utils.dart';

import '../data/models/SoldQtyModel.dart';
import '../data/models/group_detail.dart';
import '../data/models/pos_info.dart';
import '../data/webservice/group_webservices.dart';
class SoldQtyController extends GetxController{
  var listSoldQty= <SoledQtyModel>[].obs;
  var listGroup_all= <SoledQtyModel>[].obs;


  var listPos= <Pos_Info>[].obs;
  double get totalDiscount=>listSoldQty.fold(0, (sum, element) =>(sum + (double.parse(element.disc.toString()) )));

  double get totalTax=>listSoldQty.fold(0, (sum, element) =>(sum + (double.parse(element.tax.toString()) )));
  double get totalNet=>listSoldQty.fold(0, (sum, element) =>(sum + (double.parse(element.net.toString()) )));

  double get totalGross=>listSoldQty.fold(0, (sum, element) =>(sum + (double.parse(element.gross.toString()) )));
  GroupWebServices groupWebServices=new GroupWebServices();//as RxList<Group_Detail>)
  Future<List<SoledQtyModel>>  getSoldQtyDetails(var fromDate,var toDate,var posNo) async{


   
    try{
      print("listData******2fromDate=="+fromDate+" \t"+toDate+" \t"+posNo);
      var listData= await groupWebServices.getSoldQtyDetails(fromDate,toDate,posNo) ;
      print("listData******2"+listData.length.toString());
      if(listData!=null)
      {
        listSoldQty.value=listData;

        return listData;
      }return [];
    }finally{
    }

  }


  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }

}
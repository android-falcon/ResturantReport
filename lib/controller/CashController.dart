import 'package:get/state_manager.dart';
import 'package:report_resturant_flutter/Utils/utils.dart';
import 'package:report_resturant_flutter/data/models/CashDetailModel.dart';
import 'package:report_resturant_flutter/data/models/DiscountDetail.dart';
import 'package:report_resturant_flutter/data/models/SectionInfo.dart';
import 'package:report_resturant_flutter/data/models/posCashModel.dart';
import 'package:intl/intl.dart';
import '../data/webservice/group_webservices.dart';
class CashController extends GetxController{
  var listPosCash= <PosCashModel>[].obs;
  var listSection= <SectionInfo>[].obs;
  var listPosCashDetails= <CashDetailModel>[].obs;
  var totalDisc="0".obs,netOpenTable="0".obs,transOpen="0".obs
  ,transClose="0".obs,customerOpen="0".obs,customerClose="0".obs;

  var listDiscountDetails= <DiscDetailsModel>[].obs;

  GroupWebServices groupWebServices=new GroupWebServices();//as RxList<Group_Detail>
  isCurrentDate(var fromDate,var toDate) {
    // fromDateValue = DateFormat('dd/MM/yyyy').format(selectedDateFrom);
    // toDateValue;
    print("fromDateValue="+fromDate+"  toDateValue= "+toDate);
    DateTime currentDate = DateTime.now();
    var textCurrentDate = DateFormat('dd/MM/yyyy').format(currentDate);
    print("textCurrentDate="+textCurrentDate);

    if(fromDate.toString().contains(textCurrentDate)&&toDate.toString().contains(textCurrentDate))
      return 1;
    else return 0;
  }
  Future<void>  getPosCash(var fromDate,var toDate,var posNo,{var scno="-1"}) async{
    try{
      Utils.showLoadingDialog();

      print("listData******getPosCashe=="+fromDate+" \t"+toDate+" \t"+posNo+" \t"+scno);
      var listData= await groupWebServices.getCashInfo(fromDate,toDate,posNo,scno) ;
      print("listDagetPosCash"+listData.length.toString());
      if(listData!=null)
      {
        listPosCash.value=listData;

        getPosCashDetail(fromDate,toDate,posNo,scno: scno);
        // return listData;
      }
      // return [];
    }finally{
    }

  }
  Future<void>  getPosCashDetail(var fromDate,var toDate,var posNo,{var scno="-1"}) async{
    try{
      var listData= await groupWebServices.getCashDetailsInfo(fromDate,toDate,posNo,scno) ;
      if(listData!=null)
      {
        listPosCashDetails.value=listData;
        getDiscTotal(fromDate,toDate,posNo,scno: scno);

      }
    }finally{
    }

  }
  Future<void>  getDiscTotal(var fromDate,var toDate,var posNo,{var scno="-1"}) async{
    try{
      print("getPosCashDetail******getPosCashe=="+fromDate+" \t"+toDate+" \t"+posNo+" \t"+scno);
      var listData= await groupWebServices.getTotalDisc(fromDate,toDate,posNo,scno) ;
      print("getPosCashDetail"+listData.length.toString());
      if(listData!=null)
      {
        totalDisc.value=listData;
        getDiscDetails(fromDate,toDate,posNo,scno: scno);


      }
    }finally{

    }

  }
  Future<void>  getDiscDetails(var fromDate,var toDate,var posNo,{var scno="-1"}) async{
    try{
      print("getPosCashDetail******getPosCashe=="+fromDate+" \t"+toDate+" \t"+posNo+" \t"+scno);
      var listData= await groupWebServices.getDiscDetails(fromDate,toDate,posNo,scno) ;
      print("getPosCashDetail"+listData.length.toString());
      if(listData!=null)
      {
        listDiscountDetails.value=listData;
        getNetOpenTable(fromDate,toDate,posNo,scno: scno);

      }
    }finally{
    }

  }

  //*********************************************************************************************//
  Future<void>  getNetOpenTable(var fromDate,var toDate,var posNo,{var scno="-1"}) async{
    try{
      print("getPosCashDetail******getPosCashe=="+fromDate+" \t"+toDate+" \t"+posNo+" \t"+scno);
      var listData= await groupWebServices.getNetOpenTable_api(fromDate,toDate,posNo,scno) ;
      print("netOpenTable"+listData.toString());
      if(listData!=null)
      {
        netOpenTable.value=listData;
        getTransOpen(fromDate,toDate,posNo,scno: scno);


      }
    }finally{

    }

  }
  Future<void>  getTransOpen(var fromDate,var toDate,var posNo,{var scno="-1"}) async{
    try{
      var cDate=isCurrentDate(fromDate,toDate);
      print("cDate"+cDate.toString());
      print("getPosCashDetail******getPosCashe=="+fromDate+" \t"+toDate+" \t"+posNo+" \t"+scno);
      var listData= await groupWebServices.getTransOpen_api(fromDate,toDate,posNo,scno,0) ;
      print("getPosCashDetail"+listData.length.toString());
      if(listData!=null)
      {
        transOpen.value=listData;
        getTransClose(fromDate,toDate,posNo,scno: scno);


      }
    }finally{

    }

  }
  Future<void>  getTransClose(var fromDate,var toDate,var posNo,{var scno="-1"}) async{
    try{
      print("getPosCashDetail******getPosCashe=="+fromDate+" \t"+toDate+" \t"+posNo+" \t"+scno);
      var listData= await groupWebServices.getTransOpen_api(fromDate,toDate,posNo,scno,1) ;
      print("getPosCashDetail"+listData.length.toString());
      if(listData!=null)
      {
        transClose.value=listData;
        getCustomerOpen(fromDate,toDate,posNo,scno: scno);


      }
    }finally{

    }

  }
  Future<void>  getCustomerOpen(var fromDate,var toDate,var posNo,{var scno="-1"}) async{
    try{
      print("getPosCashDetail******getPosCashe=="+fromDate+" \t"+toDate+" \t"+posNo+" \t"+scno);
      var cDate=isCurrentDate(fromDate,toDate);
      print("cDate"+cDate.toString());
      var listData= await groupWebServices.getNumberOfCustomer_api(fromDate,toDate,posNo,scno,1,cDate) ;
      print("getPosCashDetail"+listData.length.toString());
      if(listData!=null)
      {
        customerOpen.value=listData;
        getCustomerClose(fromDate,toDate,posNo,scno: scno);


      }
    }finally{

    }

  }
  Future<void>  getCustomerClose(var fromDate,var toDate,var posNo,{var scno="-1"}) async{
    try{
      var cDate=isCurrentDate(fromDate,toDate);
      print("cDate"+cDate.toString());
      print("getPosCashDetail******getPosCashe=="+fromDate+" \t"+toDate+" \t"+posNo+" \t"+scno);
      var listData= await groupWebServices.getNumberOfCustomer_api(fromDate,toDate,posNo,scno,0,cDate) ;
      print("getPosCashDetail"+listData.length.toString());
      if(listData!=null)
      {
        customerClose.value=listData;
        Utils.hideLoadingDialog();

      }
    }finally{
      Utils.hideLoadingDialog();
    }

  }
  @override
  void onInit() {
    // TODO: implement onInit
    // fetchPosData();

    super.onInit();
  }

}
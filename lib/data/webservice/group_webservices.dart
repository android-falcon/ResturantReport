import 'dart:convert';

import 'dart:developer'       as developer;
//import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:report_resturant_flutter/data/models/CashDetailModel.dart';
import 'package:report_resturant_flutter/data/models/DiscountDetail.dart';
import 'package:report_resturant_flutter/data/models/group_detail.dart';
import 'package:report_resturant_flutter/data/models/posCashModel.dart';
import 'package:report_resturant_flutter/data/models/pos_info.dart';

import '../../Utils/my_shared_preferences.dart';
import '../../Utils/utils.dart';
import '../../constants/strings.dart';
import '../models/SectionInfo.dart';
import '../models/SoldQtyModel.dart';

class GroupWebServices{
 //http://149.200.253.116:83/falcons/van.dll/
 late Dio dio;
 var CONO;
 var VHFTYPE_TAX;
 GroupWebServices(){
    CONO =mySharedPreferences.CoNo;
    VHFTYPE_TAX=mySharedPreferences.TaxType;
  BaseOptions baseOptions=BaseOptions(
   baseUrl:baseURL ,
   receiveDataWhenStatusError:true ,
   // connectTimeout:60*1000 ,
   // receiveTimeout:60*1000 ,
   // baseUrl: mySharedPreferences.baseUrl,
   connectTimeout: 30000,
   receiveTimeout: 30000,
   headers: {
    'Content-Type': 'application/json',
   },
  );
  dio=Dio(baseOptions);
 }//https://www.youtube.com/watch?v=apPH1CCOtKQ&t=1181s


 Future<List<SoledQtyModel>> getSoldQtyDetails(var fromDate,var toDate,var posNo) async {
  try {
   print("listData******3fromDate=="+fromDate+" \t"+toDate+" \t"+posNo);

   // Utils.showLoadingDialog();
   var queryParameters= {
    "CONO": CONO,
    "D1": fromDate,
    "D2": toDate,
    "POSNO": posNo,
    "VTYPE":VHFTYPE_TAX,

   };

   Response response= await dio.get('GetSoldQty',queryParameters: queryParameters);
   _networkLog(response);
   return List<SoledQtyModel>.from(response.data.map((x) => SoledQtyModel.fromJson(x)));
  } on DioError catch (e) {
   _traceError(e);
   // Fluttertoast.showToast(msg: '${e.response?.data ?? 'Please try again'}', timeInSecForIosWeb: 3);
   return [];
  } catch (e) {
   _traceCatch(e);
   // Fluttertoast.showToast(msg: 'Please try again'.tr, timeInSecForIosWeb: 3);
   return [];
  }
 }
  Future<List<Group_Detail>> getGroupDetails(var fromDate,var toDate,var posNo) async {
  try {
   print("listData******3fromDate=="+fromDate+" \t"+toDate+" \t"+posNo);

   // Utils.showLoadingDialog();
  var queryParameters= {
    "CONO": CONO,
    "D1": fromDate,
    "D2": toDate,
    "POSNO": posNo,

   };

  Response response= await dio.get('GetGroupSales',queryParameters: queryParameters);
   _networkLog(response);
   // Utils.hideLoadingDialog();
   return List<Group_Detail>.from(response.data.map((x) => Group_Detail.fromJson(x)));
  } on DioError catch (e) {
   // Utils.hideLoadingDialog();
   _traceError(e);
   return [];
  } catch (e) {
   // Utils.hideLoadingDialog();
   _traceCatch(e);
   return [];
  }
 }
 Future<List<Pos_Info>> getPosData() async {
  try {

   if(CONO.toString().length==0) CONO =mySharedPreferences.CoNo;
   var queryParameters= {
    "CONO": CONO,

   };
   Response response= await dio.get('GetPosNo',queryParameters: queryParameters);
   _networkLog(response);

   return List<Pos_Info>.from(response.data.map((x) => Pos_Info.fromJson(x)));
  } on DioError catch (e) {
   Utils.hideLoadingDialog();
   _traceError(e);
   // Fluttertoast.showToast(msg: '${e.response?.data ?? 'Please try again'}', timeInSecForIosWeb: 3);
   return [];
  } catch (e) {
   Utils.hideLoadingDialog();
   _traceCatch(e);
   // Fluttertoast.showToast(msg: 'Please try again'.tr, timeInSecForIosWeb: 3);
   return [];
  }
 }
 Future<List<SectionInfo>> getSectionData() async {
  try {
   if(CONO.toString().length==0)CONO=mySharedPreferences.CoNo;
   var queryParameters= {
    "CONO": CONO,

   };
   Response response= await dio.get('POSGetSection',queryParameters: queryParameters);
   _networkLog(response);

   return List<SectionInfo>.from(response.data.map((x) => SectionInfo.fromJson(x)));
  } on DioError catch (e) {
   Utils.hideLoadingDialog();
   _traceError(e);
   // Fluttertoast.showToast(msg: '${e.response?.data ?? 'Please try again'}', timeInSecForIosWeb: 3);
   return [];
  } catch (e) {
   Utils.hideLoadingDialog();
   _traceCatch(e);
   // Fluttertoast.showToast(msg: 'Please try again'.tr, timeInSecForIosWeb: 3);
   return [];
  }
 }
 Future<List<PosCashModel>> getCashInfo(var fromDate,var toDate,var posNo,var SCNO) async {
  try {
   print("getCashInfo******3fromDate=="+fromDate+" \t"+toDate+" \t"+posNo);

   // Utils.showLoadingDialog();
   var queryParameters= {
    "CONO": CONO,
    "D1": fromDate,
    "D2": toDate,
    "POSNO": posNo,
    "SCNO":SCNO

   };

   Response response= await dio.get('GetPOSCASH',queryParameters: queryParameters);
   _networkLog(response);

   return List<PosCashModel>.from(response.data.map((x) => PosCashModel.fromJson(x)));
  } on DioError catch (e) {
   _traceError(e);
   return [];
  } catch (e) {
   _traceCatch(e);
   return [];
  }
 }

 Future<List<CashDetailModel>> getCashDetailsInfo(var fromDate,var toDate,var posNo,var SCNO) async {
  try {
   print("getCashInfo******3fromDate=="+fromDate+" \t"+toDate+" \t"+posNo);

   // Utils.showLoadingDialog();
   var queryParameters= {
    "CONO": CONO,
    "D1": fromDate,
    "D2": toDate,
    "POSNO": posNo,
    "SCNO":SCNO

   };

   Response response= await dio.get('GetPOSCASHDTLS',queryParameters: queryParameters);
   _networkLog(response);
   return List<CashDetailModel>.from(response.data.map((x) => CashDetailModel.fromJson(x)));
  } on DioError catch (e) {
   _traceError(e);
   // Fluttertoast.showToast(msg: '${e.response?.data ?? 'Please try again'}', timeInSecForIosWeb: 3);
   return [];
  } catch (e) {
   _traceCatch(e);
   // Fluttertoast.showToast(msg: 'Please try again'.tr, timeInSecForIosWeb: 3);
   return [];
  }
 }

 Future<String> getTotalDisc(var fromDate,var toDate,var posNo,var SCNO) async {
  var totalDisc="0";
  try {

   print("getCashInfo******3fromDate=="+fromDate+" \t"+toDate+" \t"+posNo);
   var queryParameters= {
    "CONO": CONO,
    "D1": fromDate,
    "D2": toDate,
    "POSNO": posNo,
    "SCNO":SCNO

   };

   Response response= await dio.get('GetPOSDISCOUNT',queryParameters: queryParameters);
   _networkLog(response);
   print(response.data[0]['DISC']);
   totalDisc=response.data[0]['DISC'];

   return totalDisc;
  } on DioError catch (e) {
   _traceError(e);
   return totalDisc;
  } catch (e) {
   _traceCatch(e);
   return totalDisc;
  }

 }

 Future<List<DiscDetailsModel>> getDiscDetails(var fromDate,var toDate,var posNo,var SCNO) async {
  try {
   print("getCashInfo******3fromDate=="+fromDate+" \t"+toDate+" \t"+posNo);
   var queryParameters= {
    "CONO": CONO,
    "D1": fromDate,
    "D2": toDate,
    "POSNO": posNo,
    "SCNO":SCNO

   };

   Response response= await dio.get('GetPOSDISCOUNT_DTLS',queryParameters: queryParameters);
   _networkLog(response);
   return List<DiscDetailsModel>.from(response.data.map((x) => DiscDetailsModel.fromJson(x)));
  } on DioError catch (e) {
   _traceError(e);
   return[];
  } catch (e) {
   _traceCatch(e);
   return[];

  }

 }
 //*****************************************************************//
 Future<String> getNetOpenTable_api(var fromDate,var toDate,var posNo,var SCNO) async {
  var data="0";
  try {

   print("getCashInfo******3fromDate=="+fromDate+" \t"+toDate+" \t"+posNo);
   var queryParameters= {
    "CONO": CONO,
    "D1": fromDate,
    "D2": toDate,
    "POSNO": posNo,
    "SCNO":SCNO,
    "TAXCALCKIND":VHFTYPE_TAX,
   "TBLORTK":"2"

   };
   Response response= await dio.get('GetOpenTable',queryParameters: queryParameters);
   _networkLog(response);
   print(response.data[0]['NETCASH']);
   data=response.data[0]['NETCASH'];
   return data;
  } on DioError catch (e) {
   _traceError(e);
   return data;
  } catch (e) {
   _traceCatch(e);
   return data;
  }

 }
 Future<String> getTransOpen_api(var fromDate,var toDate,var posNo,var SCNO,var isClose) async {
  var data="0";
  try {

   print("getCashInfo******3fromDate=="+fromDate+" \t"+toDate+" \t"+posNo);
   var queryParameters= {
    "CONO": CONO,
    "D1": fromDate,
    "D2": toDate,
    "POSNO": posNo,
    "SCNO":SCNO,
    "TAXCALCKIND":VHFTYPE_TAX,
    "TBLORTK":"2",
    "ISCLOSE":isClose

   };
   Response response= await dio.get('GetPOSNoOfTransAction',queryParameters: queryParameters);
   _networkLog(response);
   print(response.data[0]['TRANSCNT']);
   data=response.data[0]['TRANSCNT'];
   return data;
  } on DioError catch (e) {
   _traceError(e);
   return data;
  } catch (e) {
   _traceCatch(e);
   return data;
  }

 }
 Future<String> getNumberOfCustomer_api(var fromDate,var toDate,var posNo,var SCNO, var isClose,var cDate) async {
  var data="0";
  try {

   print("getCashInfo******3fromDate=="+fromDate+" \t"+toDate+" \t"+posNo);
   var queryParameters= {
    "CONO": CONO,
    "D1": fromDate,
    "D2": toDate,
    "POSNO": posNo,
    "SCNO":SCNO,
    "ISCLOSE":isClose,
    "CDATE": cDate

   };
   Response response= await dio.get('GetPOSNoOfCustomer',queryParameters: queryParameters);
   _networkLog(response);
   if(isClose.toString().contains("0")&&cDate.toString().contains("0"))
    {
     data = "0";
    }else {
    data = response.data[0]['NOOFSEATS'];
   }
   print(data);
   return data;
  } on DioError catch (e) {
   _traceError(e);
   return data;
  } catch (e) {
   _traceCatch(e);
   return data;
  }

 }

 Future<List<dynamic>> getPOSData()  async {
  try{
   //  link = "http://" + IpAddress.trim() + "GetPosNo?CONO=" + CoNo.trim();
   Response response= await dio.get('GetPosNo', queryParameters: {
    "CONO": "734",


   }
   );
   print("response_getPOSData"+response.toString());
   return response.data;

  }catch(e){
   print(e.toString());

   return [];
  }



 }
 static void _networkLog(Response response) {
  String trace = '════════════════════════════════════════ \n'
      '╔╣ Dio [RESPONSE] info ==> \n'
      '╟ BASE_URL: ${response.requestOptions.baseUrl}\n'
      '╟ PATH: ${response.requestOptions.path}\n'
      '╟ Method: ${response.requestOptions.method}\n'
      '╟ Params: ${response.requestOptions.queryParameters}\n'
      '╟ Body: ${response.requestOptions.data}\n'
      '╟ Header: ${response.requestOptions.headers}\n'
      '╟ statusCode: ${response.statusCode}\n'
      '╟ RESPONSE: ${jsonEncode(response.data)} \n'
      '╚ [END] ════════════════════════════════════════╝';
  developer.log(trace);
 }
 static void _traceError(DioError e) {
  String trace = '════════════════════════════════════════ \n'
      '╔╣ Dio [ERROR] info ==> \n'
      '╟ BASE_URL: ${e.requestOptions.baseUrl}\n'
      '╟ PATH: ${e.requestOptions.path}\n'
      '╟ Method: ${e.requestOptions.method}\n'
      '╟ Params: ${e.requestOptions.queryParameters}\n'
      '╟ Body: ${e.requestOptions.data}\n'
      '╟ Header: ${e.requestOptions.headers}\n'
      '╟ statusCode: ${e.response == null ? '' : e.response!.statusCode}\n'
      '╟ RESPONSE: ${e.response == null ? '' : e.response!.data} \n'
      '╟ stackTrace: ${e.stackTrace} \n'
      '╚ [END] ════════════════════════════════════════╝';
  developer.log(trace);
 }

 static void _traceCatch(e) {
  String trace = '════════════════════════════════════════ \n'
      '╔╣ Dio [Catch] info ==> \n'
      '╟ Runtime Type: ${e.runtimeType}\n'
      '╟ Catch: ${e.toString()}\n'
      '╚ [END] ════════════════════════════════════════╝';
  developer.log(trace);
 }
}
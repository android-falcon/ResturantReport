import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:report_resturant_flutter/constants/colors.dart';
import 'package:report_resturant_flutter/controller/CashController.dart';
import '../../controller/MainController.dart';
import '../widgets/customDatePicker.dart';
import '../widgets/custom__drop_down.dart';
import '../widgets/custom_button.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CashReport extends StatefulWidget {
  const CashReport({Key? key}) : super(key: key);

  @override
  State<CashReport> createState() => _CashReportState();
}


class _CashReportState extends State<CashReport> {
  DateTime selectedDateFrom = DateTime.now();
  DateTime selectedDateTo = DateTime.now();
   late MainController _mainController;

   late CashController _cashController;
  var fromStoreSelected,fromDateValue,toDateValue;
  var posNoValue="0";
  var flrSelected;
  var selectGroup;
  List data = [];
  @override
  void initState() {
    // TODO: implement initState
    _mainController= Get.put(MainController());
    _cashController=Get.put(CashController());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              children: [
                // Row(children: [
                //
                // ],),
                buildLoadedListGroup()
              ]

          ),
        ),
      ),
    );
  }
  Widget buildLoadedListGroup() {

    return SingleChildScrollView(


      child:
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          margin:  EdgeInsets.symmetric(horizontal: 0.0 , vertical: 5.0 ),
          width: MediaQuery.of(context).size.width,
          height: 1200,
          child:  Column(
            textDirection: ui.TextDirection.rtl,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  textDirection:  ui.TextDirection.rtl,
                  mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                  children: [
                    rowDate("     : من   " ,1),
                    rowDate( " : الى  ",2),
                    IconButton(
                        onPressed: () => Get.back(), // Refer step 3
                        icon:Icon(Icons.arrow_back_ios_new_rounded , color: myColors.dark_blue_, )
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  textDirection:  ui.TextDirection.rtl,
                  mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                  children: [
                    getDropDownFlour(),

                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  textDirection:  ui.TextDirection.rtl,
                  mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                  children: [
                    getDropDown(),
                    showBtn()
                  ],
                ),
              ),

              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    textDirection:  ui.TextDirection.rtl,
                    children: [

                      showTotalSales("المبيعات",0,""),
                      SizedBox(height: 5,),
                      showTotalSales("المرتجعات",1,""),
                      SizedBox(height: 5,),
                      showTotalSales("الصافي",2,""),
                      SizedBox(height: 5,),


                    ],
                  ),
                ),
              ),

          // Expanded(
          //   flex: 6,
          //   child:
              Text("تفاصيل الكاش",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: myColors.dark_blue_),),
            Container(
              margin: EdgeInsets.only(left: 10,right: 10),
              height: MediaQuery.of(context).size.height/4,
              decoration: BoxDecoration (

                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: myColors.dark_blue_,width: 1,style: BorderStyle.solid),

              ),
              child: Column(
                children: [
                  showTotalSales("الاسم",10,"",title: "الكمية"),
                  SingleChildScrollView(
                    child: Column(
                      children: [


                        getListCashDetails(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          // ),
              showTotalSales("اجمالي الخصم",5,""),
              // Expanded(
              //   flex: 6,
              //   child:
              Text("تفاصيل الخصم",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: myColors.dark_blue_),),
                Container(
                  margin: EdgeInsets.only(left: 10,right: 10),
                  height:  MediaQuery.of(context).size.height/3,
                  decoration: BoxDecoration (

                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: myColors.dark_blue_,width: 1,style: BorderStyle.solid),

                  ),
                  child:Column(
                    children: [

                      showTotalSales("رقم الخصم",10,"الوصف",title: "القيمة"),
                      SingleChildScrollView(
                        child: Column(
                        children: [


                          getListDiscountDetails(),
                        ],
                      ),
                ),
                    ],
                  )
                ),
              // ),
              showTotalSales("صافي الطاولات المفتوحة",6,""),
              showTotalSales("الطاولات المفتوحة",7,""),
              showTotalSales("الطاولات المغلقة",8,""),
              showTotalSales("الاشخاص الذين يتم خدمتهم",11,""),
              showTotalSales("الاشخاص الذين انتهت خدمتهم",9,""),
            ],

          ),

        ),
      ),
    );
  }
  showTotalSales(String header,int valueText,String description,{String title=""}) {

    return

      Container(
        height: 50,
        width: Get.width,
        padding:EdgeInsets.all(2.0),
        margin: EdgeInsets.only(right: 2),

        child: Row(
          textDirection:  ui.TextDirection.rtl,
          children: [
            Expanded(
              flex: valueText!=10?3:1,
              child: Container(

                decoration: BoxDecoration (
                  color:  myColors.light_blue_,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: myColors.light_blue_,width: 1,style: BorderStyle.solid),

                ),
                child: Center(
                  child: Text(
                    header,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: myColors.dark_blue_),
                  ),
                ),
              ),
            ),
            SizedBox(width: 5,),
            Expanded(
              flex: valueText!=10?3:1,
              child: Container(

                decoration: BoxDecoration (
                  color: valueText!=10?Colors.white: myColors.light_blue_,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: myColors.primarycolor_,width: 1,style: BorderStyle.solid),

                ),

                child: Center(
                  child:valueText!=10?
                  Obx(()=>(
                      Text(
                      getValueTotalCash(valueText),

                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ))
                ):   Text(
                      title,

                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                )
                )
              ),
            ),

            Expanded(
                flex: valueText!=10?3:0,
                child: SizedBox(width: 5,)),


            Visibility(
              visible: description.isNotEmpty,
              child: Expanded(
                flex: valueText!=10?0:1,
                child: Container(
                  decoration: BoxDecoration (
                    color:  myColors.light_blue_,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: myColors.light_blue_,width: 1,style: BorderStyle.solid),

                  ),
                  child: Center(
                    child: Text(
                        description,
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: myColors.dark_blue_),
                    ),
                  ),
                ),
              ),
            ),


          ],
        ),
      );


  }
  rowDate(String title,int type) {
    return
      CustomDatePicker(
        textDirection:  ui.TextDirection.rtl,
        label: title,
        labelStyle:  TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        padding:EdgeInsets.all(2.0),
        margin: EdgeInsets.all(2),
        borderRadius: 10,
        borderColor:myColors.primarycolor_ ,
        color: myColors.primarycolor_ ,
        selectedDate: type==1?"${selectedDateFrom.toLocal()}".split(' ')[0]:"${selectedDateTo.toLocal()}".split(' ')[0],
        onPressed:  () {
          type==1?
          _selectDateFrom(context)
              : _selectDateTo(context);
        },
      );

  }
  _selectDateFrom(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDateFrom, // Refer step 1
      firstDate: DateTime(2019),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDateFrom) {
      selectedDateFrom = picked;
      fromDateValue = DateFormat('dd/MM/yyyy').format(selectedDateFrom);

      setState(() {
        selectedDateFrom = picked;
        print("fromDateValue=" + fromDateValue);
      });
    }
  }
  _selectDateTo(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDateTo, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDateTo) {
      selectedDateTo = picked;
      toDateValue = DateFormat('dd/MM/yyyy').format(selectedDateTo);
      setState(() {
        selectedDateTo = picked;
      });
    }
  }
  showBtn() {
    return     CustomButton(
      width: 60.w,
      fixed: true,
      margin: EdgeInsets.all(5),
      child: Text('اظهار'.tr),
      backgroundColor: myColors.primarycolor_,
      onPressed: () async {
        var localscnoValue;

        // Utils.showLoadingDialog();
        if(fromDateValue==null)
          fromDateValue = DateFormat('dd/MM/yyyy').format(selectedDateFrom);
        if(toDateValue==null)
          toDateValue = DateFormat('dd/MM/yyyy').format(selectedDateTo);
        FocusScope.of(context).requestFocus(FocusNode());
        if(flrSelected==null)localscnoValue="-1";
        switch (flrSelected){
          case "1":localscnoValue="1";break;
          case "2":localscnoValue="2";break;
          case "3":localscnoValue="3";break;
          case "0":localscnoValue="-1";break;
          default: localscnoValue="-1";break;
        }

        await _cashController.getPosCash(fromDateValue ,toDateValue,posNoValue,scno:localscnoValue);
        // Utils.hideLoadingDialog();
        setState(() {});
      },
    );
  }
  getDropDownFlour() {
    // _mainController.
    return CustomDropDown(

      textDirection:  ui.TextDirection.rtl,
      height:Get.height/8,
      width: Get.size.width/3,
      margin: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
      label: 'اسم الفرع'.tr,


      textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15),
      color: Colors.white60,
      // borderColor: ColorsApp.primaryColor,
      isExpanded: true,
      onChanged: (value) {
        setState(() {
          flrSelected=value.toString() ;

        });
      },
      items: _mainController.listSection

          .map(
            (entry) => DropdownMenuItem(
          value: entry.sectioNO,
          child: Text(
            '${entry.sectioNO}'+'\t ${entry.secName}',
            style: const TextStyle(fontSize: 13),
          ),
        ),
      )
          .toList(),
      selectItem: flrSelected,
    );
  }
  getDropDown() {
    return CustomDropDown(

      textDirection:  ui.TextDirection.rtl,
      height:Get.height/8,
      width: Get.size.width/3,
      margin: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
      label: 'مركز البيع'.tr,


      textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15),
      color: Colors.white60,
      // borderColor: ColorsApp.primaryColor,
      isExpanded: true,
      onChanged: (value) {
        setState(() {
          posNoValue=value.toString() ;

        });
      },
      items: _mainController.listPos

          .map(
            (entry) => DropdownMenuItem(
          value: entry.posno,
          child: Text(
            '${entry.posno}'+'\t ${entry.posName}',
            style: const TextStyle(fontSize: 13),
          ),
        ),
      )
          .toList(),
      selectItem: posNoValue,
    );
  }

  getValueTotalCash(int valueText) {

      String result="";
      if(_cashController.listPosCash.length!=0)
      switch (valueText){
        case 0:result=_cashController.listPosCash[0].sales??"";break;
        case 1:result=_cashController.listPosCash[0].returned??"";break;

        case 2:result=_cashController.listPosCash[0].net??"";break;
        case 5:result=_cashController.totalDisc.string;break;

        case 6:result=_cashController.netOpenTable.string;break;
        case 7:result=_cashController.transOpen.string;break;

        case 8:result=_cashController.transClose.string;break;

        case 9:result=_cashController.customerOpen.string;break;

        case 11:result=_cashController.customerClose.string;break;
      }
      return   result ;
    }


  Widget getListCashDetails() {

    return
      Container(
          width:1100,
          height: MediaQuery.of(context).size.height /6,
          margin: EdgeInsets.symmetric(horizontal: 1.0 , vertical: 1.0 ),


          child:

          Obx(()=>(
              ListView.builder(itemCount: _cashController.listPosCashDetails.length,itemBuilder: (BuildContext context,int position,){
                return
                  Padding(
                    padding: const EdgeInsets.all(1.0),

                    child:  itemCashDetail(position),
                  );

              })

          ))



      )

    ;
  }
  Widget getListDiscountDetails() {

    return
      Container(
          width:1100,
          height: MediaQuery.of(context).size.height /4,
          margin: EdgeInsets.symmetric(horizontal: 2.0 , vertical: 1.0 ),
          child:
          Obx(()=>(
              ListView.builder(itemCount: _cashController.listDiscountDetails.length,itemBuilder: (BuildContext context,int position,){
                return
                  Padding(
                    padding: const EdgeInsets.all(1.0),

                    child:  itemDiscountDetail(position),
                  );

              })

          ))
      )

    ;
  }
  itemCashDetail(int position) {

    return Container(
      height: 50,
      width: Get.width-20,
      padding:EdgeInsets.all(2.0),
      margin: EdgeInsets.only(right: 5),


      child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          textDirection:  ui.TextDirection.rtl,
          children: [
            Expanded(
              flex: 1,


              child: Center(
                child: Text(
                  _cashController.listPosCashDetails[position].name.toString(),

                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: myColors.dark_blue_),
                ),
              ),
            ),

            Expanded(
              flex: 1,



                child: Center(
                    child:    Text(
                      _cashController.listPosCashDetails[position].amoumt.toString(),

                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    )
                )
            ),



          ],
        ),




    );
  }
  itemDiscountDetail(int position) {

    return Container(
      height: 50,
      width: Get.width-20,
      padding:EdgeInsets.all(2.0),
      margin: EdgeInsets.only(right: 5),


      child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        textDirection:  ui.TextDirection.rtl,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                _cashController.listDiscountDetails[position].discno.toString(),

                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: myColors.dark_blue_),
              ),
            ),
          ),

          Expanded(
              flex: 1,
              child: Center(
                  child:    Text(
                    _cashController.listDiscountDetails[position].disc.toString(),

                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  )
              )
          ),
          Expanded(
              flex: 1,
              child: Center(
                  child:    Text(
                    _cashController.listDiscountDetails[position].discdescreption.toString(),

                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  )
              )
          ),



        ],
      ),




    );
  }



}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:report_resturant_flutter/constants/colors.dart';
import 'package:report_resturant_flutter/controller/GroupController.dart';
import 'package:report_resturant_flutter/presentation/screens/HomeScreen.dart';
import 'package:report_resturant_flutter/presentation/widgets/ItemSoldQtyRow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Utils/utils.dart';
import '../../controller/MainController.dart';
import '../../controller/soldQtyController.dart';
import '../../data/models/SoldQtyModel.dart';
import '../../data/models/group_detail.dart';
import '../widgets/Item_Group_Report.dart';
import '../widgets/customDatePicker.dart';
import '../widgets/custom__drop_down.dart';
import '../widgets/custom_button.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;
class SoldQtyReport extends StatefulWidget {
  const SoldQtyReport({Key? key}) : super(key: key);

  @override
  State<SoldQtyReport> createState() => _SoldQtyReportState();
}

class _SoldQtyReportState extends State<SoldQtyReport> {
  final SoldQtyController groupController= Get.put(SoldQtyController());
  DateTime selectedDateFrom = DateTime.now();
  DateTime selectedDateTo = DateTime.now();
  final MainController _mainController= Get.put(MainController());

  var fromStoreSelected,fromDateValue,toDateValue;
  var posNoValue="0";
  var selectGroup;
  List data = [];
  @override
  Widget build(BuildContext context) {
         return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              children: [
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
        padding: const EdgeInsets.all(2.0),
        child: Container(
          margin:  EdgeInsets.symmetric(horizontal: 0.0 , vertical: 5.0 ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height-10,
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
                    getDropDown(),
                    showBtn()
                  ],
                ),
              ),

              Expanded(
                flex: 6,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin:  EdgeInsets.symmetric(horizontal: 5.0 , vertical: 5.0 ),
                    width:1500,
                    decoration: BoxDecoration (
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey,width: 1,style: BorderStyle.solid),


                    ),

                    child: Column(

                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                            children: [

                              getTitleTable(),



                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 0,right: 10,bottom: 0,left: 10),
                            child: Divider(),
                          ),
                        ),
                        Expanded(
                            flex: 12,
                            child:
                            buildGroupList(groupController.listSoldQty))
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    textDirection:  ui.TextDirection.rtl,
                    children: [

                          showTotal("اجمالي الربح",0),
                          SizedBox(height: 5,),
                          showTotal("اجمالي الخصم",1),
                      SizedBox(height: 5,),
                          showTotal("اجمالي الضريبة",2),
                      SizedBox(height: 5,),
                          showTotal("الصافي",3),

                    ],
                  ),
                ),
              ),

            ],

          ),

        ),
      ),
    );
  }
  showTotal(String header,int valueText) {

    return

      Container(
        height: 30,
        width: 150,
        padding:EdgeInsets.all(4.0),
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration (
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: myColors.primarycolor_,width: 1,style: BorderStyle.solid),

        ),
        child: Row(
          textDirection:  ui.TextDirection.rtl,
          children: [
            Text(
              header,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: myColors.dark_blue_),
            ),
            SizedBox(width: 10,),
        Obx(()=>(
             Text(
               getValueTotal(valueText),

                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
             )
            )),
          ],
        ),
      );


  }
  Widget getTitleTable() {
    return    Expanded(
      child:Container(
          margin: EdgeInsets.symmetric(horizontal: 2.0 , vertical: 2.0 ),
          height:MediaQuery.of(context).size.height /13,
          width: 1100,
          child:   Center(
            child: Table(

              textDirection:  ui.TextDirection.rtl,
              children:  [
                TableRow(children: [

                  getTextWidget('النوع'),
                  getTextWidget('الفئة'),
                  getTextWidget('المجموعة'),
                  getTextWidget('رقم المادة'),
                  getTextWidget('الاسم'),
                  getTextWidget(''),
                  getTextWidget('الكمية'),
                  getTextWidget('الملاحظة'),
                  getTextWidget(                'الخدمة'            ),

                  getTextWidget(                'الضريبة'            ),
                  getTextWidget(                ' ضريبةS'            ),

                  getTextWidget(                'الخصم'            ),

                  getTextWidget(                'السعر'            ),

                  getTextWidget(                'الربح'            ),
                  getTextWidget(                'نسبة الربح'            ),
                  getTextWidget(                'الصافي'            ),

                ])],

            ),
          )
      ),
    );
  }
  Widget getTextWidget(String textValue) {
    return   Center(
      child: Container(



        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(2.0),
                child: Center(
                  child:
                  Text( textValue ,style: TextStyle(fontSize:15 ,color: myColors.dark_blue_,fontWeight:   FontWeight.bold),
                    overflow: TextOverflow.ellipsis,

                  ),
                )

            ),


          ],
        ),

      ),
    );
  }
  showBtn() {
    return     CustomButton(
      width: 60.w,
      fixed: true,
      margin: EdgeInsets.all(5),
      child: Text('اظهار'.tr),
      backgroundColor: myColors.primarycolor_,
      onPressed: () async {
        if(fromDateValue==null)
          fromDateValue = DateFormat('dd/MM/yyyy').format(selectedDateFrom);
        if(toDateValue==null)
          toDateValue = DateFormat('dd/MM/yyyy').format(selectedDateTo);
        FocusScope.of(context).requestFocus(FocusNode());
        Utils.showLoadingDialog();
        await groupController.getSoldQtyDetails(fromDateValue ,toDateValue,posNoValue);
        Utils.hideLoadingDialog();
        setState(() {});
      },
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
  Widget buildGroupList(List<SoledQtyModel> allItemList) {

    return
      Container(
          width:1500,
          height: MediaQuery.of(context).size.height /1.2,
          margin: EdgeInsets.symmetric(horizontal: 2.0 , vertical: 1.0 ),

          child:

          Obx(()=>(
              ListView.builder(itemCount: groupController.listSoldQty.length,itemBuilder: (BuildContext context,int position,){
                return
                  Padding(
                    padding: const EdgeInsets.all(1.0),

                    child:  Item_SoldReport(group_detail: allItemList[position],),
                  );

              })

          ))



      )

    ;
  }
  rowDate(String title,int type) {
    return
      CustomDatePicker(
        textDirection:  ui.TextDirection.rtl,
        label: title,
        labelStyle:  TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        padding:EdgeInsets.all(4.0),
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

  String getValueTotal(int valueText) {
    String result="";
    switch (valueText){
      case 0:result=groupController.totalGross.toStringAsFixed(3);break;
      case 1:result=groupController.totalDiscount.toStringAsFixed(3);break;

      case 2:result=groupController.totalTax.toStringAsFixed(3);break;

      case 3:result=groupController.totalNet.toStringAsFixed(3);break;


    }
    return   result ;
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:report_resturant_flutter/constants/colors.dart';
import 'package:report_resturant_flutter/controller/GroupController.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Utils/utils.dart';
import '../../controller/MainController.dart';
import '../../data/models/group_detail.dart';
import '../widgets/Item_Group_Report.dart';
import '../widgets/customDatePicker.dart';
import '../widgets/custom__drop_down.dart';
import '../widgets/custom_button.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;
class GroupReport extends StatefulWidget {
  const GroupReport({Key? key}) : super(key: key);

  @override
  State<GroupReport> createState() => _GroupReportState();
}

class _GroupReportState extends State<GroupReport> {
  late MainController _mainController;
  late GroupController groupController;
  late List<Group_Detail> allGroupDetails;
  DateTime selectedDateFrom = DateTime.now();
  DateTime selectedDateTo = DateTime.now();

  var fromStoreSelected,fromDateValue,toDateValue;
  var posNoValue="0";
  var selectGroup;
  List data = [];
  @override
  void initState() {
    // TODO: implement initState
    _mainController= Get.put(MainController());
    groupController= Get.put(GroupController());
    if(_mainController.listPos.length==0)
      _mainController.fetchPosData();
    setState(() {

    });
    super.initState();
  }
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
                    rowFromDate(),
                    rowToDate(),
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
                flex: 1,
                child: Row(

                  textDirection:  ui.TextDirection.rtl,
                  mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                  children: [
                    getDropDownGroup(),

                  ],
                ),
              ),

              Expanded(
                flex: 6,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin:  EdgeInsets.symmetric(horizontal: 5.0 , vertical: 5.0 ),
                    width:1500 ,
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
                            buildGroupList(groupController.listGroup))
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: SingleChildScrollView(

                  child: Column(

                    children: [
                      Row(
                        textDirection:  ui.TextDirection.rtl,
                        children: [


                          showTotal("اجمالي الربح",getTotalValueForItem(0)),
                          showTotal("الخدمات",getTotalValueForItem(1))
                        ],),
                      SizedBox(height: 10,),
                      Row(
                        textDirection: ui. TextDirection.rtl,
                        children: [

                          showTotal("اجمالي الخصم",getTotalValueForItem(2)),
                          showTotal("ضريبة الخدمات",getTotalValueForItem(3))
                        ],),
                      SizedBox(height: 10,),
                      Row(
                        textDirection:  ui.TextDirection.rtl,
                        children: [
                          showTotal("اجمالي الضريبة",getTotalValueForItem(4)),

                        ],),
                      SizedBox(height: 20,),
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
  Widget buildGroupList(List<Group_Detail> allItemList) {

    return
      Container(
        width:1500,
        height: MediaQuery.of(context).size.height /1.2,
        margin: EdgeInsets.symmetric(horizontal: 2.0 , vertical: 1.0 ),

        child:

        Obx(()=>(
            ListView.builder(itemCount: groupController.listGroup.length,itemBuilder: (BuildContext context,int position,){
              return
                Padding(
                  padding: const EdgeInsets.all(1.0),

                  child:  Item_GroupReport(group_detail: allItemList[position],),
                );

            })

        ))



      )

    ;
  }
  String getTotalValueForItem(int flag){
    String result="";double totalVlue=0;
    switch (flag){

      case 0:
        totalVlue=groupController.listGroup.fold(0, (prev, element) => prev.toDouble() + double.parse(element.gROSS.toString()));

        break;
      case 1:
        totalVlue=groupController.listGroup.fold(0, (prev, element) => prev.toDouble() + double.parse(element.sERVICE.toString()));

        break;
      case 2:
        totalVlue=groupController.listGroup.fold(0, (prev, element) => prev.toDouble() + double.parse(element.dISC.toString()));

        break;
      case 3:
        totalVlue=groupController.listGroup.fold(0, (prev, element) => prev.toDouble() + double.parse(element.sERVICETAX.toString()));

        break;
      case 4:
        totalVlue=groupController.listGroup.fold(0, (prev, element) => prev.toDouble() + double.parse(element.tAX.toString()));

        break;

    }
    result=totalVlue.toStringAsFixed(3);
    print("totGross"+result.toString());
    return result;


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
                  getTextWidget('الكمية'),
                  getTextWidget(                'الربح'            ),
                  getTextWidget(                'نسبة الربح'            ),
                  getTextWidget(                'الخصم'            ),
                  getTextWidget(                'الاجمالي'            ),
                  getTextWidget(                'الضريبة'            ),
                  getTextWidget(                'الصافي'            ),
                  getTextWidget(                'مركز البيع'            ),

                ])],

            ),
          )
      ),
    );
  }
  showTotal(String header,String valueText) {

    return

      Container(
        height: 35.h,
        width: 150.w,
        padding:EdgeInsets.all(4.0),
        margin: EdgeInsets.only(right: 10,left: 10),
        decoration: BoxDecoration (
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: myColors.primarycolor_,width: 1,style: BorderStyle.solid),

        ),
        child: Row(
          textDirection:  ui.TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              header,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: myColors.dark_blue_),
            ),
            SizedBox(width: 10,),
            Text(
              valueText,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );


  }
  Widget getTextWidget(String textValue) {
    return   Center(
      child: Container(
        width:100,


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
  rowFromDate() {
    return
      CustomDatePicker(
        textDirection:  ui.TextDirection.rtl,
        label:"     : من   " ,
        labelStyle:  TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        padding:EdgeInsets.all(4.0),
        margin: EdgeInsets.all(2),
        borderRadius: 10,
        borderColor:myColors.primarycolor_ ,
        color: myColors.primarycolor_ ,
        selectedDate: "${selectedDateFrom.toLocal()}".split(' ')[0],
        onPressed:  () {_selectDateFrom(context);},
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
  rowToDate() {
    return Row(
      textDirection:  ui.TextDirection.rtl,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          " : الى  ",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Container(
          padding:EdgeInsets.all(2.0),
          margin: EdgeInsets.all(10),

          decoration: BoxDecoration (
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: myColors.primarycolor_,width: 1,style: BorderStyle.solid),

          ),
          child: Row(
            children: [
              Text(
                "${selectedDateTo.toLocal()}".split(' ')[0],
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: () => _selectDateTo(context), // Refer step 3
                  icon:Icon(Icons.date_range , color: myColors.dark_blue_, )
              ),
            ],
          ),
        ),

      ],
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
         await groupController.fetchReportGroupData(fromDateValue ,toDateValue,posNoValue);
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
      margin: EdgeInsets.symmetric(vertical: 1,
          horizontal: 5),
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
  getDropDownGroup() {
    return CustomDropDown(

      textDirection:  ui.TextDirection.rtl,
      height:Get.height/9,
      width: Get.size.width/3,
      margin: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
      label: 'الفئات'.tr,
      textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15),
      color: Colors.white60,
      // borderColor: ColorsApp.primaryColor,
      isExpanded: true,
        items: groupController.listFilterGroup.map(
            (entry) =>
                DropdownMenuItem(
          value: entry,
          child: Text(
            '${entry}',
            // style: const TextStyle(fontSize: 13),
          ),
        ),
      )
          .toList(),
      onChanged: (newVal) {
        setState(() {
          selectGroup = newVal;
          filterGroup();
          print("_searchviewGroup"+newVal.toString());
        });
      },
      selectItem: selectGroup,
    );

  }


  void filterGroup() {
    groupController.filterByGroup(selectGroup);
    setState(() {

    });
  }
}




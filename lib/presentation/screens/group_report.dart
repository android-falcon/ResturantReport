import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:report_resturant_flutter/businiss_logic/group_cubit.dart';
import 'package:report_resturant_flutter/constants/colors.dart';
import 'package:report_resturant_flutter/data/models/group_detail.dart';

import '../widgets/Item_Group_Report.dart';
class GroupReportScreen extends StatefulWidget {
  const GroupReportScreen({Key? key}) : super(key: key);

  @override
  State<GroupReportScreen> createState() => _GroupReportScreenState();
}

class _GroupReportScreenState extends State<GroupReportScreen> {
  late List<Group_Detail> allGroupDetails;
  DateTime selectedDateFrom = DateTime.now();
  DateTime selectedDateTo = DateTime.now();
  var fromStoreSelected;
  var _searchviewGroup = new TextEditingController();
   List data = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allGroupDetails=BlocProvider.of<GroupCubit>(context).getAllGroupDetails();
    // data=BlocProvider.of<GroupCubit>(context).getAllPOS();
    print("initState_data="+data.length.toString());
    print("initState_allGroupDetails="+allGroupDetails.length.toString());


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // appBar: AppBar(),

    body: buildBlocWedget(),
    );
  }

 Widget buildBlocWedget() {

    return BlocBuilder<GroupCubit,GroupState>(builder: (context,state){
      if(state is GroupLoaded){

        allGroupDetails=(state).listDetails;
        return buildLoadedListGroup();

      }else{
       return showLoadingIndicator();

      }

    });

    
 }
  Widget buildBlocDropDown() {

    return BlocBuilder<GroupCubit,GroupState>(builder: (context,state){
      print("buildBlocDropDown"+state.toString());
      if(state is POSLoaded){

        data=(state).listPos;
       print("buildBlocDropDown"+data.length.toString());
        return getSnapshotDropDown();

      }else{
        return showLoadingIndicator();

      }

    });


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
            textDirection: TextDirection.rtl,
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                  children: [
                    rowFromDate(),
                    rowToDate()
                  ],
                ),
              ),
              getData(),
              // getSnapshotDropDown(),
              // buildBlocDropDown(),
              Expanded(
                flex: 6,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin:  EdgeInsets.symmetric(horizontal: 15.0 , vertical: 15.0 ),
                    width:1100 ,
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
                      child:buildGroupList(allGroupDetails))
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Row(
                      //   textDirection: TextDirection.rtl,
                      //   children: [
                      //
                      //
                      //   showTotal("اجمالي الربح",getTotalValueForItem(0)),
                      //     showTotal("الخدمات",getTotalValueForItem(1))
                      // ],),
                      // SizedBox(height: 10,),
                      // Row(
                      //   textDirection: TextDirection.rtl,
                      //   children: [
                      //
                      //     showTotal("اجمالي الخصم",getTotalValueForItem(2)),
                      //     showTotal("ضريبة الخدمات",getTotalValueForItem(3))
                      //   ],),
                      // SizedBox(height: 10,),
                      // Row(
                      //   textDirection: TextDirection.rtl,
                      //   children: [
                      //     showTotal("اجمالي الضريبة",getTotalValueForItem(4)),
                      //
                      //   ],),
                    ],
                  ),
                ),
              ),

              // rowFromDate(),
              // rowFromDate(),
            ],

          ),

        ),
      ),
    );
  }

  Widget showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: myColors.teal_700_,
      ),
    );
  }
  _selectDateFrom(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDateFrom, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDateFrom)
      setState(() {
        selectedDateFrom = picked;
      });
  }

  _selectDateTo(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDateTo, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDateTo)
      setState(() {
        selectedDateTo = picked;
      });
  }

  Widget buildGroupList(List<Group_Detail> allItemList) {
    return

        Container(
          width:1100,
        height: MediaQuery.of(context).size.height /1.2,
        margin: EdgeInsets.symmetric(horizontal: 2.0 , vertical: 1.0 ),

            child: ListView.builder(itemCount: allItemList.length,itemBuilder: (BuildContext context,int position,){
              return
                Padding(
                  padding: const EdgeInsets.all(1.0),

                  child:  Item_GroupReport(group_detail: allItemList[position],),
                );

            }),


    )

    ;
  }
  Widget getTitleTable() {
    return    Expanded(
      child:Container(
          margin: EdgeInsets.symmetric(horizontal: 2.0 , vertical: 2.0 ),
          height:MediaQuery.of(context).size.height /13,
          width: 1100,
          child:   Center(
            child: Table(

            textDirection: TextDirection.rtl,
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

  Widget getTextWidget(String textValue) {
    return   Container(
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

    );
  }
  String getTotalValueForItem(int flag){
    String result="";double totalVlue=0;
    switch (flag){

      case 0:
        totalVlue=allGroupDetails.fold(0, (prev, element) => prev.toDouble() + double.parse(element.gROSS.toString()));

        break;
      case 1:
        totalVlue=allGroupDetails.fold(0, (prev, element) => prev.toDouble() + double.parse(element.sERVICE.toString()));

        break;
      case 2:
        totalVlue=allGroupDetails.fold(0, (prev, element) => prev.toDouble() + double.parse(element.dISC.toString()));

        break;
      case 3:
        totalVlue=allGroupDetails.fold(0, (prev, element) => prev.toDouble() + double.parse(element.sERVICETAX.toString()));

        break;
      case 4:
        totalVlue=allGroupDetails.fold(0, (prev, element) => prev.toDouble() + double.parse(element.tAX.toString()));

        break;

    }
    result=totalVlue.toStringAsFixed(3);
    print("totGross"+result.toString());
    return result;


  }
  showTotal(String header,String valueText) {

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
              textDirection: TextDirection.rtl,
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
  rowFromDate() {
    return Expanded(
      child: Row(
        textDirection: TextDirection.rtl,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "     : من   ",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),

          Container(
            padding:EdgeInsets.all(2.0),
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration (
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: myColors.primarycolor_,width: 1,style: BorderStyle.solid),

            ),
            child: Row(
              children: [
                Text(
                  "${selectedDateFrom.toLocal()}".split(' ')[0],
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () => _selectDateFrom(context), // Refer step 3
                    icon:Icon(Icons.date_range , color: myColors.dark_blue_, )
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }

  rowToDate() {
    return Row(
      textDirection: TextDirection.rtl,
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
  Widget getSnapshotDropDown() {
    return  new Container(
        // child: Text('Drop'),
        child: new DropdownButton(
          iconSize: 34,
          elevation: 10,

          underline: Container(color: Colors.transparent),
          items: data.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['POSNO']),
              value: item['POSNO'].toString(),


            );
          }).toList(),
          onChanged: (newVal) {
            setState(() {
              fromStoreSelected = newVal;
              _searchviewGroup.text=fromStoreSelected;
              print("_searchviewGroup"+_searchviewGroup.text);
              // _performSearch(1);
              // searchGroup(fromStoreSelected);
            });
          },
          value: fromStoreSelected,
        ),

      // ),
    );
  }

  getData() {
    data=BlocProvider.of<GroupCubit>(context).getAllPOS();
    print("initState_data222="+data.length.toString());
  }
//   Future<String> getSWData() async {
//     var url = Uri.parse(ItemGroup.getItemGroup);
//     var res = await http.get(url);
//     var resBody = json.decode(res.body);
//     print("getSWData" + resBody.toString());
//
//     data = resBody;
// //    data.add(0,);
// //    data.insert(0, "All");
//
// //        {ItemG: KIDS}
//     setState(() {
//       data = resBody;
//     });
//
//     //print("allGroup"+allGroup.toString());
//
//     return "sucsess";
//   }
}

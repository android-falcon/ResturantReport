import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:report_resturant_flutter/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report_resturant_flutter/data/models/setting.dart';
import '../../Utils/my_shared_preferences.dart';
import '../../Utils/validation.dart';
import '../../constants/myStyle.dart';
import '../../controller/GroupController.dart';
import '../../controller/MainController.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/custom_text_field.dart';
import 'CashReport.dart';
import 'GroupReport.dart';
import 'SoldQtyReport.dart';
import 'group_report.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late MainController mainController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              children: [
                getImage(),
                getReports(),
                getRowSetting()

              ]

          ),
        ),
      ),
    );
  }

  Widget getImage() {
    return
      Center(
        child: Padding(

          padding: const EdgeInsets.all(10.0),
          child: Container(
          width: Get.width,
          height: Get.height/3,

            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/res.jpg'),
              ),
            ),
    ),
        ),
      );
  }

  getReports() {
    return
      Center(
        child: Padding(

          padding: const EdgeInsets.all(1.0),
          child: Opacity(
            opacity: 1,
            child: Container(
              width: Get.mediaQuery.size.width,
              height: Get.height/2,

              decoration: const BoxDecoration(//capture.jpg
                image: DecorationImage(
                  image: AssetImage('assets/images/capture.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  getRow('SoldQtyReport','assets/images/solid_qty.png',1),
                  getRow('GroupReport','assets/images/group_image.png',2),
                  getRow('CashReport','assets/images/blog.png',3),

                ],
              ),

            ),
          ),
        ),
      );

  }

  getRow(String title, String path,int flag) {
    return
    Opacity(
      opacity: 1,
      child:
      InkWell(

        onTap: () {
          switch (flag){
         case 1:  if(isNotEmptySetting()) Get.to(()=>SoldQtyReport(),curve: Curves.easeInOut,transition: Transition.leftToRight) ;   break;
          case 2: if(isNotEmptySetting()) Get.to(()=>GroupReport()) ;   break;
          case 3: if(isNotEmptySetting()) Get.to(()=>CashReport());    break;
          }
        },
        child: SizedBox(
          height: Get.height/7,
          child:
          Stack(
              children:[
                Align(
                    alignment: AlignmentDirectional.centerStart,
                    child:
                Padding(
                  padding: const EdgeInsets.only(top: 1,left:15,right: 10),
                  child: SizedBox(
                    height: Get.height/10,
                    child:
                    Card(

            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            // side: const BorderSide(width: 1,color: Colors.grey),
            ),
            elevation: 10,
              child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Center(
                          child: Text(title,style: TextStyle(
                              color: myColors.black,fontSize: 18
                          ),
                          ),
                        ),
                      ),




                    ],

              ),


            ),
                  ),
                )),

                Align(
                  alignment: AlignmentDirectional.centerStart,
                    child:
    SizedBox(

                  height: Get.height/8,
                  width: 110,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),


                    ),
                    // color: Colors.red,
                    // shadowColor: Colors.red,
                    child:
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: new Image.asset(path),
                      // AssetImage(path),
                    ) ,
                    // Container(
                    //   width: Get.width,
                    //   height: Get.height/8,
                    //
                    //   decoration:  BoxDecoration(//capture.jpg
                    //     image: DecorationImage(
                    //       image: AssetImage(path),
                    //     ),
                    //   ),
                    // )

                  ),
                )),
         ])
        ),
      ),
    );
  }

 Widget getRowSetting() {
    return Container(
        width: Get.mediaQuery.size.width,
        height: Get.height/10,
        child:
      Stack(
          children:[
            Align(
                alignment: AlignmentDirectional.bottomCenter,
                child:
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: SizedBox(
                    height: Get.height/16,
                    child:
                    Card(
                      color: myColors.dark_blue_,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                        // side: const BorderSide(width: 1,color: Colors.grey),
                      ),
                      elevation: 10,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        ],

                      ),


                    ),
                  ),
                )),

            Align(
                alignment: AlignmentDirectional.center,
                child:
                SizedBox(

                  height: Get.height/13,
                  width: 70,
                  child: Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),


                    ),

                    child:
                    InkWell(
                      onTap: () async {
                        print("clickMyButton");
                        var result = await  openSettingDialog();
                        if (result != null) {
                          // _cartModel = result;
                          // _cartModel = Utils.calculateOrder(cart: _cartModel, orderType: widget.type);
                          setState(() {});
                        }

                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: new Image.asset('assets/images/settings_ic.png'),
                        // AssetImage(path),
                      ),
                    ) ,

                  ),
                )),


          ])


    );

  }

  openSettingDialog() async {
    // CartModel? _parkCart;
    int? groupValue=mySharedPreferences.TaxType;
    TextEditingController? controllerIp= TextEditingController(text: mySharedPreferences.baseUrl);
    TextEditingController? _controllerCono= TextEditingController(text:mySharedPreferences.CoNo);
    await Get.dialog(
      CustomDialog(
        width: 400.w,
        height: 400.h,
        builder: (context, setState, constraints) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => Get.back(), // Refer step 3
                    icon:Icon(Icons.close , color: myColors.dark_blue_, )
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      '  الاعدادات     ',
                      style: kStyleTextTitle,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(thickness: 2),

            Container(
              decoration: BoxDecoration(
                color: myColors.dark_blue_,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                  border: Border.all(color: myColors.primarycolor_)),
              height:400.h,
              width: 400.w,
              child:
              Column(
                children: [
                  SizedBox(height: 20.h,),
                  CustomTextField(
                    controller: controllerIp,
                    fillColor: myColors.white,

                    borderColor: myColors.primarycolor_,
                    maxLines: 1,
                    label: Text('Ip Address'.tr),
                    hintText: '10.0.0.2:8085/Falcons/Van.dll/',

                    validator: (value) {
                      return Validation.isRequired(value);
                    },
                  ),
                  SizedBox(height: 20.h,),
                  CustomTextField(
                    controller: _controllerCono,
                    fillColor: myColors.white,

                    borderColor: myColors.primarycolor_,
                    maxLines: 1,
                    label: Text('CoNo'.tr),
                    hintText: '290',

                    validator: (value) {
                      return Validation.isRequired(value);
                    },
                  ),
                  SizedBox(height: 20.h,),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                      Text(' شامل  ',style: kStyleTextButton,),
                      Radio(



                          value: 0,
                          groupValue: groupValue,
                          onChanged: (value){

                        print("radio"+value.toString());
                        setState((){
                          groupValue=value as int?;
                        });

                      }),
                      Text(' خاضع ',style: kStyleTextButton,),
                      Radio(

                        activeColor: myColors.primarycolor_,

                          value: 1,
                          groupValue: groupValue,
                          onChanged: (value){

                            print("radio22=="+value.toString());
                            setState((){
                              groupValue=value as int?;
                            });

                          })
                    ],),
                  ),
                  SizedBox(height: 100.h,),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                        child: CustomButton(
                          backgroundColor: myColors.primarycolor_,
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(' حفظ ',style: kStyleTextButton,),
                          onPressed: () {
                            mySharedPreferences.baseUrl=controllerIp.text;
                            print("_controllerCono"+_controllerCono.text);
                            mySharedPreferences.CoNo=_controllerCono.text;
                            mySharedPreferences.TaxType=groupValue!;
                            loadData();
                            Get.back();
                          },
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),

                ],
              ),
              // StaggeredGrid.count(
              //   crossAxisCount: 3,
              //   children: [
              //     ...mySharedPreferences.park
              //         .map((e) => Card(
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(5.r),
              //         side: const BorderSide(width: 1),
              //       ),
              //       elevation: 0,
              //       child: InkWell(
              //         borderRadius: BorderRadius.circular(5.r),
              //         onTap: () async {
              //           _parkCart = e;
              //           var park = mySharedPreferences.park;
              //           park.remove(e);
              //           mySharedPreferences.park = park;
              //           Get.back();
              //         },
              //
              //         child: Padding(
              //           padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 2.w),
              //           child: Text(
              //             e.parkName,
              //             style: kStyleTextTitle,
              //           ),
              //         ),
              //       ),
              //     ))
              //         .toList()
              //   ],
              // ),
            ),

          ],
        ),
      ),
      barrierDismissible: false,
    );
    // return _parkCart;

  }
@override
  void initState() {
    // TODO: implement initState
  mainController= Get.put(MainController());

  loadData();
    super.initState();
  }

  void loadData() {
    // if(mySharedPreferences==null)
    //   {
    //     openSettingDialog();
    //   }else{
      if(mySharedPreferences.baseUrl.length!=0){
        if(mySharedPreferences.CoNo.length!=0)
        {
          mainController.fetchPosData();
          // mainController.fetchSectionData();
        }
      }else{

      }
    // }

  }

  bool isNotEmptySetting() {

      if(mySharedPreferences.baseUrl.length!=0){
        if(mySharedPreferences.CoNo.length!=0)
        {
          return true;
          // mainController.fetchSectionData();
        }

    }else{

      openSettingDialog();
      return false;
    }
      return false;
  }

}

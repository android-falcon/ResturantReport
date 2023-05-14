import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import '../constants/myStyle.dart';
import '../presentation/widgets/loading_dialog.dart';

class Utils{

  // static Future<PackageInfo> packageInfo() async => await PackageInfo.fromPlatform();

  static bool isNotEmpty(String? s) => s != null && s.isNotEmpty;

  static bool isEmpty(String? s) => s == null || s.isEmpty;

  static bool listsAreEqual(List one, List two) {
    var i = -1;
    if (one.isEmpty && two.isEmpty) {
      return true;
    }
    if (one.length != two.length) {
      return false;
    }
    return one.every((element) {
      i++;

      return two[i] == element;
    });
  }


  // static Future<EmployeeModel?> showLoginDialog() async {
  //   final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  //   final TextEditingController _controllerUsername = TextEditingController();
  //   final TextEditingController _controllerPassword = TextEditingController();
  //   var result = await Get.dialog(
  //     CustomDialog(
  //       gestureDetectorOnTap: () {},
  //       builder: (context, setState, constraints) => Column(
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Form(
  //               key: _keyForm,
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   CustomTextField(
  //                     controller: _controllerUsername,
  //                     label: Text('Username'.tr),
  //                     maxLines: 1,
  //                     validator: (value) {
  //                       return Validation.isRequired(value);
  //                     },
  //                   ),
  //                   CustomTextField(
  //                     controller: _controllerPassword,
  //                     label: Text('Password'.tr),
  //                     obscureText: true,
  //                     isPass: true,
  //                     maxLines: 1,
  //                     validator: (value) {
  //                       return Validation.isRequired(value);
  //                     },
  //                   ),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       SizedBox(width: 50.w),
  //                       Expanded(
  //                         child: CustomButton(
  //                           fixed: true,
  //                           backgroundColor: ColorsApp.red_light,
  //                           child: Text(
  //                             'Exit'.tr,
  //                             style: kStyleTextButton,
  //                           ),
  //                           onPressed: () {
  //                             Get.back();
  //                           },
  //                         ),
  //                       ),
  //                       SizedBox(width: 5.w),
  //                       Expanded(
  //                         child: CustomButton(
  //                           fixed: true,
  //                           child: Text('Ok'.tr),
  //                           onPressed: () {
  //                             FocusScope.of(context).requestFocus(FocusNode());
  //                             if (_keyForm.currentState!.validate()) {
  //                               var indexEmployee = allDataModel.employees.indexWhere((element) => element.username == _controllerUsername.text && element.password == _controllerPassword.text && !element.isKitchenUser);
  //                               if (indexEmployee != -1) {
  //                                 Get.back(result: allDataModel.employees[indexEmployee]);
  //                               } else {
  //                                 Fluttertoast.showToast(msg: 'Incorrect username or password'.tr, timeInSecForIosWeb: 3);
  //                               }
  //                             }
  //                           },
  //                         ),
  //                       ),
  //                       SizedBox(width: 50.w),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //     barrierDismissible: false,
  //   );
  //   return result;
  // }

  static showLoadingDialog([String? text]) {
    log('showLoadingIndicator Called !!');
    Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: LoadingDialog(
          title: text ?? 'Loading ...'.tr,
        ),
      ),
      barrierDismissible: false,
      useSafeArea: false,
    );
  }

  static hideLoadingDialog() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }

  static Future<bool> showAreYouSureDialog({required String title}) async {
    var result = await Get.defaultDialog(
      title: title,
      titleStyle: kStyleTextTitle,
      content: Container(
          height: 100.h,
          width: 150.w,
          child: Center(child: Text('Are you sure?'.tr))),
      textCancel: 'Cancel'.tr,
      textConfirm: 'Confirm'.tr,
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back(result: true);
      },
      barrierDismissible: true,
    );
    return result ?? false;
  }



}

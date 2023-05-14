import 'package:flutter/material.dart';
import 'package:report_resturant_flutter/app_router.dart';
import 'package:get/get.dart';
import 'package:report_resturant_flutter/presentation/screens/HomeScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Utils/my_shared_preferences.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await mySharedPreferences.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key, required this.appRouter}) : super(key: key);
//http://149.200.253.116:83/falcons/van.dll/
  // final AppRouter appRouter;
  //flutter build windows
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        home:HomeScreen() ,
        debugShowCheckedModeBanner: false,
        // onGenerateRoute:appRouter.generateRoute ,
      ),
    );
  }
}

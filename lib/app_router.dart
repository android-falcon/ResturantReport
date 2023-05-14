import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:report_resturant_flutter/businiss_logic/group_cubit.dart';
import 'package:report_resturant_flutter/data/respository/group_resporitory.dart';
import 'package:report_resturant_flutter/data/webservice/group_webservices.dart';
import 'package:report_resturant_flutter/presentation/screens/group_report.dart';
class AppRouter{
  late GroupCubit groupCubit;
  late GroupRespository groupRespository;
  AppRouter(){
    groupRespository=GroupRespository(GroupWebServices());
    groupCubit=GroupCubit(groupRespository);
  }




  Route? generateRoute(RouteSettings settings){
    switch (settings.name){
      // case '/':return MaterialPageRoute(builder: (_)=>GroupReportScreen());
      case '/':return MaterialPageRoute(builder: (_)=>BlocProvider(
          create: (BuildContext context)=>groupCubit,
        child: GroupReportScreen(),

      ),

      );
    }
  }



}
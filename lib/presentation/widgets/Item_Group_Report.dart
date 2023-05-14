import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:report_resturant_flutter/data/models/group_detail.dart';
class Item_GroupReport extends StatelessWidget {
   final Group_Detail group_detail;
  const Item_GroupReport({Key? key,required this.group_detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return


          Container(

              height:MediaQuery.of(context).size.height /15,
              width:1100,

             
                child:


                    Row(                          textDirection: TextDirection.rtl,
                          children: <Widget>[
                            getTextValue(group_detail.iTEMK.toString()),
                            getTextValue(group_detail.iTEMM.toString()),
                            getTextValue(group_detail.iTEMG.toString()),
                            getTextValue(group_detail.qTY.toString()),
                            getTextValue(group_detail.gROSS.toString()),
                            getTextValue(group_detail.gROSSSUM.toString()),
                            getTextValue(group_detail.dISC.toString()),

                            getTextValue(group_detail.tOTAFTRDISC.toString()),
                            getTextValue(group_detail.tAX.toString()),

                            getTextValue(group_detail.nET.toString()),
                            getTextValue(group_detail.pOSNO.toString()),




                          ],
                        ),





            );

    }

 Widget getTextValue(String textValue) {
    return   Expanded(
      child: Container(
        width:100,


          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Center(
                    child:
                     Text( textValue ,style: TextStyle(fontSize:14 ,color: Colors.black),
                        overflow: TextOverflow.ellipsis,),
                    )
              
              ),


            ],
          ),

      ),
    );
  }

  }


import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:report_resturant_flutter/data/models/SoldQtyModel.dart';
import 'package:report_resturant_flutter/data/models/group_detail.dart';
class Item_SoldReport extends StatelessWidget {
   SoledQtyModel group_detail;
   Item_SoldReport({Key? key,required this.group_detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return


      Container(

        height:MediaQuery.of(context).size.height /15,
        width:1100,


        child:


        Row(                          textDirection: TextDirection.rtl,
          children: <Widget>[
            getTextValue(group_detail.itemk.toString()),
            getTextValue(group_detail.itemm.toString()),
            getTextValue(group_detail.itemg.toString()),
            getTextValue(group_detail.itemocode.toString()),
            getTextValue(group_detail.itemonamea.toString(),flexvalue: 2),
            getTextValue(group_detail.qty.toString()),
            getTextValue(group_detail.hints.toString()),

            getTextValue(group_detail.service.toString()),
            getTextValue(group_detail.tax.toString()),

            getTextValue(group_detail.servicetax.toString()),
            getTextValue(group_detail.disc.toString()),
            getTextValue(group_detail.price.toString()),

            getTextValue(group_detail.gross.toString()),

            getTextValue(group_detail.grossperc.toString()),
            getTextValue(group_detail.net.toString()),






          ],
        ),





      );

  }

  Widget getTextValue(String textValue,{int flexvalue=1}) {
    return   Expanded(
      flex: flexvalue,
      child: Container(

        margin: EdgeInsets.only(left: 5),


        child:
            Padding(
                padding: const EdgeInsets.all(2.0),
                child: Center(
                  child:
                  Text( textValue ,style: TextStyle(fontSize:14 ,color: Colors.black),
                    overflow: TextOverflow.ellipsis,),
                )

            ),


      ),
    );
  }

}


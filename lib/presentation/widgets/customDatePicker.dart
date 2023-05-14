import 'package:flutter/material.dart';
import 'package:report_resturant_flutter/constants/colors.dart';
import 'dart:ui' as ui;
class CustomDatePicker extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Function()? onPressed;
  final Color? color;
  final String hint;
  final String? label;
  final String? selectedDate;
  final Color? borderColor;
  final TextStyle? textStyle;

  final double? borderRadius;

  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? labelPadding;
  final TextDirection? textDirection;
  const CustomDatePicker({Key? key, this.textStyle, this.labelStyle,
  this.borderColor, this.hint = "", this.label, this.color,
    this.width, this.labelPadding, this.height, this.margin, this.padding,
    this.textDirection=ui.TextDirection.rtl,this.selectedDate,this.onPressed,this.borderRadius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: textDirection ,
      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Container(
            margin: margin,
            padding: labelPadding,
            child: Center(
              child: Text(
                label!,
                style: labelStyle,
              ),
            ),
          ),
        Container(
          width: width,
          height: height,
          margin: margin,
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius!),
            color: Colors.white,
            border: Border.all(color: color != null ? borderColor ?? Colors.black : Colors.black , width: 0.5,style: BorderStyle.solid),
          ),
          child: Row(
            children: [
              Text(
                selectedDate!,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: onPressed, // Refer step 3
                  icon:Icon(Icons.date_range , color: myColors.dark_blue_, )
              ),
            ],
          ),
        ),
      ],
    );
  }
}

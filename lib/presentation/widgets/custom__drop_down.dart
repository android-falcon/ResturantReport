import 'package:flutter/material.dart';
import 'package:report_resturant_flutter/constants/colors.dart';
import 'dart:ui' as ui;
class CustomDropDown extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final String hint;
  final String? label;
  final Color? borderColor;
  final TextStyle? textStyle;
  final bool? isExpanded;
  final List<DropdownMenuItem<Object>> items;
  final Object? selectItem;
  final void Function(Object?)? onChanged;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? labelPadding;
  final TextDirection? textDirection;
  const CustomDropDown({Key? key, this.textStyle, this.labelStyle, required this.items,
    required this.selectItem, this.onChanged, this.borderColor, this.hint = "", this.label, this.color,
    this.width, this.labelPadding, this.height, this.margin, this.isExpanded, this.padding,this.textDirection=ui.TextDirection.rtl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: textDirection ,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
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
            borderRadius: BorderRadius.circular(5),
            color: color ?? Colors.black12,
            border: Border.all(color: color != null ? borderColor ?? Colors.transparent : Colors.transparent, width: 0.5),
          ),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: DropdownButtonHideUnderline(
                child: items.isNotEmpty
                    ? DropdownButton(
                        isExpanded: isExpanded ?? false,
                        style: textStyle ?? Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),
                        value: selectItem ?? (hint != "" ? null : items[0].value),
                        items: items,
                        hint: Text(
                          hint,
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        ),
                        icon: const Padding(
                          padding: EdgeInsetsDirectional.only(end: 2.0),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 24,
                            color: myColors.primarycolor_,
                          ),
                        ),
                        onChanged: onChanged)
                    : const SizedBox(
                        height: 24.0 * 2,
                        width: double.infinity,
                      ),
              )),
        ),
      ],
    );
  }
}

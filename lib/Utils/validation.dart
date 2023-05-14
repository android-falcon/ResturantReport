import 'package:get/get.dart';
import 'package:report_resturant_flutter/Utils/utils.dart';


class Validation {
  static String? isRequired(value) {
    if (Utils.isEmpty(value)) {
      return 'This field is required'.tr;
    }
    return null;
  }

  static String? qty(value, minQty, maxQty) {
    if (Utils.isEmpty(value)) {
      return 'This field is required'.tr;
    } else if (minQty != null && double.parse(value) < minQty) {
      return '${'Quantity must be greater than or equal to'.tr} $minQty';
    } else if (maxQty != null && double.parse(value) > maxQty) {
      return '${'Quantity must be less than or equal to'.tr} $maxQty';
    }
    return null;
  }



  static String? priceChange(priceChange) {
    if (priceChange < 0) {
      return 'The item price cannot be less than zero'.tr;
    }
    return null;
  }


}

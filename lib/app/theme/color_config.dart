import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:niftihub/app/theme/app_colors.dart';

class ColorConfig{
  static const String gradient_bg_key = 'gradient_bg';
  static const _colors = {
    gradient_bg_key:[AppColor.gradientBgLight,AppColor.gradientBgDark]
  };

  static LinearGradient getGradientBg(String key){
    final colors = _colors[key];
    if(colors == null){
      return AppColor.gradientBgLight;
    }
    if(Get.isDarkMode){
      return colors[1];
    }else{
      return colors[0];
    }
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:niftihub/app/theme/app_colors.dart';

import 'root_state.dart';

class RootLogic extends GetxController {
  var appBarColor = AppColor.primaryColor.obs;

  void changeColor(Color newColor) {
      appBarColor.value = newColor;
  }
  final RootState state = RootState();
}

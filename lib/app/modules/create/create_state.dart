import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CreateState {
  final createCtrl1 = TextEditingController(text: "");
  final createCtrl2 = TextEditingController(text: "");
  final createCtrl3 = TextEditingController(text: "");
  final createCtrl4 = TextEditingController(text: "");
  var upload = false.obs;
  var tag = false.obs;
  var rightSelected = false.obs;
  var tagList = <String>[].obs;
  var right = "".obs;
  var selectedLabels = List.filled(4, false).obs;
  File? imageFile;
  CreateState() {
    ///Initialize variables
  }
}

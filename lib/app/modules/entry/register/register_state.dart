import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterState {
  final usernameCtrl = TextEditingController(text: "");
  final passwordCtrl = TextEditingController(text: "");
  var showClearUsername = false.obs;
  var showClearPassword = false.obs;
  var showPassword = false.obs;
  var checkUseAndPrivate = false.obs;
  var agree = false.obs;
  var remember = false.obs;
  RegisterState() {
    usernameCtrl.addListener(() {
      showClearUsername.value = usernameCtrl.text.isNotEmpty;
    });
    passwordCtrl.addListener(() {
      showClearPassword.value = passwordCtrl.text.isNotEmpty;
    });
  }
}

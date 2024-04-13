import 'package:get/get.dart';
import 'package:niftihub/app/data/net/api_user.dart';
import 'package:niftihub/app/routes/app_routes.dart';
import 'package:niftihub/app/theme/app_string.dart';
import 'package:niftihub/app/utils/mmkv.dart';

import 'register_state.dart';

class RegisterLogic extends GetxController {
  final RegisterState state = RegisterState();
  login(Function shake) async {
    String username = state.usernameCtrl.text.trim();
    String password = state.passwordCtrl.text.trim();

    // TODO
    if (username == "12345678910" && password == "111") {
      print("登录成功");
      // ToastUtil.showToast("登录成功");
      MMKVUtil.put(AppString.USERNAME, username);
      MMKVUtil.put(AppString.IS_LOGIN, true);
      Get.offAllNamed(AppRoutes.root);
      return;
    }

    // if (username.length != 11) {
    //   ToastUtil.showToast("请输入正确的手机号");
    //   return;
    // }
    // if (password.isEmpty) {
    //   ToastUtil.showToast("密码不能为空");
    //   return;
    // }
    // if (state.checkUseAndPrivate.value == false) {
    //   shake();
    //   ToastUtil.showToast("请勾选使用条款和隐私政策");
    //   return;
    // }
    bool isSuccess = await ApiUser.login(username, password);
    if (isSuccess) {
      print("登录成功");
      MMKVUtil.put(AppString.USERNAME, username);
      MMKVUtil.put(AppString.IS_LOGIN, true);
      Get.offAllNamed(AppRoutes.root);
    } else {
      print("登录失败");
      // ToastUtil.showToast("登录失败");
    }
  }
}

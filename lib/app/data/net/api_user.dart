
import 'package:dio/dio.dart';
import 'package:niftihub/app/data/net/dio.dart';
import 'package:niftihub/app/data/net/url.dart';
import 'package:niftihub/app/theme/app_string.dart';
import 'package:niftihub/app/utils/mmkv.dart';

class ApiUser{
  static Future<bool> login(String phone, String password) async {
    var response = await DioUtil().post(Url.login,
        data: {"phone": phone, "password": password},
        options: Options(contentType: "application/json"));
    // ToastUtil.showToast(response?.data["msg"]);
    if (response?.data["code"] == 200) {
      String token = response?.data["data"]["token"];
      // await getInfo(token);
      MMKVUtil.put(AppString.TOKEN, token);
      return true;
    }
    return false;
  }

  static logout() async {
    String token = MMKVUtil.getString(AppString.TOKEN);
    if (token == "") {
      return false;
    }
    MMKVUtil.clear();
    // var response = await DioUtil()
    //     .post(Url.logout, options: Options(headers: {"token": token}));
    // if (response?.data["code"] == 1) {
    //   MMKVUtil.clear();
    //   return true;
    // }
    return true;
  }
}
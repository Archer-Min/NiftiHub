import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mmkv/mmkv.dart';
import 'package:niftihub/app/modules/entry/login/login_binding.dart';
import 'package:niftihub/app/modules/root/root_binding.dart';
import 'package:niftihub/app/routes/app_pages.dart';
import 'package:niftihub/app/routes/app_routes.dart';
import 'package:niftihub/app/theme/app_string.dart';
import 'package:niftihub/app/utils/mmkv.dart';
import 'package:statusbarz/statusbarz.dart';

void main() async {
  final rootDir = await MMKV.initialize();
  // splash
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    bool isLogin = MMKVUtil.getBool(AppString.IS_LOGIN);

    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(isLogin? AppRoutes.root:AppRoutes.login);
    });


    return ScreenUtilInit(
        designSize: const Size(757, 1624),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child){
          return StatusbarzCapturer(
            child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(

              ),
              initialBinding: isLogin ? RootBinding() : LoginBinding(),
              initialRoute: AppRoutes.splash,
              //initialRoute: isLogin? AppRoutes.root:AppRoutes.login,
              getPages: AppPages.pages,
            ),
          );
        }
    );
  }
}
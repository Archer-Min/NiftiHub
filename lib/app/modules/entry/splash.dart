import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niftihub/app/widgets/GradientBackground.dart';
import 'package:niftihub/res/assets_res.dart';
class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GradientBackground2(),
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: double.infinity,
                    height: 400.h,
                    child: Image.asset(AssetsRes.SPLASHTOP,fit: BoxFit.fill,),
                  ),
                  Container(
                    height: 500.h,
                      child: Image.asset(AssetsRes.LOGO)),
                  SizedBox(height: 5,),
                  Image.asset(AssetsRes.LOGO_TEXT),
                  SizedBox(height: 10,),
                  Image.asset(AssetsRes.SPLASH_ICON_INTO),
                  Container(
                    width: double.infinity,
                    height: 400.h,
                    child: Image.asset(AssetsRes.SPLASHBOTTOM,fit: BoxFit.fill,),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

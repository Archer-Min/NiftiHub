import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:niftihub/app/routes/app_routes.dart';
import 'package:niftihub/app/theme/app_colors.dart';
import 'package:niftihub/app/theme/app_fonts.dart';
import 'package:niftihub/app/theme/app_string.dart';
import 'package:niftihub/app/utils/mmkv.dart';
import 'package:niftihub/app/widgets/GradientBackground.dart';
import 'package:niftihub/app/widgets/my_app_bar.dart';
import 'package:niftihub/app/widgets/my_textfield.dart';
import 'package:niftihub/res/assets_res.dart';
import 'package:niftihub/app/utils/keyboard.dart';

import 'login_logic.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final logic = Get.find<LoginLogic>();
  final state = Get
      .find<LoginLogic>()
      .state;

  late final AnimationController _shakeCtrl = AnimationController(
      duration: const Duration(milliseconds: 500), vsync: this)
    ..addStatusListener(
          (status) {
        if (status == AnimationStatus.completed) {
          _shakeCtrl.reset();
        }
      },
    );

  _shake() {
    _shakeCtrl.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          GradientBackground2(),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              width: double.infinity,
              height: 400.h,
              child: Image.asset(AssetsRes.SPLASHBOTTOM, fit: BoxFit.fill,),
            ),
          ),
          Column(
            children: [
              MyAppBar(title: "",),
              SizedBox(height: 80.h,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text("账号密码登录", style: AppFonts.fontSize60w,),
              ),
              Text("请使用已注册的账号密码", style: TextStyle(color: Colors.grey),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50.h),
                child: UsernameTextField(state.usernameCtrl,
                    onClear: () => state.usernameCtrl.clear()),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,),
                child: PasswordTextField(
                  state.passwordCtrl,
                  hint: AppString.passwordInput,
                  onClear: () => state.passwordCtrl.clear(),
                  prefixIcon: Icons.privacy_tip_outlined,
                  onSubmitted: (_) =>
                  {logic.login(_shake), KeyboardUtils.hideKeyboard(context)},
                ),
              ),
              // ElevatedButton(
              //   style: const ButtonStyle(
              //     backgroundColor: MaterialStatePropertyAll(AppColor.labelColorSelected),
              //     fixedSize:
              //     MaterialStatePropertyAll(Size.fromWidth(double.maxFinite)),
              //   ),
              //   onPressed: () {
              //     logic.login(_shake);
              //     KeyboardUtils.hideKeyboard(context);
              //   },
              //   child: Text(AppString.login, style: AppFonts.fontSize22),
              // )
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Obx(() {
                      return Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            fillColor: MaterialStateColor.resolveWith(
                                  (states) {
                                if (states.contains(MaterialState.selected)) {
                                  return AppColor.pink_linear;
                                }
                                return Colors.white;
                              },
                            ),
                          ),
                        ),
                        child: Checkbox(
                          value: state.remember.value,
                          onChanged: (value) {
                            state.remember.value = value!;
                          },
                        ),
                      );
                    }),
                    Expanded(child: Text("记住密码", style: TextStyle(fontSize: 15, color: Colors.grey),)),
                    Text("忘记密码？", style: TextStyle(fontSize: 15, color: Colors.blue),)
                  ],
                ),
              ),
              SizedBox(height: 30.h,),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Obx(() {
                      return Theme(
                        data: ThemeData(
                          // 设置Checkbox的勾选颜色
                          checkboxTheme: CheckboxThemeData(
                            fillColor: MaterialStateColor.resolveWith(
                                  (states) {
                                if (states.contains(MaterialState.selected)) {
                                  // 勾选时的颜色
                                  return AppColor.pink_linear;
                                }
                                // 未勾选时的颜色
                                return Colors.white;
                              },
                            ),
                          ),
                        ),
                        child: Checkbox(
                          value: state.agree.value,
                          onChanged: (value) {
                            state.agree.value = value!;
                          },
                        ),
                      );
                    }),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "同意 ",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          TextSpan(
                            text: "《平台服务协议》",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // 在此处添加跳转到平台服务协议页面的代码
                              },
                          ),
                          TextSpan(
                            text: " 和 ",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          TextSpan(
                            text: "《隐私政策》",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.blue,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // 在此处添加跳转到隐私政策页面的代码
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (state.agree.value) {
                    logic.login(_shake);
                    KeyboardUtils.hideKeyboard(context);
                    MMKVUtil.put(AppString.IS_MANAGER, false);
                  } else {
                    showToast("请先同意相关协议和政策", context: context);
                  }
                },
                child: Container(
                  width: 650.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70.0),
                    gradient: loginBtBg,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Center(
                      child: Text("登录",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 45.sp,
                            fontWeight: FontWeight.w600
                        ),),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 80.w,top: 12),
                  child: GestureDetector(
                    onTap: () {
                      MMKVUtil.put(AppString.IS_MANAGER, true);
                      //跳转管理员登录页面
                      Get.toNamed(AppRoutes.managerLogin);
                    },
                    child: Container(
                      width: 200.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70.0),
                        color: Color(0xffB4C4FF),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Center(
                          child: Text("管理员登录",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.sp,
                            ),),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50.h,),
              GestureDetector(
                onTap: (){
                  Get.offAllNamed(AppRoutes.register);
                },
                  child: Text("没有账号？前往注册",style: TextStyle(color: Colors.blue,fontSize: 14),)),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconImage(imgPath: AssetsRes.WEICHAT1),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: IconImage(imgPath: AssetsRes.QQ),
                    ),
                    IconImage(imgPath: AssetsRes.THEAPPLE)
                  ],
                ),
              ),
              Text('其他登录方式', style: TextStyle(color: Colors.grey),)
            ],
          )
        ],
      ),
    );
  }

  Widget IconImage({required imgPath}) {
    return Container(
      height: 100.h,
      width: 100.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(500)
      ),
      child: Image.asset(imgPath, fit: BoxFit.fill,),);
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:niftihub/app/routes/app_routes.dart';
import 'package:niftihub/app/theme/app_colors.dart';
import 'package:niftihub/app/theme/app_fonts.dart';
import 'package:niftihub/app/theme/app_string.dart';
import 'package:niftihub/app/widgets/GradientBackground.dart';
import 'package:niftihub/app/widgets/my_app_bar.dart';
import 'package:niftihub/app/widgets/my_textfield.dart';
import 'package:niftihub/res/assets_res.dart';

import 'login_logic.dart';

class ManagerLoginPage extends StatelessWidget {
  const ManagerLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ManagerLoginLogic>();
    final state = Get.find<ManagerLoginLogic>().state;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          GradientBackground2(),
          Column(
            children: [
              MyAppBar(title: "",),
              SizedBox(height: 80.h,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text("管理员登录", style: AppFonts.fontSize60w,),
              ),
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
                ),
              ),
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
              GestureDetector(
                onTap: () {
                  Get.offAllNamed(AppRoutes.root);
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
            ],
          ),
        ],
      ),
    );
  }
}

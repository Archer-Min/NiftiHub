
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:niftihub/app/theme/app_colors.dart';
import 'package:niftihub/app/theme/app_string.dart';
import 'package:niftihub/app/utils/keyboard.dart';


class PasswordTextField extends StatelessWidget {
  final TextEditingController ctrl;
  final String hint;
  final IconData? prefixIcon;
  final Function() onClear;
  final ValueChanged<String>? onSubmitted;
  final TextInputAction? textInputAction;
  final Rx<bool> clearVisible = false.obs;
  final Rx<bool> passwordVisible = false.obs;
  final FocusNode focusNode = FocusNode();
  late final Rx<bool> focus = false.obs;

  PasswordTextField(
      this.ctrl, {
        super.key,
        required this.hint,
        required this.prefixIcon,
        required this.onClear,
        this.onSubmitted,
        this.textInputAction,
      }) {
    focusNode.addListener(() {
      focus.value = focusNode.hasFocus;
      clearVisible.value = ctrl.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextField(
        controller: ctrl,
        focusNode: focusNode,
        decoration: InputDecoration(
            filled: true,
            fillColor: AppColor.buttonFill,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(115.0),
              borderSide: BorderSide.none,
            ),
            hintText: hint,
            prefixIcon: Icon(prefixIcon),
            suffix: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Visibility(
                    visible: focus.value && clearVisible.value,
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      onTap: () => {onClear(), clearVisible.value = false},
                      child: const Icon(Icons.clear, size: 15),
                    )),
                Visibility(
                    visible: focus.value && clearVisible.value,
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      onTap: () =>
                      {passwordVisible.value = !passwordVisible.value},
                      child:
                      const Icon(Icons.remove_red_eye_outlined, size: 15),
                    )),
              ],
            )),
        obscureText: !focus.value || !passwordVisible.value,
        textInputAction: textInputAction,
        keyboardType: TextInputType.visiblePassword,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]|[0-9]"))
        ],
        onChanged: (str) => {clearVisible.value = str.isNotEmpty},
        onSubmitted: onSubmitted));
  }
}

class UsernameTextField extends StatelessWidget {
  final TextEditingController ctrl;
  final Function() onClear;
  final Rx<bool> clearVisible = false.obs;
  final FocusNode focusNode = FocusNode();
  late final Rx<bool> focus = false.obs;

  UsernameTextField(
      this.ctrl, {
        super.key,
        required this.onClear,
      }) {
    focusNode.addListener(() {
      focus.value = focusNode.hasFocus;
      clearVisible.value = ctrl.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextField(
        controller: ctrl,
        focusNode: focusNode,
        decoration: InputDecoration(
            hintText: AppString.usernameInput,
            prefixIcon: const Icon(Icons.phone_android),
            suffix: Visibility(
                visible: focus.value && clearVisible.value,
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  onTap: onClear,
                  child: const Icon(Icons.clear, size: 15),
                )),
            filled: true,
            fillColor: AppColor.buttonFill,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(115.0),
              borderSide: BorderSide.none,
            ),
        ),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        onChanged: (str) => {clearVisible.value = str.isNotEmpty},
        onSubmitted: (_) => KeyboardUtils.hideKeyboard(context)));
  }
}

class CreateTextField extends StatelessWidget {
  final TextEditingController ctrl;
  final String hintText;

  final double height;
  final Color? color;

  const CreateTextField({Key? key, required this.ctrl, required this.hintText, required this.height, this.color = const Color(0xffE2F8FF),}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height.h,
      color: color,
      child: TextField(
          minLines: null, // 自动换行
          maxLines: null, // 自动换行
          controller: ctrl,
          decoration: InputDecoration(
            hintText: hintText+"🖊",
            filled: true,
            fillColor: color,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide.none,
            ),
          ),
          textInputAction: TextInputAction.next,
          onChanged: (str) => {},
          onSubmitted: (_) => KeyboardUtils.hideKeyboard(context)),
    );
  }
}


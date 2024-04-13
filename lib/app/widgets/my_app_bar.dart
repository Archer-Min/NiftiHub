import 'package:niftihub/app/theme/app_fonts.dart';
import 'package:niftihub/app/widgets/leading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 自定义的AppBar
class MyAppBar extends StatelessWidget  {
  const MyAppBar({
    super.key,
    this.title = '',
    this.height = kToolbarHeight,
    this.leadingText = '',
    this.backgroundColor = Colors.transparent,
    this.showLeading = true,
  });

  final String title;
  final double height;
  final String leadingText;
  final Color backgroundColor;
  final bool showLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title,style: AppFonts.appBarTitleText,),
      leading: showLeading ? Leading(text: leadingText) : null,
      leadingWidth: 120,
      automaticallyImplyLeading: false, // 是否需要自动生成leading
      backgroundColor: backgroundColor,
      shadowColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Colors.black,
    );
  }

// @override
// Size get preferredSize => Size(double.infinity, height);
}
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niftihub/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  final String assetPath;
  final String text;
  final bool isSelected;
  const MyTab(this.assetPath, this.text, this.isSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                assetPath,
                color: isSelected ? AppColor.labelColorSelected : AppColor.labelColorUnSe,
                width: 70.w,
                height: 70.w,
              ),
              Text(
                text,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 30.sp,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

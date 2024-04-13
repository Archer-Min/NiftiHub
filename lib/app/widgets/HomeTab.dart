import 'package:niftihub/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:niftihub/app/theme/app_fonts.dart';

class HomeTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  const HomeTab(this.text, this.isSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                maxLines: 1,
                style: TextStyle(fontSize: 18,color: isSelected ? AppColor.selectedIndexColor : Colors.black,),
              )
            ],
          );
        },
      ),
    );
  }
}

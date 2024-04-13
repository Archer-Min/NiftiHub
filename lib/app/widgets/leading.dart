import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Leading extends StatelessWidget {
  const Leading({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.only(left: 12),
        width: 66,
        height: 30,
        alignment: Alignment.center,
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage(AssetsRes.LEADING),
        //     scale: 1,
        //   ),
        // ),
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black, // 图标颜色
              size: 24, // 图标大小
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateList extends StatelessWidget {
  final String title;
  const CreateList({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            color: Colors.black,
            fontSize: 32.sp,
          ),
          children: [
            TextSpan(
              text: "*",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            TextSpan(
              text: title,
            ),
          ],
        ),
      )
    );
  }
}

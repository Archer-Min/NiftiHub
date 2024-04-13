import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niftihub/app/theme/app_colors.dart';
class TotalAndSaleContainer extends StatelessWidget {
  final String tag;
  final String total;
  const TotalAndSaleContainer({Key? key, required this.total, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
            height: 50.h,
            width: 220.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color(0xdfd0cccc),
                  blurRadius: 3,
                  spreadRadius: 1,
                  offset: Offset(-1, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text("$total份",style: TextStyle(color: Colors.grey,)),
                ),
              ],
            ),
          ),
          Container(
            height: 50.h,
            width: 90.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              gradient: gradientColor2,
            ),
            child: Center(child: Text(tag, style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600))),
          ),
        ]
    );
  }
}

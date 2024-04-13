import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niftihub/app/theme/app_colors.dart';

class BaseSearchBar extends StatelessWidget {
  final String hintText;
  final Function() onSearch;

  const BaseSearchBar({
    Key? key,
    required this.hintText,
    required this.onSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      decoration: BoxDecoration(
        color: AppColor.searchBarBgColor,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.black, width: 0.3),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(Icons.search_outlined, color: Colors.grey,),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          GestureDetector(
            onTap: onSearch,
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.searchBtColor,
                borderRadius: BorderRadius.circular(100),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Text(
                "搜索",
                style: TextStyle(color: Colors.white, fontSize: 28.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

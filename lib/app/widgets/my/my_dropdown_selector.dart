
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niftihub/app/theme/app_fonts.dart';

class MyDropdownSelector extends StatefulWidget {
  const MyDropdownSelector({Key? key, required this.tag}) : super(key: key);
  final String tag;

  @override
  State<MyDropdownSelector> createState() => _MyDropdownSelectorState();
}

class _MyDropdownSelectorState extends State<MyDropdownSelector> {
  String _selectedOption = '升序'; // 默认选择的选项
  List<String> _options = ['升序', '降序']; // 所有选项

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.tag, style: AppFonts.fontSize28,), // 时间两个字
        PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return _options.map((String option) {
              return PopupMenuItem(
                height: 20.h,
                value: option,
                child: Text(option),
              );
            }).toList();
          },
          onSelected: (String selectedOption) {
            setState(() {
              _selectedOption = selectedOption;
            });
          },
          child: Container(
            width: 30.w,
            child: Icon(Icons.arrow_drop_down),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:niftihub/app/modules/create/create_logic.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final String label;
  final Function(bool?) onChanged;

  const CustomCheckbox({
    Key? key,
    required this.value,
    required this.label,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<CreateLogic>();
    final state = Get
        .find<CreateLogic>()
        .state;

    return GestureDetector(
      onTap: () {
        onChanged(!value); // 切换选中状态
        state.tag.value = true;
        state.tagList.value.add(label);
      },
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: Color(0xff07A8DD),
          ),
          Text(label),
        ],
      ),
    );
  }
}

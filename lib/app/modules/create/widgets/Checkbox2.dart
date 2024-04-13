import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:niftihub/app/modules/create/create_logic.dart';

class Checkbox2 extends StatelessWidget {
  final bool value;
  final String label;
  final Function(bool?) onChanged;

  const Checkbox2({
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
        state.rightSelected.value = true;
        state.right.value = label;
      },
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: Color(0xff07A8DD),
          ),
        ],
      ),
    );
  }
}

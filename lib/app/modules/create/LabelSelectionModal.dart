import 'package:flutter/material.dart';
import 'package:niftihub/app/modules/create/widgets/CustomCheckbox.dart';

class LabelSelectionModal extends StatefulWidget {
  @override
  _LabelSelectionModalState createState() => _LabelSelectionModalState();
}

class _LabelSelectionModalState extends State<LabelSelectionModal> {
  List<String> labels = [
    '数字许可',
    '艺廊作品',
    '个人作品',
    '艺术家签名',
    '摄影作品',
    '艺术藏品',
    '布面油画',
    '版画',
    '盲盒',
    '装置',
    '水墨',
    '盲盒',
  ];
  List<bool> selectedLabels = List.filled(12, false); // 默认都未选中

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        children: [
          GridView.builder(
            shrinkWrap: true,
            itemCount: labels.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 3.0,
              crossAxisSpacing: 3.0,
            ),
            itemBuilder: (context, index) {
              return CustomCheckbox(
                value: selectedLabels[index],
                label: labels[index],
                onChanged: (newValue) {
                  setState(() {
                    selectedLabels[index] = newValue!;
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

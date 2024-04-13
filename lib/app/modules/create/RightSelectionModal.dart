import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niftihub/app/modules/create/widgets/Checkbox2.dart';
import 'package:niftihub/app/modules/create/widgets/CustomCheckbox.dart';

class RightSelectionModal extends StatefulWidget {
  @override
  _RightSelectionModalState createState() => _RightSelectionModalState();
}

class _RightSelectionModalState extends State<RightSelectionModal> {
  List<String> labels = [
    '数字作品',
    '数字许可作品',
    '数字衍生品',
    '衍生品'
  ];
  List<String> content = [
    '用户购买数字作品后，即拥有该数字作品，但数字作品的知识产权仍由作品知识产权的权利人拥有。数字作品的知识产权并不因数字作品的交易行为行为而发生任何转移或共享。用户可以进行学习、研究、欣赏、收藏。',
    '用户购买数字许可作品后，即拥有该数字许可作品，用户可以进行学习、研究、欣赏、收藏。同时数字许可作品持有人在持有作品期间取得著作权人全球范围内永久性的著作权使用许可授权，该许可为非排他性的，可转让的、不可转许可的权利。但数字许可作品的知识产权并不因数字许可作品的交易行为行为而发生任何转移，数字许可作品知识产权的权利人仍拥有该作品的知识产权。',
    '数字衍生品包括印有艺术家作品的文具、生活用品、服装、饰品以及与艺术元素相结合的具有收藏价值的虚拟产品等。数字衍生品在交易完成后，用户即拥有该数字衍生品，但数字衍生品的知识产权仍由作品知识产权的权利人拥有。数字衍生品的知识产权并不因数字衍生品的交易行为行为而发生任何转移或共享。用户可以进行学习、研究、欣赏、收藏。',
    '衍生品包括经艺术家亲笔签名或限量发行的专供收藏和欣赏的艺术藏品、布面油画、版画、纸本水墨，和印有艺术家代表作品的文具、生活用品、服装、饰品以及与艺术元素相结合的具有收藏或使用价值的实物产品等。'
  ];
  List<bool> selectedLabels = List.filled(4, false); // 默认都未选中

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox2(
            value: selectedLabels[0],
            label: labels[0],
            onChanged: (newValue) {
              setState(() {
                selectedLabels[0] = newValue!;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: Text(content[0],style: TextStyle(color: Colors.grey,fontSize: 26.sp),),
          ),
          Checkbox2(
            value: selectedLabels[1],
            label: labels[1],
            onChanged: (newValue) {
              setState(() {
                selectedLabels[1] = newValue!;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: Text(content[1],style: TextStyle(color: Colors.grey,fontSize: 26.sp),),
          ),
          Checkbox2(
            value: selectedLabels[2],
            label: labels[2],
            onChanged: (newValue) {
              setState(() {
                selectedLabels[2] = newValue!;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: Text(content[2],style: TextStyle(color: Colors.grey,fontSize: 26.sp),),
          ),
          Checkbox2(
            value: selectedLabels[3],
            label: labels[3],
            onChanged: (newValue) {
              setState(() {
                selectedLabels[3] = newValue!;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: Text(content[3],style: TextStyle(color: Colors.grey,fontSize: 26.sp),),
          ),
        ],
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niftihub/app/theme/app_colors.dart';
import 'package:niftihub/app/theme/app_fonts.dart';
import 'package:niftihub/app/theme/app_string.dart';
import 'package:niftihub/app/widgets/image_preview.dart';
import 'package:niftihub/res/assets_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as bd;

import 'avatar_logic.dart';

class AvatarComponent extends StatefulWidget {
  final Widget? child;
  final bool showAdd;
  final double height;

  const AvatarComponent({this.child, this.showAdd = false, super.key, required this.height});

  @override
  State<AvatarComponent> createState() => _AvatarComponentState();
}

class _AvatarComponentState extends State<AvatarComponent> {
  final logic = Get.put(AvatarLogic());
  final state = Get.find<AvatarLogic>().state;
  late dynamic _child;

  @override
  void initState() {
    super.initState();
    _child = widget.child ?? Image.asset(AssetsRes.MY_AVATAR);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(ImagePreview(_child.image));
      },
      child: bd.Badge(
        badgeContent: GestureDetector(
          onTap: (){},
          child: const Icon(Icons.add),
        ),
        showBadge: widget.showAdd,
        child: Hero(
          tag: "header",
          child: Container(
            height: widget.height.h,
            width: widget.height.h,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: _child,
          ),
        ),
      ),
    );
  }

  // Future<dynamic> _showChoice() {
  //   return showModalBottomSheet(
  //     context: context,
  //     builder: (_) => Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: <Widget>[
  //         _sheetItem(onPressed: _getCamera, text: AppString.camera),
  //         const Divider(),
  //         _sheetItem(onPressed: _getGallery, text: AppString.gallery),
  //       ],
  //     ),
  //   );
  // }

  // void _getGallery() {
  //   Get.back();
  //   logic.getGallery().then((value) => {
  //     if (value != null)
  //       {
  //         setState(
  //               () {
  //             _child = value;
  //           },
  //         )
  //       }
  //   });
  // }
  //
  // void _getCamera() {
  //   Get.back();
  //   logic.getCamera().then(
  //         (value) => {
  //       if (value != null)
  //         {
  //           setState(
  //                 () {
  //               _child = value;
  //             },
  //           )
  //         }
  //     },
  //   );
  // }

  Widget _sheetItem({required VoidCallback onPressed, required String text}) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Container(
        width: double.maxFinite,
        alignment: Alignment.center,
        child: Text(
          text,
          style: AppFonts.fontSize24,
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<AvatarLogic>();
    super.dispose();
  }
}


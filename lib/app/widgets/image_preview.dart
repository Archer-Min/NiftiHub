import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class ImagePreview extends StatelessWidget {
  final ImageProvider image;

  const ImagePreview(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "header",
      transitionOnUserGestures: true,
      child: Stack(
        children: [
          PhotoView(
            imageProvider: image,
            enableRotation: true,
            filterQuality: FilterQuality.high,
            onTapUp: (_, __, ___) {
              Get.back();
            },
          ),
          Positioned(
            right: 50.h,
              bottom: 200.h,
              child: Column(
                children: [
                  Icon(Icons.camera_alt_outlined,color: Colors.white,),
                  SizedBox(height: 10,),
                  Icon(Icons.photo_filter,color: Colors.white,),
                ],
              )),
        ]
      ),
    );
  }
}
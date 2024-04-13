import 'dart:io';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'avatar_state.dart';

class AvatarLogic extends GetxController {
  final AvatarState state = AvatarState();

  // Future<Image?> getCamera() async {
  //   final image = await ImagePicker().pickImage(source: ImageSource.camera);
  //   if (image != null) {
  //     return Image.file(File(image.path));
  //   } else {
  //     //ToastUtil.showToast("无照片");
  //     return null;
  //   }
  // }
  //
  // Future<Image?> getGallery() async {
  //   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     return Image.file(File(image.path));
  //   } else {
  //     //ToastUtil.showToast("无照片");
  //     return null;
  //   }
  // }
}

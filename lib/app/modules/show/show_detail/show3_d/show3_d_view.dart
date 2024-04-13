import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:get/get.dart';
import 'package:niftihub/res/assets_res.dart';

import 'show3_d_logic.dart';

class Show3DPage extends StatelessWidget {
  const Show3DPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<Show3DLogic>();
    // final state = Get.find<Show3DLogic>().state;

    return Scaffold(
      body: Center(
        // child: Cube(
        //   onSceneCreated: (Scene scene) {
        //     final object = Object(fileName: AssetsRes.CUBEEXAMPLE, scale: Vector3.all(5.0));
        //     scene.world.add(object);
        //   },
        // ),
      ),
    );
  }
}

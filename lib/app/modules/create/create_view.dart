import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:niftihub/app/modules/create/LabelSelectionModal.dart';
import 'package:niftihub/app/modules/create/RightSelectionModal.dart';
import 'package:niftihub/app/modules/create/widgets/Checkbox2.dart';
import 'package:niftihub/app/modules/my/my_create/widgets/create_list.dart';
import 'package:niftihub/app/theme/app_fonts.dart';
import 'package:niftihub/app/widgets/GradientBackground.dart';
import 'package:niftihub/app/widgets/my_app_bar.dart';
import 'package:niftihub/app/widgets/my_textfield.dart';
import 'package:niftihub/app/widgets/put_up_bt.dart';

import 'create_logic.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  String selectedPayment = '1';
  String selectedRight = "数字作品";

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<CreateLogic>();
    final state = Get
        .find<CreateLogic>()
        .state;

    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          GradientBackground2(),
          SingleChildScrollView(
            child: Column(
              children: [
                MyAppBar(title: "铸造作品",),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 30.w, vertical: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CreateList(title: "上传铸造作品"),
                      SizedBox(height: 15.w,),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffE2F8FF),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20))
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 50.0
                                      .w, vertical: 20.w),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Align(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12.0),
                                          child: Text("上传作品", style: TextStyle(
                                              fontSize: 34.sp,
                                              fontWeight: FontWeight.w600),),
                                        ),
                                        alignment: Alignment.center,
                                      ),
                                      CreateList(title: "上传艺术作品"),
                                      Obx(() {
                                        return GestureDetector(
                                          onTap: () {
                                            showModalBottomSheet(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Container(
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize
                                                        .min,
                                                    children: [
                                                      ListTile(
                                                        leading: Icon(Icons
                                                            .photo_library),
                                                        title: Text('图库'),
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                          logic.openGallery();
                                                        },
                                                      ),
                                                      ListTile(
                                                        leading: Icon(
                                                            Icons.camera_alt),
                                                        title: Text('相机'),
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                          logic.openCamera();
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: state.upload.value ?
                                          Container(
                                            height: 250.h,
                                            width: 250.h,
                                            decoration: BoxDecoration(
                                              color: Color(0xff94E5FF),
                                              borderRadius: BorderRadius
                                                  .circular(10),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius
                                                  .circular(10),
                                              child: Image.file(
                                                state.imageFile!,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          )
                                              : Container(
                                            height: 250.h,
                                            width: 250.h,
                                            decoration: BoxDecoration(
                                              color: Color(0xff94E5FF),
                                              borderRadius: BorderRadius
                                                  .circular(10),
                                            ),
                                            child: Icon(
                                              Icons.add, color: Colors.white,),
                                          ),
                                        );
                                      }),
                                      SizedBox(height: 20.h,),
                                      CreateList(title: "作品名称"),
                                      CreateTextField(ctrl: state.createCtrl4,
                                        hintText: "请填写作品名称",
                                        height: 130,
                                        color: Color(0xffB6EDFF),
                                      ),
                                      SizedBox(height: 90.h,),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 15.0.w,
                                              horizontal: 30.w),
                                          child: GestureDetector(
                                            child: PutUpBt(
                                              width: double.infinity,
                                              fontSize: 38,
                                              text: "确认",),
                                            onTap: () {
                                              showToast(
                                                  "上传成功", context: context);
                                              Navigator.pop(context);
                                            },
                                          )
                                      ),
                                      SizedBox(height: 30.h,)
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Obx(() {
                          return Container(
                              width: double.infinity,
                              color: Color(0xffE2F8FF),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 25.h, horizontal: 30.w),
                                child: state.upload.value ? Row(
                                  children: [
                                    Expanded(child: Padding(
                                      padding: EdgeInsets.only(right: 150.0.w),
                                      child: Container(
                                        height: 250.h,
                                        width: 250.h,
                                        decoration: BoxDecoration(
                                          color: Color(0xff94E5FF),
                                          borderRadius: BorderRadius
                                              .circular(10),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                          child: Image.file(
                                            state.imageFile!,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    )),
                                    Text("点击重新上传",
                                      style: TextStyle(color: Colors.grey),),
                                    Icon(Icons.arrow_forward_ios,
                                      color: Colors.grey,)
                                  ],
                                ) : Row(
                                  children: [
                                    Expanded(child: Text("点击上传",
                                      style: TextStyle(color: Colors.grey),)),
                                    Icon(Icons.arrow_forward_ios,
                                      color: Colors.grey,)
                                  ],
                                ),
                              )
                          );
                        }),
                      ),
                      SizedBox(height: 20.w,),
                      CreateList(title: "作品简介"),
                      SizedBox(height: 15.w,),
                      CreateTextField(ctrl: state.createCtrl1,
                        hintText: "请填写20字以内的作品简介",
                        height: 200,),
                      SizedBox(height: 20.w,),
                      CreateList(title: "作品描述"),
                      SizedBox(height: 15.w,),
                      CreateTextField(ctrl: state.createCtrl2,
                        hintText: "请填写作品描述",
                        height: 200,),
                      SizedBox(height: 20.w,),
                      CreateList(title: "作品标签"),
                      SizedBox(height: 15.w,),
                      Obx(() {
                        return GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xffE2F8FF),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          topLeft: Radius.circular(20))
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20.0.w, horizontal: 30.w
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Align(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12.0),
                                            child: Text(
                                              "选择作品标签", style: TextStyle(
                                                fontSize: 34.sp,
                                                fontWeight: FontWeight.w600),),
                                          ),
                                          alignment: Alignment.center,
                                        ),
                                        CreateList(title: "选择标签"),
                                        LabelSelectionModal(),
                                        SizedBox(height: 100.h,),
                                        GestureDetector(
                                          child: PutUpBt(width: double.infinity,
                                            fontSize: 38,
                                            text: "确认",),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                )); // 显示底部弹窗
                              },
                            );
                          },
                          child: state.tag.value ? Row(
                            children: List.generate(
                                state.tagList.value.length, (index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xffE2F8FF),
                                      borderRadius: BorderRadius.circular(90),
                                      border: Border.all(
                                          width: 1, color: Color(0xff22B2E1))
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(state.tagList.value[index]),
                                  ),
                                ),
                              );
                            }),
                          ) : Container(
                            decoration: BoxDecoration(
                              color: Color(0xffE2F8FF),
                              borderRadius: BorderRadius.circular(90),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 40),
                              child: Icon(
                                Icons.add, color: Color(0xff07A8DD), size: 25,),
                            ),
                          ),
                        );
                      }),
                      SizedBox(height: 20.w,),
                      CreateList(title: "作品权益"),
                      SizedBox(height: 15.w,),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return SingleChildScrollView(child:
                              Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffE2F8FF),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20))),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20.w,horizontal: 30.w),
                                  child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12.0),
                                          child: Text(
                                            "选择作品权益", style: TextStyle(
                                              fontSize: 34.sp,
                                              fontWeight: FontWeight.w600),),
                                        ),
                                       RightSelectionModal(),
                                        SizedBox(height: 30.w,),
                                        GestureDetector(
                                          onTap: (){
                                            Navigator.pop(context);
                                          },
                                          child: PutUpBt(
                                            width: double.infinity, fontSize: 38, text: "提交",),
                                        ),
                                  ],
                                  ),
                                ),
                              )); // 显示底部弹窗
                            },
                          );
                        },
                        child: Container(
                            width: double.infinity,
                            height: 90.h,
                            color: Color(0xffE2F8FF),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  Expanded(child: Text("请选择作品权益",
                                    style: TextStyle(color: Colors.grey),)),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.grey,)
                                ],
                              ),
                            )
                        ),
                      ),
                      SizedBox(height: 20.w,),
                      CreateList(title: "铸造数量"),
                      buildRadioButton("1"),
                      buildRadioButton("20"),
                      buildRadioButton("自定义"),
                      SizedBox(height: 20.w,),
                      CreateList(title: "作品价格"),
                      CreateTextField(ctrl: state.createCtrl3,
                        hintText: "请输入作品价格",
                        height: 130,),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 27.sp,
                          ),
                          children: [
                            TextSpan(
                              text: "为保证交易成功，价格不得低于30元",
                            ),
                            TextSpan(
                              text: "*",
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.w,),
                      GestureDetector(
                        onTap: () {
                          showToast("提交成功，等待审核",context: context);
                        },
                        child: PutUpBt(
                          width: double.infinity, fontSize: 38, text: "提交",),
                      ),
                      SizedBox(height: 20.w,),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildRadioButton(String value) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPayment = value;
        });
      },
      child: RadioListTile(
        title: Text(value, style: AppFonts.fontSize28PF,),
        value: value,
        groupValue: selectedPayment,
        activeColor: Color(0xff07A8DD),
        onChanged: (newValue) {
          setState(() {
            selectedPayment = newValue.toString();
          });
        },
      ),
    );
  }
}

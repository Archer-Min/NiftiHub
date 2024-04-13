import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:niftihub/app/theme/app_fonts.dart';
import 'package:niftihub/app/widgets/GradientBackground.dart';
import 'package:niftihub/app/widgets/manager/reason_list_item.dart';
import 'package:niftihub/app/widgets/my_app_bar.dart';
import 'package:niftihub/app/widgets/put_up_bt.dart';
import 'package:niftihub/res/assets_res.dart';

import 'check_logic.dart';

class CheckPage extends StatelessWidget {
  const CheckPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<CheckLogic>();
    final state = Get.find<CheckLogic>().state;

    return Scaffold(
      body: Stack(
        children: [
          GradientBackground2(),
          SingleChildScrollView(
            child: Column(
              children: [
                MyAppBar(title: "乌萨奇"),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 22.0.w,horizontal: 30.w),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffE2F8FF),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15.0.w),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffB5E6FF),
                              borderRadius: BorderRadius.circular(20)
                            ),
                            height: 500.h,
                            child: Padding(
                              padding: EdgeInsets.all(25.0.w),
                              child: Image.asset(AssetsRes.EGSHOW,fit: BoxFit.fill,),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("作品简介：Dan老师的数字画",style: AppFonts.managerDetailInfo,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("作品描述：海边的少女摇曳着裙摆",style: AppFonts.managerDetailInfo,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("作品标签：艺术藏品",style: AppFonts.managerDetailInfo,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("作品权益：数字许可作品",style: AppFonts.managerDetailInfo,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("作品数量：*100",style: AppFonts.managerDetailInfo,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("作品单价：900¥",style: AppFonts.managerDetailInfo,),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0.w,),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15.0.w),
                        child: Image.asset(AssetsRes.ALERT),
                      ),
                      Text("审核不通过",style: AppFonts.appBarTitleText,),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffC9F1FF),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15.0.w),
                      child: GestureDetector(
                        onTap: (){
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Color(0xffE2F8FF),
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                                      child: Text("选择违规原因",style: TextStyle(fontSize: 34.sp,fontWeight: FontWeight.w600),),
                                    ),
                                    ReasonListItem(text: "发布色情/违法信息"),
                                    ReasonListItem(text: "内容存在欺诈行为"),
                                    ReasonListItem(text: "侵犯他人权益"),
                                    ReasonListItem(text: "作品定价不合适"),
                                    ReasonListItem(text: "作品定价不合适"),
                                    ReasonListItem(text: "作品标签选择有误"),
                                    ReasonListItem(text: "以上原因都不是"),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 15.0.w,horizontal: 30.w),
                                      child: PutUpBt(width: double.infinity, fontSize: 38, text: "提交"),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Expanded(child: Text("请选择违规原因",style: TextStyle(color: Color(0xff6B6A6A)),)),
                            Icon(Icons.keyboard_arrow_right),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0.w,vertical: 80.w),
                  child: GestureDetector(
                    onTap: (){
                      showToast("审核通过",context: context);
                    },
                      child: PutUpBt(width: double.infinity,fontSize: 38,text: "通过",)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

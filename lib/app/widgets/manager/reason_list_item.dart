import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:niftihub/app/theme/app_fonts.dart';
import 'package:niftihub/app/widgets/put_up_bt.dart';
import 'package:niftihub/res/assets_res.dart';

class ReasonListItem extends StatelessWidget {
  final String text;
  const ReasonListItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffE2F8FF),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text("违规原因",style: TextStyle(fontSize: 34.sp,fontWeight: FontWeight.w600),),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey, width: 1.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(children: [
                            Padding(
                              padding: EdgeInsets.all(25.0.w),
                              child: Text("该作品不通过审核的原因是？",style: AppFonts.appBarTitleText,),
                            ),
                            Image.asset(AssetsRes.CAT)
                          ],),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                            child: Text("请尽量填写具体的违规原因，以便发布者更好的改进TA的藏品发布内容。",style: TextStyle(color: Colors.grey),),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 20.h),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 15.0.w,horizontal: 30.w),
                              width: double.infinity,
                              height: 300.h,
                              decoration: BoxDecoration(
                                color: Color(0x47ffffff), // 灰色背景
                                border: Border.all(color: Colors.grey, width: 1.0), // 黑色细边框
                                borderRadius: BorderRadius.circular(10.0), // 四角圆角
                              ),
                              child: TextField(
                                decoration: InputDecoration.collapsed(
                                  hintText: '补充描述 🖊', // 输入框提示文本
                                ),
                                minLines: null, // 自动换行
                                maxLines: null, // 自动换行
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0.w,horizontal: 30.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: PutUpBt(width: 300.w, fontSize: 38, text: "跳过")),
                          SizedBox(width: 30.w,),
                          GestureDetector(
                            onTap: (){
                              showToast("违规原因已提交",context: context);
                              Future.delayed(const Duration(seconds: 1), () {
                                Navigator.pop(context);
                              });
                            },
                              child: PutUpBt(width: 300.w, fontSize: 38, text: "确认")),
                        ],
                      ),
                    ),
                    SizedBox(height: 300.h,)
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey, width: 1.0),
            bottom: BorderSide(color: Colors.grey, width: 1.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w,vertical: 15.w),
          child: Row(
            children: [
              Expanded(child: Text(text,style: AppFonts.fontSize35,)),
              Icon(Icons.keyboard_arrow_right)
            ],
          ),
        ),
      ),
    );
  }
}

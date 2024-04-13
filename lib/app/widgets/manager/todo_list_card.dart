import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niftihub/app/theme/app_colors.dart';
import 'package:niftihub/app/theme/app_fonts.dart';

class TodoListCard extends StatelessWidget {
  final String imaPath;
  final String title;
  final String id;
  final VoidCallback? onTab;
  final bool notDone;
  const TodoListCard({Key? key, required this.imaPath, required this.title, required this.id, this.onTab, required this.notDone, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: AppColor.gradientColor3
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                height: 100.h,
                width: 100.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100)
                ),
                child: Image.asset(imaPath,fit: BoxFit.fill,),
              ),
              SizedBox(width: 15.w,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text(title,style: AppFonts.myCollectionTitle_s,overflow: TextOverflow.ellipsis,)),
                        notDone? Text("未审核",style: TextStyle(
                          color: Colors.red,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w600
                        )):Text("已审核",style: TextStyle(
                            color: Colors.green,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w600
                        ))
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Text("Token ID: $id",style: AppFonts.myCollectionTitle_noBold,overflow: TextOverflow.ellipsis,),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(Icons.arrow_forward_ios),
              )
            ],
          ),
        ),
      ),
    );
  }
}

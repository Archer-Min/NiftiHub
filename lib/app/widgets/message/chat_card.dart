import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatCard extends StatelessWidget {
  final String imaPath;
  final String name;
  final String message;
  final String time;

  const ChatCard({Key? key, required this.imaPath, required this.name, required this.message, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffF5FDFF),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0xdfd0cccc),
            blurRadius: 2,
            spreadRadius: 1,
            offset: Offset(0, 2),
          ),
        ]
      ),
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
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name),
              Row(
                children: [
                  Expanded(child: Text(message)),
                  Text(time)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

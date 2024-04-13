import 'package:flutter/material.dart';
import 'package:niftihub/app/theme/color_config.dart';
///渐变背景
const LinearGradient gradientBgColor = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color.fromARGB(255, 179, 234, 253),
    Color.fromARGB(255, 217, 222, 242),
    Color.fromARGB(255, 242, 214, 235)
  ],
);

const LinearGradient gradientBgColor2 = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xffB6EDFF),
    Color(0xffFFFFFF),
    Color(0xffFFFFFF),
    Color(0xffFFFFFF),
    Color(0xffFFF1FA),
  ],
);

const LinearGradient loginBtBg = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xffFCC9FC),
    Color(0xff85E0FE),
  ],
);

const LinearGradient gradientBtColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xffFBCEDF),
    Color(0xffEBFAFF),
  ],
);
//ShowCardDark
const LinearGradient showCardGradientDark = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xff111239),
    Color(0xff5C5AA9),
    Color(0xff8E4490)
  ],
);

const LinearGradient gradientColor2 = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xcbbf9ec0),
    Color(0xcd70bde4),
    Color(0xcd4ecbf3)
  ],
);

const LinearGradient gradientColor3 = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xffFFC7CC),
    Color(0xffB6EDFF),
  ],
);

class AppColor{
  static const Color rootBg = Color.fromARGB(255, 217, 222, 242);
  static const Color labelColorSelected = Color(0xff0E80BB);
  static const Color labelColorUnSe = Color(0xff475569);
  static const Color primaryColor = Color(0xff94E5FF);
  //myPage
  static const Color buttonBorder = Color(0xff07A8DD);
  static const Color buttonFill = Color(0xffEBFAFF);
  static const Color myIconColor = Color(0xff07A8DD);
  static const Color pink_linear = Color(0xffF6D8EC);
  static const Color blue_linear = Color(0xffB6EDFF);
  //homePage
  static const Color searchBarBgColor = Color(0x6effffff);
  static const Color searchBtColor = Color(0xb704c1ff);
  static const Color selectedIndexColor = Color(0xff0E80BB);
  static const Color priceListTagBg = Color(0x476285b8);
  //priceListPage
  static const LinearGradient gradientColor3 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xffF4ECF8),
      Color(0xffDFF7FF),
    ],
  );
  static const Color lightBlue = Color(0xffE5F4F9);
  
  //collectionDetailPage
  static const Color commentInputBg = Color(0x5494e5ff);
  static const Color bottomBar = Color(0xffdadbed);
  static const LinearGradient gradientPink = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xffFFFFFF),
      Color(0xffFBCEDF),
    ],
  );

  static const LinearGradient gradientBuyBt = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xffF6D8EC),
      Color(0xff3AB8FA),
    ],
  );
  
  //payConfirm
  static const payWayBg = Color(0xffDFF7FF);

  static const shadow = BoxShadow(
    color: Color(0xdfd0cccc),
    blurRadius: 2,
    spreadRadius: 1,
    offset: Offset(0, 2),
  );

  //展柜深浅模式
  static const Color primaryDark = Color(0xff2B3755);

  static const LinearGradient gradientBgLight = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xff94E5FF),
      Color(0xffFFFFFF),
      Color(0xffFFF1FA),
    ],
  );

  static const LinearGradient gradientBgDark = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xff3F5E9A),
      Color(0xffEEC9FF),
    ],
  );

  static get gradientBg{
    return ColorConfig.getGradientBg(ColorConfig.gradient_bg_key);
  }

}
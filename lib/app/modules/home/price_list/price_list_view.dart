import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:niftihub/app/routes/app_routes.dart';
import 'package:niftihub/app/theme/app_colors.dart';
import 'package:niftihub/app/theme/app_fonts.dart';
import 'package:niftihub/app/widgets/GradientBackground.dart';
import 'package:niftihub/app/widgets/gradient_bt_small.dart';
import 'package:niftihub/app/widgets/home/price_list_card.dart';
import 'package:niftihub/app/widgets/my_app_bar.dart';
import 'package:niftihub/res/assets_res.dart';

import 'price_list_logic.dart';

class PriceListPage extends StatelessWidget {
  const PriceListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<PriceListLogic>();
    final state = Get.find<PriceListLogic>().state;

    List<String> ids = [
      "bcvhsgvabxhabsjx273261gvwvxh",
      "jnlv8734hjkbasdr1234kjhsdfae",
      "61gvwvxh1239sdfjnlv8gsgssgss",
      "734hjkkjljlkj9099saffnaknnka",
      "90rjkqfjowiokklkwwdaklfn9009",
      "jlakfhk89qhwuhkbrgbkqbfk890w",
      "halnjjjkash9qhwhnnm800jew9jw",
      "jdaklhsnjaa112ndakl389ka9ndq"
    ];
    List<String> prices = [
      "900","890","788","785","745","630","580","598"
    ];
    return Scaffold(
      body: Stack(
        children: [
          GradientBackground(),
          Image.asset(AssetsRes.COLLECTION_EXAMPLE_SMALL, width: double.infinity, fit: BoxFit.fill,),
          MyAppBar(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 1100.h,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(23.0),
                  topRight: Radius.circular(23.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(8, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: PriceListCard(
                          imaPath: AssetsRes.COLLECTION_EG_AVATAR,
                          title: "初夏siki",
                          id: ids[index],
                          price: prices[index],
                          onTab: (){
                            Get.toNamed(AppRoutes.collectionDetail);
                          },
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
          SafeArea(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 8),
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    height: 200.h,
                    width: 200.h,
                    child: Image.asset(AssetsRes.COLLECTION_EG_AVATAR,fit: BoxFit.fill,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("初夏siki", style: AppFonts.myCollectionTitle,),
                  ),
                  Container(
                    width: 600.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.priceListTagBg
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              GradientBt(text:"总量"),
                              Text("10000份",style: AppFonts.whiteBoldText,)
                            ],
                          ),
                          Column(
                            children: [
                              GradientBt(text: "销量"),
                              Text("10000件",style: AppFonts.whiteBoldText,)
                            ],
                          ),
                          Column(
                            children: [
                              GradientBt(text: "定价"),
                              Text("¥900",style: AppFonts.whiteBoldText,)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}

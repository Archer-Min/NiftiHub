import 'package:niftihub/app/modules/create/create_binding.dart';
import 'package:niftihub/app/modules/create/create_view.dart';
import 'package:niftihub/app/modules/entry/login/login_binding.dart';
import 'package:niftihub/app/modules/entry/login/login_view.dart';
import 'package:niftihub/app/modules/entry/splash.dart';
import 'package:niftihub/app/modules/home/buy_confirm/buy_confirm_binding.dart';
import 'package:niftihub/app/modules/home/buy_confirm/buy_confirm_view.dart';
import 'package:niftihub/app/modules/home/collection_detail/collection_detail_binding.dart';
import 'package:niftihub/app/modules/home/collection_detail/collection_detail_view.dart';
import 'package:niftihub/app/modules/home/home_binding.dart';
import 'package:niftihub/app/modules/home/home_view.dart';
import 'package:niftihub/app/modules/home/pay_confirm/pay_confirm_binding.dart';
import 'package:niftihub/app/modules/home/pay_confirm/pay_confirm_view.dart';
import 'package:niftihub/app/modules/home/price_list/price_list_binding.dart';
import 'package:niftihub/app/modules/home/price_list/price_list_view.dart';
import 'package:niftihub/app/modules/manager/entry/login/login_binding.dart';
import 'package:niftihub/app/modules/manager/entry/login/login_view.dart';
import 'package:niftihub/app/modules/manager/managerHome/check/check_binding.dart';
import 'package:niftihub/app/modules/manager/managerHome/check/check_view.dart';
import 'package:niftihub/app/modules/my/my_settings/my_settings_binding.dart';
import 'package:niftihub/app/modules/my/my_settings/my_settings_view.dart';
import 'package:niftihub/app/modules/my/my_settings/private_setting/private_setting_binding.dart';
import 'package:niftihub/app/modules/my/my_settings/private_setting/private_setting_view.dart';
import 'package:niftihub/app/modules/root/root_binding.dart';
import 'package:niftihub/app/modules/root/root_view.dart';
import 'package:niftihub/app/modules/show/show_detail/show3_d/show3_d_view.dart';
import 'package:niftihub/app/modules/show/show_detail/show_detail_binding.dart';
import 'package:niftihub/app/modules/show/show_detail/show_detail_view.dart';
import 'package:niftihub/app/routes/app_routes.dart';
import 'package:get/get.dart';

abstract class AppPages{
  static final pages = [
    GetPage(name: AppRoutes.splash, page: () => const SplashPage()),
    GetPage(name: AppRoutes.root, page: () => const RootPage(),binding: RootBinding()),
    GetPage(name: AppRoutes.login, page:() => const LoginPage(), binding: LoginBinding()),

    GetPage(name: AppRoutes.managerLogin, page: () => const ManagerLoginPage(), binding: ManagerLoginBinding()),
    GetPage(name: AppRoutes.check, page: () => const CheckPage(), binding: CheckBinding()),

    GetPage(name: AppRoutes.home, page:() => const HomePage(), binding: HomeBinding()),
    GetPage(name: AppRoutes.priceList, page:() => const PriceListPage(), binding: PriceListBinding()),
    GetPage(name: AppRoutes.collectionDetail, page: () => const CollectionDetailPage(),binding: CollectionDetailBinding()),
    GetPage(name: AppRoutes.buyConfirm, page: () => const BuyConfirmPage(),binding: BuyConfirmBinding()),
    GetPage(name: AppRoutes.payConfirm, page: () => const PayConfirmPage(),binding: PayConfirmBinding()),
    GetPage(name: AppRoutes.settings, page: () => const MySettingsPage(),binding: MySettingsBinding()),
    GetPage(name: AppRoutes.privateSetting, page: () => const PrivateSettingPage(),binding: PrivateSettingBinding()),
    GetPage(name: AppRoutes.create, page: () => const CreatePage(),binding:  CreateBinding()),
    GetPage(name: AppRoutes.showDetail, page: () => const ShowDetailPage(),binding: ShowDetailBinding()),
    GetPage(name: AppRoutes.show3D, page: () => const Show3DPage(),binding: ShowDetailBinding()),
  ];
}
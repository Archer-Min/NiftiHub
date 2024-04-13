import 'package:get/get.dart';

abstract class AppRoutes{
  static const splash = "/";
  static const root = "/root";
  static const login = "/login";
  static const register = "/register";
  static const managerLogin = "/managerLogin";
  static const home = "/home";
  static const priceList = "/home/priceList";
  static const collectionDetail = "/home/priceList/collectionDetail";
  static const buyConfirm = "/buyConfirm";
  static const payConfirm = "/payConfirm";
  static const settings = "/my/settings";
  static const privateSetting = "/my/settings/privateSetting";
  static const create = "/create";
  static const showDetail = "/show/showDetail";
  static const show3D = "/show/showDetail/show3D";
  static const check = "/manager/check";
}
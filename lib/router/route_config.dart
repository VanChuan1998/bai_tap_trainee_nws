import 'package:bai_tap_trainee/ui/pages/chap_3/chap_3_page.dart';
import 'package:bai_tap_trainee/ui/pages/chap_4/chap_4_page.dart';
import 'package:bai_tap_trainee/ui/pages/sign_in/sign_in_page.dart';
import 'package:get/get.dart';

import '../ui/pages/main/main_page.dart';
import '../ui/pages/splash/splash_page.dart';

class RouteConfig {
  RouteConfig._();

  ///main page
  static const String splash = "/splash";
  static const String main = "/main";
  static const String signIn = "/signIn";
  static const String chap3 = "/chap3";
  static const String chap4 = "/chap4";

  ///Alias ​​mapping page
  static final List<GetPage> getPages = [
    GetPage(name: splash, page: () => const SplashPage()),
    GetPage(name: main, page: () => const MainPage()),
    GetPage(name: signIn, page: () => const SignInPage()),
    GetPage(name: chap3, page: () => const Chap3Page()),
    GetPage(name: chap4, page: () => const Chap4Page()),
  ];
}

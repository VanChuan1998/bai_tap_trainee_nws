import 'package:bai_tap_trainee/ui/pages/chap_3/chap_3_page.dart';
import 'package:bai_tap_trainee/ui/pages/chap_4/chap_4_page.dart';
import 'package:bai_tap_trainee/ui/pages/chap_4/youtube_player/youtube_player_page.dart';
import 'package:bai_tap_trainee/ui/pages/chap_5/chap_5_detail/chap_5_detail_page.dart';
import 'package:bai_tap_trainee/ui/pages/chap_5/chap_5_page.dart';
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
  static const String chap5 = "/chap5";
  static const String youtubePlayerPage = "/youtubePlayerPage";
  static const String chap5Detail = "/chap5Detail";

  ///Alias ​​mapping page
  static final List<GetPage> getPages = [
    GetPage(name: splash, page: () => const SplashPage()),
    GetPage(name: main, page: () => const MainPage()),
    GetPage(name: signIn, page: () => const SignInPage()),
    GetPage(name: chap3, page: () => const Chap3Page()),
    GetPage(name: chap4, page: () => const Chap4Page()),
    GetPage(name: chap5, page: () => const Chap5Page()),
    GetPage(name: youtubePlayerPage, page: () => const YoutubePlayerPage()),
    GetPage(
        name: chap5Detail,
        page: () => Chap5DetailPage(
              arguments: Get.arguments,
            )),
  ];
}

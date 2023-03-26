import 'package:bai_tap_trainee/common/app_colors.dart';
import 'package:bai_tap_trainee/common/app_shadows.dart';
import 'package:bai_tap_trainee/common/app_vectors.dart';
import 'package:bai_tap_trainee/ui/pages/chap_5/chap_5_home/chap_5_home_page.dart';
import 'package:bai_tap_trainee/ui/pages/chap_5/widgets/chap_5_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'chap_5_cubit.dart';

class Chap5Arguments {
  String param;

  Chap5Arguments({
    required this.param,
  });
}

class Chap5Page extends StatelessWidget {
  const Chap5Page({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return Chap5Cubit();
      },
      child: const Chap5ChildPage(),
    );
  }
}

class Chap5ChildPage extends StatefulWidget {
  const Chap5ChildPage({Key? key}) : super(key: key);

  @override
  State<Chap5ChildPage> createState() => _Chap5ChildPageState();
}

class _Chap5ChildPageState extends State<Chap5ChildPage> {
  ///PageView page
  late List<Widget> pageList;
  late PersistentTabController pageController;

  final tabs = [
    Chap5Tab.home,
    Chap5Tab.favorite,
    Chap5Tab.ticket,
    Chap5Tab.account,
    Chap5Tab.shuffle,
  ];

  late final Chap5Cubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of(context);
    pageList = [
      const Chap5HomePage(),
      Container(color: Colors.red),
      Container(color: Colors.green),
      Container(color: Colors.blue),
      Container(color: Colors.yellow),
    ];
    //Page controller
    pageController = PersistentTabController(initialIndex: 0);
    _cubit.loadInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _buildPageView(context),
    );
  }

  Widget _buildPageView(context) {
    return PersistentTabView(
      context,
      controller: pageController,
      items: _buildBottomNavigationBar(),
      screens: pageList,
      navBarStyle: NavBarStyle.style12,
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: const NavBarDecoration(
        gradient: AppColors.bottomNavigationBarGradient30,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
    );
  }

  List<PersistentBottomNavBarItem> _buildBottomNavigationBar() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          AppVectors.icHome,
          height: 34,
          width: 34,
        ),
        title: 'Home',
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white.withOpacity(0.75),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          AppVectors.icFavorite,
          height: 34,
          width: 34,
        ),
        title: 'Favorite',
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white.withOpacity(0.75),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          AppVectors.icTicket,
          height: 34,
          width: 34,
        ),
        title: 'Ticket',
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white.withOpacity(0.75),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          AppVectors.icAccount,
          height: 34,
          width: 34,
        ),
        title: 'Account',
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white.withOpacity(0.75),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          AppVectors.icShuffle,
          height: 34,
          width: 34,
        ),
        title: 'Shuffle',
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white.withOpacity(0.75),
      ),
    ];
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }
}

import 'package:bai_tap_trainee/common/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

enum Chap5Tab {
  home,
  favorite,
  ticket,
  account,
  shuffle,
}

extension MainTabExtension on Chap5Tab {
  Widget get page {
    switch (this) {
      case Chap5Tab.home:
      // return HomeTabPage();
      // return Container(color: Colors.red,);
      case Chap5Tab.favorite:
      // return DiscoverTabPage();
      case Chap5Tab.ticket:
      // return TvShowTabPage();
      case Chap5Tab.account:
      // return WatchlistTabPage();
      case Chap5Tab.shuffle:
      // return ProfileTabPage();
    }
    return Container();
  }

  PersistentBottomNavBarItem get tab {
    switch (this) {
      case Chap5Tab.home:
        return PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            AppVectors.icHome,
            height: 34,
            width: 34,
          ),
          title: 'Home',
        );
      case Chap5Tab.favorite:
        return PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            AppVectors.icFavorite,
            height: 34,
            width: 34,
          ),
          title: 'Favorite',
        );
      case Chap5Tab.ticket:
        return PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            AppVectors.icTicket,
            height: 34,
            width: 34,
          ),
          title: 'Ticket',
        );
      case Chap5Tab.account:
        return PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            AppVectors.icAccount,
            height: 34,
            width: 34,
          ),
          title: 'Account',
        );
      case Chap5Tab.shuffle:
        return PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            AppVectors.icShuffle,
            height: 34,
            width: 34,
          ),
          title: 'Shuffle',
        );
    }
  }

  String get title {
    switch (this) {
      case Chap5Tab.home:
        return 'Home';
      case Chap5Tab.favorite:
        return 'Favorite';
      case Chap5Tab.ticket:
        return 'Tickets';
      case Chap5Tab.account:
        return 'Account';
      case Chap5Tab.shuffle:
        return 'Shuffle';
    }
  }
}

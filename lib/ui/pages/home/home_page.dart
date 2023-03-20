import 'package:bai_tap_trainee/router/route_config.dart';
import 'package:bai_tap_trainee/ui/widgets/buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:bai_tap_trainee/common/app_dimens.dart';
import 'package:bai_tap_trainee/models/enums/movie_category.dart';
import 'package:bai_tap_trainee/ui/widgets/tabs/app_tab_bar.dart';
import 'package:get/get.dart';

import 'movies/movies_page.dart';
import 'widgets/home_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  late TabController _tapBarController;

  @override
  void initState() {
    super.initState();
    _tapBarController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: HomeAppBar(
          //Todo
          // avatarUrl: authService.user.value?.avatarUrl ?? "",
          ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              AppButton(
                title: "Bài tập chương 3",
                onPressed: () {
                  Get.toNamed(RouteConfig.chap3);
                },
              ),
              const SizedBox(height: 8),
              AppButton(
                title: "Bài tập chương 4",
                onPressed: () {
                  Get.toNamed(RouteConfig.chap3);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrendingMovies() {
    return const MoviesPage(section: MovieCategory.trending);
  }

  Widget _buildUpcomingMovies() {
    return const MoviesPage(section: MovieCategory.upcoming);
  }
}

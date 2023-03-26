import 'package:bai_tap_trainee/common/app_colors.dart';
import 'package:bai_tap_trainee/common/app_text_styles.dart';
import 'package:bai_tap_trainee/common/app_vectors.dart';
import 'package:bai_tap_trainee/models/enums/load_status.dart';
import 'package:bai_tap_trainee/ui/pages/chap_5/chap_5_home/widgets/carousel_slider_backdrop_path_widget.dart';
import 'package:bai_tap_trainee/ui/pages/chap_5/chap_5_home/widgets/carousel_slider_poster_path_widget.dart';
import 'package:bai_tap_trainee/ui/pages/chap_5/chap_5_home/widgets/menu_item_widget.dart';
import 'package:bai_tap_trainee/ui/widgets/app_circular_progress_indicator.dart';
import 'package:bai_tap_trainee/ui/widgets/input/app_search_input.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'chap_5_home_cubit.dart';

class Chap5HomeArguments {
  String param;

  Chap5HomeArguments({
    required this.param,
  });
}

class Chap5HomePage extends StatelessWidget {
  const Chap5HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return Chap5HomeCubit();
      },
      child: const Chap5HomeChildPage(),
    );
  }
}

class Chap5HomeChildPage extends StatefulWidget {
  const Chap5HomeChildPage({Key? key}) : super(key: key);

  @override
  State<Chap5HomeChildPage> createState() => _Chap5HomeChildPageState();
}

class _Chap5HomeChildPageState extends State<Chap5HomeChildPage> {
  late final Chap5HomeCubit _cubit;
  final TextEditingController _searchController = TextEditingController();
  final CarouselController carouselBackdropController = CarouselController();
  final CarouselController carouselPosterController = CarouselController();

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of(context);
    _cubit.loadInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.backgroundGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: _buildBodyWidget(),
        ),
      ),
    );
  }

  Widget _buildBodyWidget() {
    return BlocBuilder<Chap5HomeCubit, Chap5HomeState>(
      bloc: _cubit,
      buildWhen: (previous, current) =>
          previous.loadDataStatus != current.loadDataStatus ||
          previous.carouselPosterIndex != current.carouselPosterIndex ||
          previous.carouselBackdropIndex != current.carouselBackdropIndex,
      builder: (context, state) {
        switch (state.loadDataStatus) {
          case LoadStatus.loading:
            return const AppCircularProgressIndicator();
          default:
            return RefreshIndicator(
              onRefresh: () async {
                _cubit.loadInitialData();
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    _buildTitleAndNotificationWidget(),
                    const SizedBox(height: 20),
                    _buildSearchTextFieldWidget(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Text(
                        "Most Popular",
                        style: AppTextStyle.whiteS18Bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    CarouselSliderBackdropPathWidget(
                      controller: carouselBackdropController,
                      movies: state.movies,
                      currentPage: state.carouselBackdropIndex,
                      onPageChange: (index, reason) {
                        _cubit.onChangeBackdrop(index);
                      },
                    ),
                    const SizedBox(height: 20),
                    _buildMenuItemWidget(),
                    const SizedBox(height: 35),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Text(
                        "Upcoming releases",
                        style: AppTextStyle.whiteS18Bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    CarouselSliderPosterPathWidget(
                      movies: state.movies,
                      controller: carouselPosterController,
                      currentPage: state.carouselPosterIndex,
                      onPageChange: (index, reason) {
                        _cubit.onChangePoster(index);
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
        }
      },
    );
  }

  Widget _buildTitleAndNotificationWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 64,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Hello, ",
                  style: AppTextStyle.whiteS18,
                ),
                TextSpan(
                  text: "Chuan!",
                  style: AppTextStyle.whiteS18Bold,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              //todo
              Get.back();
            },
            child: SvgPicture.asset(AppVectors.icNotification),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchTextFieldWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: AppSearchInput(
        radius: 12,
        textEditingController: _searchController,
        hintText: "Search",
        hintStyle: AppTextStyle.whiteS18.copyWith(
          color: Colors.white.withOpacity(0.5),
        ),
        prefixIcon: GestureDetector(
          onTap: () {
            //todo
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
            child: SvgPicture.asset(
              AppVectors.icSearch,
              height: 22,
              width: 22,
            ),
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            //todo
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border(
              left: BorderSide(
                color: Colors.white.withOpacity(0.2),
              ),
            )),
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
            child: SvgPicture.asset(AppVectors.icSearchMic),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItemWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            MenuItemWidget(
              icon: AppVectors.icGenres,
              title: "Genres",
              onPress: () {
                //todo
              },
            ),
            const SizedBox(width: 18),
            MenuItemWidget(
              icon: AppVectors.icTvSeries,
              title: "TV Series",
              onPress: () {
                //todo
              },
            ),
            const SizedBox(width: 18),
            MenuItemWidget(
              icon: AppVectors.icMovie,
              title: "Movies ",
              onPress: () {
                //todo
              },
            ),
            const SizedBox(width: 18),
            MenuItemWidget(
              icon: AppVectors.icInTheatre,
              title: "In Theatre",
              onPress: () {
                //todo
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }
}

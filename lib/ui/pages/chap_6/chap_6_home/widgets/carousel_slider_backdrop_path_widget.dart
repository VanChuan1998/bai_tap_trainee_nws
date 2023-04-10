import 'package:bai_tap_trainee/common/app_colors.dart';
import 'package:bai_tap_trainee/models/entities/movie_entity.dart';
import 'package:bai_tap_trainee/router/route_config.dart';
import 'package:bai_tap_trainee/ui/pages/chap_5/chap_5_detail/chap_5_detail_page.dart';
import 'package:bai_tap_trainee/ui/widgets/images/app_cache_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CarouselSliderBackdropPathWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final CarouselController controller;
  final Function(int, CarouselPageChangedReason)? onPageChange;
  final int currentPage;

  const CarouselSliderBackdropPathWidget({
    Key? key,
    required this.movies,
    required this.controller,
    this.onPageChange,
    required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = movies
        .map((item) => GestureDetector(
              onTap: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: Chap5DetailPage(arguments: Chap5DetailArguments(movie: item)),
                  withNavBar: true, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );

              },
              child: Stack(
                children: <Widget>[
                  AppCacheImage(
                    url: item.posterUrl ?? '',
                    fit: BoxFit.cover,
                    borderRadius: 16,
                    height: 141,
                    width: 1000,
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        item.title ?? '',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ))
        .toList();
    return Column(
      children: [
        CarouselSlider(
            carouselController: controller,
            items: imageSliders,
            options: CarouselOptions(
              height: 141,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 1000),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
              onPageChanged: onPageChange,
            )),
        const SizedBox(height: 18),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: movies.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => controller.animateToPage(entry.key),
                child: Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: currentPage == entry.key
                        ? AppColors.bottomNavigationBarGradient100
                        : AppColors.bottomNavigationBarGradient30,
                  ),
                ),
              );
            }).toList()),
      ],
    );
  }
}

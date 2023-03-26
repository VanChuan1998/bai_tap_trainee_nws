import 'package:bai_tap_trainee/common/app_colors.dart';
import 'package:bai_tap_trainee/common/app_shadows.dart';
import 'package:bai_tap_trainee/common/app_text_styles.dart';
import 'package:bai_tap_trainee/common/app_vectors.dart';
import 'package:bai_tap_trainee/models/entities/movie_entity.dart';
import 'package:bai_tap_trainee/models/enums/load_status.dart';
import 'package:bai_tap_trainee/ui/pages/chap_5/chap_5_detail/widgets/cast_widget.dart';
import 'package:bai_tap_trainee/ui/widgets/app_circular_progress_indicator.dart';
import 'package:bai_tap_trainee/ui/widgets/images/app_cache_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'chap_5_detail_cubit.dart';

class Chap5DetailArguments {
  final MovieEntity movie;

  Chap5DetailArguments({
    required this.movie,
  });
}

class Chap5DetailPage extends StatelessWidget {
  final Chap5DetailArguments arguments;

  const Chap5DetailPage({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return Chap5DetailCubit();
      },
      child: Chap5DetailChildPage(
        arguments: arguments,
      ),
    );
  }
}

class Chap5DetailChildPage extends StatefulWidget {
  final Chap5DetailArguments arguments;

  const Chap5DetailChildPage({Key? key, required this.arguments})
      : super(key: key);

  @override
  State<Chap5DetailChildPage> createState() => _Chap5DetailChildPageState();
}

class _Chap5DetailChildPageState extends State<Chap5DetailChildPage> {
  late final Chap5DetailCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of(context);
    _cubit.loadInitialData(movie: widget.arguments.movie);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _buildBodyWidget(),
    );
  }

  Widget _buildBodyWidget() {
    return BlocBuilder<Chap5DetailCubit, Chap5DetailState>(
      bloc: _cubit,
      buildWhen: (previous, current) =>
          previous.loadDataStatus != current.loadDataStatus,
      builder: (context, state) {
        switch (state.loadDataStatus) {
          case LoadStatus.loading:
            return const AppCircularProgressIndicator();
          default:
            return Stack(
              children: [
                SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: AppCacheImage(
                    url: state.movie?.posterPath ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 40,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop((route) {});
                    },
                    child: SvgPicture.asset(AppVectors.icBack),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: const BoxDecoration(
                      gradient: AppColors.backgroundGradient,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(50)),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 12),
                          Container(
                            height: 2,
                            width: 30,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            state.movie?.title ?? '',
                            style: AppTextStyle.whiteS30Bold,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 28),
                          Row(
                            children: [
                              _buildTag(title: "Action"),
                              const SizedBox(width: 10),
                              _buildTag(title: "18+"),
                              const SizedBox(width: 10),
                              _buildVoteAverage(
                                  title: state.movie?.voteAverage.toString() ??
                                      '0'),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  //todo
                                },
                                child: SvgPicture.asset(
                                  AppVectors.icShare,
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  //todo
                                },
                                child: SvgPicture.asset(
                                  AppVectors.icFavorite,
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            state.movie?.overview ?? '',
                            style: AppTextStyle.whiteS15W500,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Cast",
                                style: AppTextStyle.whiteS18Bold,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    //todo
                                  },
                                  child: Text(
                                    "See All",
                                    style: AppTextStyle.whiteS12,
                                  )),
                            ],
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 100,
                            child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 7,
                              itemBuilder: (context, index) {
                                return const CastWidget();
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(width: 20);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
        }
      },
    );
  }

  Widget _buildTag({required String title}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: AppColors.gradientA6A1E0A1F3FE30,
        boxShadow: AppShadow.boxShadow,
      ),
      child: Text(
        title,
        style: AppTextStyle.whiteS12Bold,
      ),
    );
  }

  Widget _buildVoteAverage({required String title}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.colorsF5C518,
        boxShadow: AppShadow.boxShadow,
      ),
      child: Text(
        'IMDb $title',
        style: AppTextStyle.blackS12Bold,
      ),
    );
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }
}

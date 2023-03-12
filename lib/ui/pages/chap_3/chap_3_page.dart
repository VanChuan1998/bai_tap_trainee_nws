import 'package:bai_tap_trainee/app.dart';
import 'package:bai_tap_trainee/blocs/setting/app_setting_cubit.dart';
import 'package:bai_tap_trainee/models/enums/load_status.dart';
import 'package:bai_tap_trainee/ui/pages/chap_3/widgets/banner_widget.dart';
import 'package:bai_tap_trainee/ui/pages/chap_3/widgets/salad_item_card_widget.dart';
import 'package:bai_tap_trainee/ui/widgets/app_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chap_3_cubit.dart';

class Chap3Arguments {
  String param;

  Chap3Arguments({
    required this.param,
  });
}

class Chap3Page extends StatelessWidget {
  const Chap3Page({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return Chap3Cubit();
      },
      child: const Chap3ChildPage(),
    );
  }
}

class Chap3ChildPage extends StatefulWidget {
  const Chap3ChildPage({Key? key}) : super(key: key);

  @override
  State<Chap3ChildPage> createState() => _Chap3ChildPageState();
}

class _Chap3ChildPageState extends State<Chap3ChildPage> {
  late final Chap3Cubit _cubit;
  late AppSettingCubit _appSettingCubit;
  late final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<Chap3Cubit>(context);
    _appSettingCubit = BlocProvider.of<AppSettingCubit>(context);
    _scrollController.addListener(() {
      _onEndScroll();
    });

    _cubit.loadInitialData();
  }

  void _onEndScroll() {
    final maxScrollSend = _scrollController.position.maxScrollExtent;
    final currentScrollSend = _scrollController.position.pixels;
    if (maxScrollSend - currentScrollSend <= 100) {
      _cubit.loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Salad',
          style: themeData.textTheme.bodyLarge,
        ),
        actions: [
          _buildThemeSection(),
        ],
      ),
      backgroundColor: themeData.scaffoldBackgroundColor,
      body: SafeArea(
        child: _buildBodyWidget(),
      ),
    );
  }

  Widget _buildBodyWidget() {
    ThemeData themeData = Theme.of(context);
    return BlocBuilder<Chap3Cubit, Chap3State>(
      bloc: _cubit,
      buildWhen: (prev, curr) => prev.loadDataStatus != curr.loadDataStatus,
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
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const BannerWidget(),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                'Sort by',
                                style: themeData.textTheme.headlineSmall,
                              ),
                              const Spacer(),
                              Text(
                                'Most popular',
                                style: themeData.textTheme.bodySmall,
                              ),
                              Icon(
                                Icons.arrow_downward,
                                color: themeData.iconTheme.color,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          _buildGridviewWidget(state),
                        ],
                      ),
                    ),
                    state.currentPage < state.totalPage
                        ? const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: AppCircularProgressIndicator(),
                        )
                        : const SizedBox(),
                  ],
                ),
              ),
            );
        }
      },
    );
  }

  Widget _buildThemeSection() {
    ThemeData themeData = Theme.of(context);
    return BlocBuilder<AppSettingCubit, AppSettingState>(
      bloc: _appSettingCubit,
      buildWhen: (prev, current) {
        return prev.themeMode != current.themeMode;
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {
              switch (state.themeMode) {
                case ThemeMode.light:
                  _appSettingCubit.changeThemeMode(themeMode: ThemeMode.dark);
                  break;
                case ThemeMode.dark:
                  _appSettingCubit.changeThemeMode(themeMode: ThemeMode.light);
                  break;
                default:
                  notifier.value = ThemeMode.light;
                  break;
              }
            },
            child: Icon(
              Icons.search,
              size: 30,
              color: themeData.iconTheme.color,
            ),
          ),
        );
      },
    );
  }

  Widget _buildGridviewWidget(Chap3State state) {
    final size = MediaQuery.of(context).size;

    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: state.saladList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisExtent: 200,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          final saladItem = state.saladList[index];
          return SaladItemCard(
              width: (size.width - 2 * 20 - 15) / 2,
              salad: saladItem,
              onBookMarkChanged: () {
                _cubit.onBookMarkChange(saladItem);
              });
        });
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }
}

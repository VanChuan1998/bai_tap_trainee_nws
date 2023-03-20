import 'package:bai_tap_trainee/common/app_images.dart';
import 'package:bai_tap_trainee/common/app_vector.dart';
import 'package:bai_tap_trainee/router/route_config.dart';
import 'package:bai_tap_trainee/ui/widgets/buttons/app_button.dart';
import 'package:bai_tap_trainee/ui/widgets/images/app_circle_avatar.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import 'chap_4_cubit.dart';
import 'widgets/item_widget.dart';
import 'youtube_player/youtube_player_page.dart';

class Chap4Arguments {
  String param;

  Chap4Arguments({
    required this.param,
  });
}

class Chap4Page extends StatelessWidget {
  const Chap4Page({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return Chap4Cubit();
      },
      child: const Chap4ChildPage(),
    );
  }
}

class Chap4ChildPage extends StatefulWidget {
  const Chap4ChildPage({Key? key}) : super(key: key);

  @override
  State<Chap4ChildPage> createState() => _Chap4ChildPageState();
}

class _Chap4ChildPageState extends State<Chap4ChildPage> {
  late final Chap4Cubit _cubit;
  late VideoPlayerController _videoController;
  late YoutubePlayerController _youtubeController;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  final double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of(context);
    _cubit.loadInitialData();
    _videoController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        _videoController.play();
        setState(() {});
      });
    _youtubeController = YoutubePlayerController(
      initialVideoId: 'YBRkVCRP1Gw',
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_youtubeController.value.isFullScreen) {
      setState(() {
        _playerState = _youtubeController.value.playerState;
        _videoMetaData = _youtubeController.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _youtubeController.pause();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chap 4",
          style: themeData.textTheme.bodyLarge,
        ),
      ),
      body: SafeArea(
        child: _buildBodyWidget(),
      ),
    );
  }

  Widget _buildBodyWidget() {
    return BlocBuilder<Chap4Cubit, Chap4State>(
      buildWhen: (prev, curr) => prev.isShowSvg != curr.isShowSvg,
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 8,
                ),
                child: Column(
                  children: [
                    ItemWidget(
                      imgPicture: AppImages.imgFaq,
                      svgPicture: AppVectors.icFaq,
                      title: "FAQ",
                      isShowSvg: state.isShowSvg,
                    ),
                    const SizedBox(height: 8),
                    ItemWidget(
                      imgPicture: AppImages.imgGroup,
                      svgPicture: AppVectors.icContact,
                      title: "Contact Us",
                      isShowSvg: state.isShowSvg,
                    ),
                    const SizedBox(height: 8),
                    ItemWidget(
                      imgPicture: AppImages.imgTerms,
                      svgPicture: AppVectors.icTerms,
                      title: "Term & Conditions",
                      isShowSvg: state.isShowSvg,
                    )
                  ],
                ),
              ),
              const Divider(
                color: Colors.red,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    const AppCircleAvatar(
                      url:
                          'https://blog.logrocket.com/wp-content/uploads/2021/04/Building-Flutter-desktop-app-tutorial-examples.png',
                      size: 30,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '@vanchuan',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Van Chuan',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Divider(
                color: Colors.red,
              ),
              _videoController.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _videoController.value.aspectRatio,
                      child: VideoPlayer(_videoController),
                    )
                  : Container(),
              VideoProgressIndicator(
                _videoController,
                allowScrubbing: true,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 30,
                ),
                child: AppButton(
                  title: "Change Svg Picture",
                  onPressed: () {
                    _cubit.changeSvgPicture();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 30,
                ),
                child: AppButton(
                  title: "Go to YoutubePlayer",
                  onPressed: () {
                    Get.toNamed(RouteConfig.youtubePlayerPage);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _cubit.close();
    _videoController.dispose();
    _youtubeController.dispose();
    super.dispose();
  }
}

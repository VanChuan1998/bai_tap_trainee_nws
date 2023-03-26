import 'package:bai_tap_trainee/common/app_text_styles.dart';
import 'package:bai_tap_trainee/ui/widgets/images/app_cache_image.dart';
import 'package:flutter/material.dart';

class CastWidget extends StatelessWidget {
  const CastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppCacheImage(
          url:
              'https://d9n64ieh9hz8y.cloudfront.net/wp-content/uploads/20230206203609/sd-shin-kamen-rider-rumble-se-xuat-chien-vao-cuoi-thang-tu-tin-game.jpg',
          height: 50,
          width: 50,
          borderRadius: 16,
        ),
        const SizedBox(height: 10),
        Text(
          "Kamen Rider 1",
          style: AppTextStyle.whiteS8W500,
        ),
        const SizedBox(height: 3),
        Text(
          "Hongo Tekashi",
          style: AppTextStyle.whiteS8W500.copyWith(
            color: Colors.white.withOpacity(0.5),
          ),
        )
      ],
    );
  }
}

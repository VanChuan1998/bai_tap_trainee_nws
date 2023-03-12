import 'package:bai_tap_trainee/common/app_images.dart';
import 'package:bai_tap_trainee/common/app_text_styles.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              AppImages.imgDemo,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned.fill(
            child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [Colors.black12, Colors.black45],
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
            ),
          ),
        )),
        Positioned(
          bottom: 10,
          left: 12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Salad",
                style: AppTextStyle.whiteS18W800,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "16,278 recipes",
                style: AppTextStyle.whiteS12,
              )
            ],
          ),
        )
      ]),
    );
  }
}

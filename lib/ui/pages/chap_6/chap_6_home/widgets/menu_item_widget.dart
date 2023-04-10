import 'package:bai_tap_trainee/common/app_colors.dart';
import 'package:bai_tap_trainee/common/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuItemWidget extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onPress;

  const MenuItemWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 28, 20, 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: AppColors.gradientA6A1E0A1F3FE30,
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              icon,
              height: 34,
              width: 34,
            ),
            const SizedBox(height: 6),
            Text(
              title,
              style: AppTextStyle.whiteS9,
            )
          ],
        ),
      ),
    );
  }
}

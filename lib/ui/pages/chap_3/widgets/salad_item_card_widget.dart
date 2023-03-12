import 'package:bai_tap_trainee/common/app_images.dart';
import 'package:bai_tap_trainee/common/app_text_styles.dart';
import 'package:bai_tap_trainee/models/entities/salad_entity.dart';
import 'package:bai_tap_trainee/ui/widgets/images/app_circle_avatar.dart';
import 'package:flutter/material.dart';

class SaladItemCard extends StatefulWidget {
  final double width;
  final SaladEntity salad;
  final VoidCallback onBookMarkChanged;

  const SaladItemCard({
    super.key,
    required this.width,
    required this.salad,
    required this.onBookMarkChanged,
  });

  @override
  State<SaladItemCard> createState() => _SaladItemCardState();
}

class _SaladItemCardState extends State<SaladItemCard> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: widget.width,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                widget.salad.imgUrl ?? AppImages.imgDemo,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [Colors.black12, Colors.black45],
                    begin: Alignment.center,
                    end: Alignment.bottomLeft,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              left: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: widget.width - 16,
                    child: Text(
                      widget.salad.title ?? '',
                      style: AppTextStyle.whiteS18W800,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      AppCircleAvatar(
                        url: widget.salad.author?.avatarUrl ?? '',
                        size: 15,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.salad.author?.username ?? '',
                        style: AppTextStyle.whiteS12,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
                right: 8,
                top: 8,
                child: GestureDetector(
                  onTap: () {
                    setState(() {});
                    widget.onBookMarkChanged.call();
                  },
                  child: Container(
                    height: 36,
                    width: 36,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFe3242b),
                    ),
                    child: Icon(
                      widget.salad.isMarked ?? false
                          ? Icons.bookmark_outline
                          : Icons.bookmark,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

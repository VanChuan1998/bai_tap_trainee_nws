import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemWidget extends StatelessWidget {
  final String imgPicture;
  final String svgPicture;
  final String title;
  final bool isShowSvg;

  const ItemWidget({
    Key? key,
    required this.imgPicture,
    required this.svgPicture,
    required this.isShowSvg,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white38,
        border: Border.all(
          color: Colors.black26,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          isShowSvg
              ? SvgPicture.asset(
                  svgPicture,
                  height: 28,
                  fit: BoxFit.fill,
                )
              : Image.asset(
                  imgPicture,
                  height: 28,
                  fit: BoxFit.fill,
                ),
          const SizedBox(width: 20),
          isShowSvg
              ? Text(
                  '$title SVG',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black38,
                  ),
                )
              : Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black38,
                  ),
                )
        ],
      ),
    );
  }
}

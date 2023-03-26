import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bai_tap_trainee/common/app_colors.dart';
import 'package:bai_tap_trainee/common/app_text_styles.dart';

class AppSearchInput extends StatelessWidget {
  final String highlightText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final BoxConstraints? suffixIconConstraints;
  final TextEditingController? textEditingController;
  final TextStyle? textStyle;
  final String hintText;
  final TextStyle? hintStyle;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextInputType textInputType;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final int? maxLength;
  final double radius;

  const AppSearchInput({
    Key? key,
    this.highlightText = "*",
    this.suffixIcon,
    this.prefixIcon,
    this.suffixIconConstraints,
    this.textEditingController,
    this.textStyle,
    this.hintText = "",
    this.hintStyle,
    this.onChanged,
    this.onSubmitted,
    this.textInputType = TextInputType.text,
    this.validator,
    this.inputFormatters,
    this.enabled = true,
    this.maxLength,
    this.radius = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            gradient: AppColors.bottomNavigationBarGradient30,
          ),
          child: TextField(
            enabled: enabled,
            onSubmitted: onSubmitted,
            onChanged: onChanged,
            controller: textEditingController,
            style: textStyle ?? AppTextStyle.blackS16,
            maxLines: 1,
            maxLength: maxLength,
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              prefixIconConstraints:
                  const BoxConstraints(maxHeight: 64, maxWidth: 64),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
              ),
              fillColor: Colors.white,
              hintStyle: hintStyle ?? AppTextStyle.greyS16,
              hintText: hintText,
              isDense: true,
              contentPadding: const EdgeInsets.only(
                top: 8,
                bottom: 12,
                right: 8,
                left: 8,
              ),
              suffixIcon: suffixIcon,
              suffixIconConstraints: suffixIconConstraints ??
                  const BoxConstraints(maxHeight: 64, maxWidth: 64),
              counterText: "",
            ),
            cursorColor: AppColors.textFieldCursor,
            keyboardType: textInputType,
            inputFormatters: inputFormatters,
          ),
        ),
        textEditingController != null
            ? ValueListenableBuilder(
                valueListenable: textEditingController!,
                builder: (context, TextEditingValue controller, child) {
                  final isValid = validator?.call(controller.text) ?? "";
                  return Column(
                    children: [
                      const SizedBox(height: 2),
                      Text(
                        isValid,
                        style:
                            AppTextStyle.blackS12.copyWith(color: Colors.red),
                      ),
                      const SizedBox(height: 12),
                    ],
                  );
                },
              )
            : const SizedBox(),
      ],
    );
  }
}

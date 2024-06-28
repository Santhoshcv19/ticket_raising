import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_caption.text.dart';

class SecondaryTextButton extends ConsumerWidget {
  final String? text;
  final Widget? icon;
  final Color? fontColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Function onTap;

  const SecondaryTextButton({
    super.key,
    required this.text,
    this.icon,
    this.fontSize = 14,
    this.fontColor = AppColors.primary,
    this.fontWeight,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton.icon(
      icon: icon ?? const SizedBox.shrink(),
      onPressed: () => onTap(),
      label: AppSubCaptionText(
        data: text,
        color: fontColor,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}

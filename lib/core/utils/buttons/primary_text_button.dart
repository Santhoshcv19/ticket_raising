import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_caption.text.dart';

class PrimaryTextButton extends ConsumerWidget {
  final String? text;
  final Color? fontColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Function onTap;

  const PrimaryTextButton({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.fontColor = AppColors.primary,
    this.fontWeight,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () => onTap(),
      child: AppSubCaptionText(
        data: text,
        color: fontColor,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}

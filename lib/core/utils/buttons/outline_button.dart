import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/styles/border_radius.style.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_caption.text.dart';

class PrimaryOutlineButton extends ConsumerWidget {
  final String text;
  final Function onTap;
  final double? height;
  final Color? color;
  final BorderRadius? borderRadius;

  const PrimaryOutlineButton({
    super.key,
    required this.text,
    required this.onTap,
    this.height,
    this.color,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialButton(
      height: height ?? 40,
      elevation: 0,
      onPressed: () => onTap(),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? radius16,
        side: BorderSide(width: 1, color: color ?? AppColors.primary),
      ),
      child: AppSubCaptionText(
        data: text,
        color: color ?? AppColors.primary,
        fontSize: 12,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/styles/border_radius.style.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_caption.text.dart';

class CommonContainer extends ConsumerWidget {
  final String? label;
  final Color? color;
  final Color? fontColor;
  final Color? borderColor;

  const CommonContainer({
    super.key,
    this.color,
    this.fontColor,
    this.label,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kFontColor = fontColor ?? AppColors.white;
    final kbordercolor = borderColor ?? AppColors.white;

    return Container(
      alignment: Alignment.center,
      height: 30,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: radius32,
        color: color,
        border: Border.all(color: kbordercolor),
      ),
      child: AppSubCaptionText(
        data: label,
        color: kFontColor,
        fontSize: 12,
      ),
    );
  }
}

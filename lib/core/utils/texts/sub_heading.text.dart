import 'package:flutter/material.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';

class AppSubHeadingText extends StatelessWidget {
  final String? data;
  final Color? color;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final double? fontSize;

  const AppSubHeadingText({
    super.key,
    required this.data,
    this.textAlign,
    this.fontWeight,
    this.maxLines,
    this.color = AppColors.blackgrey,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.displaySmall;

    return Text(
      data ?? '',
      style: style?.copyWith(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
    );
  }
}

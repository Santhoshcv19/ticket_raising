import 'package:flutter/material.dart';

class AppSubCaptionText extends StatelessWidget {
  final String? data;
  final Color? color;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final double? fontSize;

  const AppSubCaptionText({
    super.key,
    required this.data,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.textAlign,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodySmall;

    return Text(
      data ?? '',
      style: style?.copyWith(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize ?? 16,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
    );
  }
}

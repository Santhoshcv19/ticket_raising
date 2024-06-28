import 'package:flutter/material.dart';

class AppSubButtonText extends StatelessWidget {
  final String? data;
  final Color? color;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final double? fontSize;

  const AppSubButtonText({
    super.key,
    required this.data,
    this.color,
    this.textAlign,
    this.fontWeight,
    this.maxLines,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodySmall;

    return Text(
      data ?? '',
      style: style?.copyWith(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
    );
  }
}

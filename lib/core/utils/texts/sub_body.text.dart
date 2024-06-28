import 'package:flutter/material.dart';

class AppSubBodyText extends StatelessWidget {
  final String? data;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Color? color;

  const AppSubBodyText({
    super.key,
    required this.data,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleMedium;

    return Text(
      data ?? '',
      style: style?.copyWith(
        color: color,
        fontWeight: fontWeight,
        fontSize: 20,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
    );
  }
}

import 'package:flutter/material.dart';

class AppSubTitleText extends StatelessWidget {
  final String? data;
  final Color? color;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;

  const AppSubTitleText({
    super.key,
    required this.data,
    this.maxLines,
    this.fontWeight,
    this.textAlign,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.headlineSmall;

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

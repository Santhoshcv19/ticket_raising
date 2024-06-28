import 'package:flutter/material.dart';

class AppHeadingText extends StatelessWidget {
  final String? data;
  final int? maxLines;
  final TextAlign? textAlign;

  const AppHeadingText({
    super.key,
    required this.data,
    this.textAlign,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data ?? '',
      style: Theme.of(context).textTheme.displaySmall,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
    );
  }
}

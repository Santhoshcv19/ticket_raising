import 'package:flutter/material.dart';

class AppBodyText extends StatelessWidget {
  final String? data;
  final int? maxLines;
  final TextAlign? textAlign;

  const AppBodyText({
    super.key,
    required this.data,
    this.maxLines,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data ?? '',
      style: Theme.of(context).textTheme.titleMedium,
      maxLines: maxLines,
      textAlign: textAlign ?? TextAlign.left,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
    );
  }
}

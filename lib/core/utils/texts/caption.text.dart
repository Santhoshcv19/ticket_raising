import 'package:flutter/material.dart';

class AppCaptionText extends StatelessWidget {
  final String? data;
  final int? maxLines;
  final TextAlign? textAlign;

  const AppCaptionText({
    super.key,
    required this.data,
    this.textAlign,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data ?? '',
      style: Theme.of(context).textTheme.bodySmall,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_caption.text.dart';

class Content extends ConsumerWidget {
  final String title;
  final String? body;
  final FontWeight fontWeight;
  final Color? color;
  final Widget? child;

  const Content({
    super.key,
    required this.title,
    this.body,
    this.fontWeight = FontWeight.bold,
    this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kColor = color ?? AppColors.blackgrey;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      AppSubCaptionText(data: title, fontSize: 14),
      const SizedBox(height: Dimen.space),
      if (child != null) child!,
      if (child == null)
        AppSubCaptionText(
          data: body,
          color: kColor,
          // fontWeight: fontWeight,
          fontSize: 14,
        ),
    ]);
  }
}

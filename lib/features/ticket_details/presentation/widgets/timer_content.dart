import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/utils/texts/caption.text.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_caption.text.dart';

class TimerContent extends ConsumerWidget {
  final String title;
  final String? body1;
  final String? body2;

  const TimerContent({super.key, required this.title, this.body1, this.body2});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(child: AppCaptionText(data: title)),
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          AppSubCaptionText(data: body1, color: AppColors.black),
          AppSubCaptionText(data: body2, fontSize: 10),
        ]),
      ),
    ]);
  }
}

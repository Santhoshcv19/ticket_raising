import 'package:flutter/material.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/assets/assets.dart';
import 'package:ticket_raising_management/core/utils/texts/body.text.dart';
import 'package:ticket_raising_management/core/widgets/image.dart';

class NoDataFound extends StatelessWidget {
  final String? content;

  const NoDataFound({super.key, this.content});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Photo(image: Assets.noData, size: Dimen.icon * 20),
      const SizedBox(height: Dimen.space * 4),
      AppBodyText(data: content ?? 'No data found'),
    ]);
  }
}

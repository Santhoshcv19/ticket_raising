import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/assets/assets.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_body.text.dart';

class SentMessage extends ConsumerWidget {
  const SentMessage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Card(
      color: AppColors.backgroundLIGHT,
      elevation: 0,
      shape: RoundedRectangleBorder(),
      margin: EdgeInsets.only(left: 550, top: 250, right: 550, bottom: 250),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            height: 250,
            width: 250,
            image: AssetImage(Assets.success),
          ),
          SizedBox(
            height: Dimen.halfMargin * 2,
          ),
          AppSubBodyText(
            data: 'Email Sent Successfully !',
            fontWeight: FontWeight.bold,
          )
        ],
      ),
    );
  }
}

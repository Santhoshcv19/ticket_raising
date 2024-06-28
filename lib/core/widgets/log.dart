import 'package:flutter/material.dart';
import 'package:ticket_raising_management/core/common/domain/entity/ticket.entity.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/extensions/datetime.extension.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_caption.text.dart';
import 'package:ticket_raising_management/core/utils/utils.dart';
import 'package:ticket_raising_management/core/widgets/card.dart';

class Log extends StatelessWidget {
  final LogEntity data;

  const Log({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final dateTime = Utils.convertDateTime(data.createdAt);

    IconData icon = Icons.check_circle_outline_rounded;

    if (data.type == 1) {
      icon = Icons.bug_report_outlined;
    } else if (data.type == 2) {
      icon = Icons.person_outline;
    } else if (data.type == 3) {
      icon = Icons.chat_bubble_outline;
    } else if (data.type == 4) {
      icon = Icons.repeat_rounded;
    } else if (data.type == 5) {
      icon = Icons.lock_outline;
    } else if (data.type == 6) {
      icon = Icons.lock_open_outlined;
    }

    return KCard(
      color: AppColors.white,
      padding: Dimen.scaffoldMargin,
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        CircleAvatar(
          radius: Dimen.icon * .75,
          backgroundColor: AppColors.lightGrey,
          child: Icon(icon, color: AppColors.grey, size: Dimen.icon * .75),
        ),
        const SizedBox(width: Dimen.space * 2),
        Expanded(
          child: AppSubCaptionText(data: data.log, color: AppColors.black),
        ),
        const SizedBox(width: Dimen.space * 2),
        AppSubCaptionText(data: dateTime?.formatddMMMYYYYHHmm(), fontSize: 8),
      ]),
    );
  }
}

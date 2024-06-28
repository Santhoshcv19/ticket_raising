import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_body.text.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_caption.text.dart';
import 'package:ticket_raising_management/core/utils/texts/title.text.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/others/logic.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/actions/actions.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/lock.dart';
import 'package:ticket_raising_management/core/widgets/ticket/priority.dart';

class BasicDetails extends ConsumerWidget {
  const BasicDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(ticketDetailsLogic).data;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      AppSubCaptionText(data: data?.ticketId, fontSize: 8),
      Row(children: [
        Expanded(
          child: Row(children: [
            Flexible(child: AppTitleText(data: data?.title, maxLines: 2)),
            const SizedBox(width: Dimen.space),
            const LockedTicket(),
          ]),
        ),
        const TicketActions(),
        const SizedBox(width: Dimen.space * 2),
        TicketPriority(data: data?.priority)
      ]),
      const SizedBox(height: Dimen.space),
      AppSubBodyText(data: data?.ticketDescription, color: AppColors.grey),
    ]);
  }
}

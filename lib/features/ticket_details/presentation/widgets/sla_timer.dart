import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/helpers/datetime.helper.dart';
import 'package:ticket_raising_management/core/helpers/ticket.helper.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/buttons/secondary_button.dart';
import 'package:ticket_raising_management/core/utils/extensions/datetime.extension.dart';
import 'package:ticket_raising_management/core/utils/texts/caption.text.dart';
import 'package:ticket_raising_management/core/utils/texts/heading.text.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_caption.text.dart';
import 'package:ticket_raising_management/core/utils/utils.dart';
import 'package:ticket_raising_management/core/widgets/card.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/others/logic.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/provider.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/children.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/timer_content.dart';

class SLAtimer extends ConsumerWidget {
  const SLAtimer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = ref.watch(timerNotifier);
    final state = ref.watch(childrenNotifier);
    final data = ref.watch(ticketDetailsLogic).data;

    final resolvedAt = Utils.convertDateTime(data?.resolvedAt);
    final closedAt = Utils.convertDateTime(data?.closedAt);

    return KCard(
      padding: Dimen.scaffoldMargin,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const AppCaptionText(data: 'SLA TIME REMAINING'),
        Row(children: [
          const CircleAvatar(
            radius: Dimen.icon * .5,
            backgroundColor: AppColors.red,
          ),
          const SizedBox(width: Dimen.space),
          if (time.isNegative) const AppHeadingText(data: '-'),
          const SizedBox(width: Dimen.space),
          Expanded(child: AppHeadingText(data: DateTimeHelper.getHMS(time))),
        ]),
        if (data?.resolvedAt != null) const SizedBox(height: Dimen.space * 4),
        if (data?.resolvedAt != null)
          TimerContent(
            title: 'RESOLUTION TIME',
            body1: TicketHelper.getResolutionTime(data),
            body2: resolvedAt?.formatddMMMYYYYHHmm(),
          ),
        if (data?.closedAt != null) const SizedBox(height: Dimen.space * 1.5),
        if (data?.closedAt != null)
          TimerContent(
            title: 'CLOSING TIME',
            body1: TicketHelper.getClosingTime(data),
            body2: closedAt?.formatddMMMYYYYHHmm(),
          ),
        const SizedBox(height: Dimen.space * 1.5),
        state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          data: (data) => Row(children: [
            const Expanded(child: AppCaptionText(data: 'CHILD TICKETS')),
            SecondaryButton(
              height: Dimen.icon,
              width: Dimen.icon,
              child: const Icon(
                Icons.link,
                color: AppColors.blue,
                size: Dimen.icon,
              ),
              onTap: () => showDialog(
                context: context,
                builder: (context) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: Dimen.icon * 30,
                      child: ChildrenView(data: data),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: Dimen.space * .5),
            AppSubCaptionText(data: '${data.length}', color: AppColors.blue),
          ]),
        ),
      ]),
    );
  }
}

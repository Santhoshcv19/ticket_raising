import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/common/domain/entity/ticket.entity.dart';
import 'package:ticket_raising_management/core/styles/border_radius.style.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/buttons/secondary_button.dart';
import 'package:ticket_raising_management/core/utils/extensions/datetime.extension.dart';
import 'package:ticket_raising_management/core/utils/texts/body.text.dart';
import 'package:ticket_raising_management/core/utils/texts/caption.text.dart';
import 'package:ticket_raising_management/core/utils/utils.dart';
import 'package:ticket_raising_management/features/tickets/presentation/logic/others/logic.dart';
import 'package:ticket_raising_management/features/tickets/presentation/widgets/priority.dart';
import 'package:ticket_raising_management/features/tickets/presentation/widgets/status.dart';

class HmsTicket extends ConsumerWidget {
  final TicketEntity data;

  const HmsTicket({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateTime = Utils.convertDateTime(data.createdAt);

    return SecondaryButton(
      onTap: () {
        ref.read(ticketLogic).ticketEntity = data;
        Scaffold.of(context).openEndDrawer();
      },
      shape: RoundedRectangleBorder(
        borderRadius: radius8,
        side: BorderSide(color: AppColors.grey.withOpacity(.5)),
      ),
      padding: Dimen.scaffoldMargin,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Expanded(child: AppCaptionText(data: data.ticketId)),
          TicketStatus(data: data.ticketStatus),
        ]),
        const SizedBox(height: Dimen.space),
        AppBodyText(data: data.title),
        const SizedBox(height: Dimen.space * 2),
        Row(children: [
          TicketPriority(data: data.priority),
          const AppBodyText(data: ' | '),
          AppBodyText(data: dateTime?.formatddMMMYYYYHHmm()),
        ]),
      ]),
    );
  }
}

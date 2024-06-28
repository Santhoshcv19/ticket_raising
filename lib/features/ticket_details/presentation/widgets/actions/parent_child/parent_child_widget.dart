import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/common/domain/entity/ticket.entity.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/buttons/primary_text_button.dart';
import 'package:ticket_raising_management/core/utils/extensions/datetime.extension.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_body.text.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_caption.text.dart';
import 'package:ticket_raising_management/core/utils/utils.dart';
import 'package:ticket_raising_management/core/widgets/card.dart';
import 'package:ticket_raising_management/core/widgets/ticket/priority.dart';
import 'package:ticket_raising_management/core/widgets/ticket/status.dart';

class ParentChildWidget extends ConsumerWidget {
  final TicketEntity? data;
  final Function(TicketEntity)? onAdd;
  final Function(TicketEntity)? onRemove;
  final bool inList;
  final bool showOptions;
  final Function(ChildEntity)? onTap;

  const ParentChildWidget({
    this.onTap,
    super.key,
    required this.data,
    this.onAdd,
    this.onRemove,
    this.inList = true,
    this.showOptions = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (data == null) return const SizedBox.shrink();

    final dateTime = Utils.convertDateTime(data?.createdAt);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      KCard(
        padding: Dimen.textMargin,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            AppSubCaptionText(data: data?.ticketId),
            TicketStatus(data: data?.ticketStatus),
          ]),
          AppSubBodyText(data: data?.title, fontWeight: FontWeight.bold),
          const SizedBox(height: Dimen.space * 2),
          Row(children: [
            TicketPriority(data: data?.priority),
            const SizedBox(width: Dimen.space * .5),
            const AppSubBodyText(data: ' | ', color: AppColors.grey),
            const SizedBox(width: Dimen.space * .5),
            AppSubBodyText(data: dateTime?.formatddMMMYYYY())
          ]),
        ]),
      ),
      const SizedBox(height: Dimen.space),
      if (showOptions && !inList)
        PrimaryTextButton(
          onTap: () {
            if (onAdd != null) return onAdd!(data!);
          },
          text: '+ Add',
          fontColor: AppColors.primary,
        ),
      if (showOptions && inList)
        PrimaryTextButton(
          onTap: () {
            if (onRemove != null) onRemove!(data!);
          },
          text: '- Remove',
          fontColor: AppColors.red,
        ),
    ]);
  }
}

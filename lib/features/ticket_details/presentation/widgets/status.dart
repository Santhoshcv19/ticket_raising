import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/common/logic/provider.dart';
import 'package:ticket_raising_management/core/common/params/status_params.dart';
import 'package:ticket_raising_management/core/controller/master.controller.dart';
import 'package:ticket_raising_management/core/controller/rights.controller.dart';
import 'package:ticket_raising_management/core/styles/border_radius.style.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/texts/body.text.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_body.text.dart';
import 'package:ticket_raising_management/core/utils/utils.dart';
import 'package:ticket_raising_management/core/widgets/card.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/others/logic.dart';

List<Color> _color = [
  AppColors.green,
  AppColors.blue,
  AppColors.green,
  AppColors.red,
  AppColors.orange,
];

class ActionStatus extends ConsumerWidget {
  const ActionStatus({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notfier = ref.read(statusChangeProvider.notifier);
    final data = ref.watch(ticketDetailsLogic).data;

    final bool isLocked = data?.lock?.lockedBy != null;

    final d = masterController.ticketStatus.firstWhere(
      (e) => e.masterId == data?.ticketStatus,
    );

    return KCard(
      color: _color[masterController.ticketStatus.indexOf(d)],
      borderRadius: radius32,
      padding: Dimen.textMargin,
      child: PopupMenuButton(
        enabled: !isLocked,
        tooltip: isLocked ? 'This ticket is locked' : null,
        position: PopupMenuPosition.under,
        onSelected: (val) async {
          final hasRights = rightsController.hasTicketRights(data);

          if (!hasRights) {
            return Utils.toast('You do not have access to this ticket');
          }

          final time = Utils.getTimeStamp();

          int? startTime;

          if (val == 3 && data?.startTime == null) {
            startTime = time;
          }

          var params = StatusParams(
            status: val,
            ticketId: data?.ref?.id,
            startTime: val == 2 ? time : startTime,
            resolvedAt: val == 3 ? time : null,
            closedAt: val == 4 ? time : null,
            reOpenAt: val == 5 ? time : null,
          );
          await notfier.changeStatus(params);
        },
        itemBuilder: (context) => masterController.ticketStatus.map((e) {
          return PopupMenuItem(
            value: e.masterId,
            child: AppBodyText(data: e.value),
          );
        }).toList(),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          AppSubBodyText(
            data: masterController.parseStatus(data?.ticketStatus),
            color: AppColors.white,
          ),
          const Icon(Icons.keyboard_arrow_down, color: AppColors.white)
        ]),
      ),
    );
  }
}

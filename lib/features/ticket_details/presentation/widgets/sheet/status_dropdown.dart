import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/common/domain/entity/ticket.entity.dart';
import 'package:ticket_raising_management/core/common/logic/provider.dart';
import 'package:ticket_raising_management/core/common/params/status_params.dart';
import 'package:ticket_raising_management/core/controller/master.controller.dart';
import 'package:ticket_raising_management/core/controller/rights.controller.dart';
import 'package:ticket_raising_management/core/styles/border_radius.style.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/utils.dart';

class StatusDropdown extends ConsumerWidget {
  final TicketEntity? data;

  const StatusDropdown({super.key, this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notfier = ref.read(statusChangeProvider.notifier);

    return Container(
      decoration: BoxDecoration(
        borderRadius: radius16,
        border: Border.all(width: 1, color: AppColors.grey300),
      ),
      height: Dimen.icon * 1.5,
      child: Row(children: [
        const SizedBox(width: Dimen.space),
        const CircleAvatar(
          radius: Dimen.icon * .25,
          backgroundColor: AppColors.primary,
        ),
        const SizedBox(width: Dimen.space),
        Expanded(
          child: DropdownButton<int>(
            padding: EdgeInsets.zero,
            isExpanded: true,
            underline: const SizedBox.shrink(),
            icon: const Icon(Icons.keyboard_arrow_down),
            iconSize: Dimen.icon * .75,
            iconEnabledColor: AppColors.grey,
            value: data?.ticketStatus,
            items: masterController.ticketStatus.map((e) {
              return DropdownMenuItem<int>(
                value: e.masterId,
                child: Text(
                  e.value ?? '',
                  style: const TextStyle(color: AppColors.black),
                ),
              );
            }).toList(),
            style: Theme.of(context).textTheme.bodySmall,
            onChanged: (val) async {
              if (data?.lock?.lockedBy != null) {
                return Utils.toast('This ticket is locked');
              }

              final hasRights = rightsController.hasTicketRights(data);

              if (!hasRights) {
                return Utils.toast('You do not have access to this ticket');
              }

              if (data?.ticketStatus == 1 && val == 5) {
                return Utils.toast('This Status is invalid');
              }

              if (val == null) return;
              final time = Utils.getTimeStamp();

              int? startTime;
              int? resolvedAt;
              int? closedAt;

              if (val == 3 && data?.startTime == null) {
                startTime = time;
              }

              if (val == 4) {
                if (data?.startTime == null) startTime = time;
                if (data?.resolvedAt == null) resolvedAt = time;
              }

              if (val == 5 && data?.resolvedAt == null) {
                resolvedAt = time;
              }

              var params = StatusParams(
                status: val,
                ticketId: data?.ref?.id,
                startTime: val == 2 ? time : startTime,
                resolvedAt: val == 3 ? time : resolvedAt,
                closedAt: val == 4 ? time : closedAt,
                reOpenAt: val == 5 ? time : null,
              );
              await notfier.changeStatus(params);
            },
          ),
        ),
        const SizedBox(width: Dimen.space),
      ]),
    );
  }
}

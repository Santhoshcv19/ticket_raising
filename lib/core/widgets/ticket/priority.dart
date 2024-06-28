import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/controller/master.controller.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/widgets/ticket/container.dart';

class TicketPriority extends ConsumerWidget {
  final int? data;

  const TicketPriority({super.key, this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final priority = masterController.parsePriority(data);

    if (priority == 'High') {
      return CommonContainer(
        label: priority,
        color: AppColors.highFill,
        fontColor: AppColors.highText,
        borderColor: AppColors.highStroke,
      );
    } else if (priority == 'Medium') {
      return CommonContainer(
        label: priority,
        color: AppColors.mediumFill,
        fontColor: AppColors.mediumText,
        borderColor: AppColors.mediumStroke,
      );
    } else if (priority == 'Low') {
      return CommonContainer(
        label: priority,
        color: AppColors.lowFill,
        fontColor: AppColors.lowText,
        borderColor: AppColors.lowStroke,
      );
    } else {
      return CommonContainer(label: priority, color: AppColors.grey);
    }
  }
}

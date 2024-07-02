import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/controller/master.controller.dart' as trm;
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/widgets/container.dart';

class TicketStatus extends ConsumerWidget {
  final int? data;

  const TicketStatus({super.key, this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CommonContainer(
      label: trm.masterController.parseStatus(data),
      color: AppColors.paleGreen,
      fontColor: AppColors.black,
    );
  }
}

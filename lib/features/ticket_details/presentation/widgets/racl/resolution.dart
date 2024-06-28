import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/common/domain/entity/ticket.entity.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/widgets/card.dart';
import 'package:ticket_raising_management/core/widgets/save_and_cancel.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/others/logic.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/provider.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/attachments.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/racl/attach_resolution.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/racl/resolution_field.dart';

class Resolution extends ConsumerWidget {
  final TicketEntity data;

  const Resolution({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(ticketDetailsLogic);
    final state = ref.watch(attachmentsNotifier);
    final logic = ref.watch(ticketDetailsLogic);

    return state.maybeWhen(
      orElse: () => const SizedBox.shrink(),
      data: (at, data) => KCard(
        padding: Dimen.scaffoldMargin,
        color: AppColors.paleSandal,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const ResolutionField(),
          const SizedBox(height: Dimen.space * 2),
          if (data.isEmpty) const AttachResolution(),
          if (data.isNotEmpty) Attachments(data: data),
          if (logic.enableSave) const SizedBox(height: Dimen.space),
          if (logic.enableSave)
            SaveAndCancel(onSave: provider.onSave, onCancel: provider.onCancel)
        ]),
      ),
    );
  }
}

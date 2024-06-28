import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/common/domain/entity/ticket.entity.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/widgets/card.dart';
import 'package:ticket_raising_management/features/tickets/presentation/widgets/details/attachments.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/provider.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/racl/resolution_field.dart';

class HmsResolution extends ConsumerWidget {
  final TicketEntity data;

  const HmsResolution({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(attachmentsNotifier);

    return state.maybeWhen(
      orElse: () => const SizedBox.shrink(),
      data: (at, data) => KCard(
        padding: Dimen.scaffoldMargin,
        color: AppColors.paleSandal,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const ResolutionField(hintText: '', enabled: false),
          const SizedBox(height: Dimen.space * 2),
          if (data.isNotEmpty) HmsAttachments(data: data),
        ]),
      ),
    );
  }
}

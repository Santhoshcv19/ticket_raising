import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/common/domain/entity/ticket.entity.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/texts/body.text.dart';
import 'package:ticket_raising_management/core/widgets/card.dart';

class AltFlow extends ConsumerWidget {
  final TicketEntity data;

  const AltFlow({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: KCard(
        padding: Dimen.scaffoldMargin,
        color: AppColors.paleSandal,
        child: AppBodyText(data: data.altFlow, maxLines: null),
      ),
    );
  }
}

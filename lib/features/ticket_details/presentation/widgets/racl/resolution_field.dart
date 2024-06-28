import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/controller/rights.controller.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/textfields/form.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/others/logic.dart';

class ResolutionField extends ConsumerWidget {
  final String? hintText;
  final bool enabled;

  const ResolutionField({super.key, this.hintText, this.enabled = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(ticketDetailsLogic);
    final hasRights = rightsController.hasTicketRights(provider.data);

    return AppFormField(
      enabled: enabled ? hasRights : enabled,
      controller: provider.resolution,
      contentPadding: Dimen.textMargin,
      border: InputBorder.none,
      minLines: 8,
      hintText: hintText ?? 'Wrtie the resolution fot the ticket',
    );
  }
}

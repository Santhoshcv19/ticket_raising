import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/controller/master.controller.dart' as trm;
import 'package:ticket_raising_management/core/controller/rights.controller.dart';
import 'package:ticket_raising_management/core/styles/border_radius.style.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/params.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/others/logic.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/provider.dart';

class AssignDeveloper extends ConsumerWidget {
  const AssignDeveloper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logic = ref.watch(ticketDetailsLogic);
    final data = logic.data;

    final notifier = ref.read(ticketActionNotifier.notifier);

    final hasRights = rightsController.hasTicketRights(logic.data);

    final bool isLocked = data?.lock?.lockedBy != null;

    return Row(children: [
      Expanded(
        child: DropdownSearch<String?>(
          enabled: hasRights && !isLocked,
          items: trm.masterController.users.map((e) {
            return e.value;
          }).toList(),
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              hintText: 'Select Developer',
              contentPadding: Dimen.textMargin,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.grey, width: .5),
                borderRadius: radius8,
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.grey, width: .5),
                borderRadius: radius8,
              ),
              suffixIconColor: AppColors.grey,
            ),
          ),
          onChanged: (value) async {
            final master = trm.masterController.users.firstWhere(
              (e) => e.value == value,
            );

            final params = TicketDetailsParams(
              ticketId: data?.ref?.id,
              technicalAssingned: master.masterId,
            );

            await notifier.updateTechAssigned(params);
          },
          selectedItem: trm.masterController.parseUser(
            data?.technicalAssingned,
          ),
        ),
      ),
      const Spacer(),
    ]);
  }
}

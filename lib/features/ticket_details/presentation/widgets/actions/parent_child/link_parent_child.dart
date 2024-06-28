import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:ticket_raising_management/core/styles/border_radius.style.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/buttons/primary_button.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_body.text.dart';
import 'package:ticket_raising_management/core/widgets/card.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/params.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/others/logic.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/provider.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/actions/parent_child/child.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/actions/parent_child/parent.dart';

class ParentChild extends ConsumerWidget {
  const ParentChild({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(ticketDetailsLogic);

    final notifier = ref.read(ticketActionNotifier.notifier);

    return KCard(
      margin: Dimen.scaffoldMargin * 5,
      padding: Dimen.scaffoldMargin,
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [AppSubBodyText(data: 'Link to a Ticket'), CloseButton()],
          ),
          const Divider(),
          const Expanded(
            child: Row(children: [
              Expanded(child: ParentWidget()),
              SizedBox(width: Dimen.space),
              VerticalDivider(),
              SizedBox(width: Dimen.space),
              Expanded(child: ChildWidget()),
            ]),
          ),
          Row(
            children: [
              const Spacer(flex: 8),
              Expanded(
                child: PrimaryButton(
                  text: 'Cancel',
                  borderRadius: radius8,
                  color: AppColors.white,
                  fontColor: AppColors.grey,
                  onTap: () => navigator?.pop(),
                ),
              ),
              const SizedBox(width: Dimen.space * 2),
              Expanded(
                child: PrimaryButton(
                  text: 'Link',
                  borderRadius: radius8,
                  onTap: () async {
                    final params = TicketDetailsParams(
                      ticketId: provider.parent?.ref?.id,
                      children: provider.child,
                    );
                    await notifier.linkParentChild(params);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

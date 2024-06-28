import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/extensions/datetime.extension.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_caption.text.dart';
import 'package:ticket_raising_management/core/utils/utils.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/others/logic.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/provider.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/assign_developer.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/attachments.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/sheet/contents.dart';

class DevelopmentDetails extends ConsumerWidget {
  const DevelopmentDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(ticketDetailsLogic).data;
    final state = ref.watch(attachmentsNotifier);

    final dT = Utils.convertDateTime(data?.createdAt);

    return Row(children: [
      state.maybeWhen(
        orElse: () => const SizedBox.shrink(),
        data: (data, resolution) {
          if (data.isEmpty) return const SizedBox.shrink();
          return Expanded(child: Attachments(data: data));
        },
      ),
      Expanded(
        child: Content(title: 'RAISED ON', body: dT?.formatddMMMYYYYHHmm()),
      ),
      const Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AppSubCaptionText(data: 'ASSIGNED TO'),
          SizedBox(height: Dimen.space),
          AssignDeveloper(),
        ]),
      )
    ]);
  }
}

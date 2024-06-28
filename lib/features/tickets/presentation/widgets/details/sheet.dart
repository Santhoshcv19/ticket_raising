import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/controller/master.controller.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/extensions/datetime.extension.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_body.text.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_caption.text.dart';
import 'package:ticket_raising_management/core/utils/utils.dart';
import 'package:ticket_raising_management/core/widgets/ticket/status.dart';
import 'package:ticket_raising_management/features/tickets/presentation/widgets/details/attachments.dart';
import 'package:ticket_raising_management/features/tickets/presentation/widgets/details/ral.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/provider.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/sheet/contents.dart';
import 'package:ticket_raising_management/features/tickets/presentation/logic/others/logic.dart';
import 'package:ticket_raising_management/features/tickets/presentation/logic/provider.dart';

class HmsTicketSheet extends ConsumerStatefulWidget {
  const HmsTicketSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HmsTicketSheetState();
}

class _HmsTicketSheetState extends ConsumerState<HmsTicketSheet> {
  @override
  void initState() {
    final provider = ref.read(ticketLogic);
    final notifier1 = ref.refresh(ticketDetailsNotifier.notifier);
    final notifier2 = ref.refresh(attachmentsNotifier.notifier);
    final notifier3 = ref.refresh(logsNotifier.notifier);

    final String? id = provider.ticketEntity?.ticketId;

    if (id == null) return;

    Future.microtask(() async {
      notifier1.getTicketDetails(id);
      await notifier2.fetchAttachments(id);
      notifier3.fetchLogs(id);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(ticketDetailsNotifier);
    final attachments = ref.watch(attachmentsNotifier);

    ref.listen(updateTicketNotifier, (previous, next) {
      next.whenOrNull(
        loading: () => Utils.showLoader(context),
        data: () => Utils.dismissLoader(context),
        error: () => Utils.dismissLoader(context),
      );
    });

    return Drawer(
      elevation: 0,
      width: Dimen.icon * 30,
      shape: const RoundedRectangleBorder(),
      backgroundColor: AppColors.lightGrey,
      child: state.maybeWhen(
        orElse: () => const Center(child: CircularProgressIndicator()),
        data: (data) {
          final dateTime = Utils.convertDateTime(data.createdAt);
          final ticketOn = dateTime?.formatddMMMYYYYHHmm();

          return ListView(padding: Dimen.scaffoldMargin, children: [
            const Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              BackButton(),
              Spacer(),
            ]),
            const SizedBox(height: Dimen.space),
            Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Expanded(child: AppSubCaptionText(data: data.ticketId)),
              const Spacer(),
              TicketStatus(data: data.ticketStatus),
            ]),
            AppSubBodyText(data: data.title, fontWeight: FontWeight.bold),
            const SizedBox(height: Dimen.space * 2),
            AppSubBodyText(data: data.ticketDescription, color: AppColors.grey),
            const SizedBox(height: Dimen.space * 2),
            Row(children: [
              Expanded(
                child: Content(
                  title: 'WORKER',
                  body: masterController.parseUser(data.technicalAssingned),
                ),
              ),
              Expanded(
                child: Content(
                  title: 'CATEGORY',
                  body: masterController.parseCategory(data.category),
                ),
              ),
            ]),
            const SizedBox(height: Dimen.space * 4),
            Row(children: [
              Expanded(
                child: Content(
                  title: 'PRIORITY',
                  body: masterController.parsePriority(data.priority),
                ),
              ),
              Expanded(
                child: Content(title: 'TICKET ON', body: ticketOn),
              ),
            ]),
            const SizedBox(height: Dimen.space * 4),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                child: Content(
                  title: 'CHANNEL',
                  body: masterController.parseChannel(data.channel),
                ),
              ),
              Expanded(
                child: attachments.maybeWhen(
                  orElse: () => const SizedBox.shrink(),
                  data: (data, resolution) {
                    if (data.isEmpty) return const SizedBox.shrink();
                    return HmsAttachments(data: data);
                  },
                ),
              ),
            ]),
            const SizedBox(height: Dimen.space * 2),
            RAL(data: data),
          ]);
        },
      ),
    );
  }
}

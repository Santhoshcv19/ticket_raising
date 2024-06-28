import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:ticket_raising_management/core/alerts/confirm_alert.dart';
import 'package:ticket_raising_management/core/controller/master.controller.dart';
import 'package:ticket_raising_management/core/controller/rights.controller.dart';
import 'package:ticket_raising_management/core/routes/route_name.dart';
import 'package:ticket_raising_management/core/styles/border_radius.style.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/buttons/outline_button.dart';
import 'package:ticket_raising_management/core/utils/buttons/secondary_button.dart';
import 'package:ticket_raising_management/core/utils/extensions/datetime.extension.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_caption.text.dart';
import 'package:ticket_raising_management/core/utils/utils.dart';
import 'package:ticket_raising_management/core/widgets/edit_ticket/edit_button.dart';
import 'package:ticket_raising_management/core/widgets/edit_ticket/edit_ticket.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/others/logic.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/provider.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/racl/racl.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/sheet/contents.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/sheet/status_dropdown.dart';
import 'package:ticket_raising_management/features/tickets/domain/usecase/params.dart';
import 'package:ticket_raising_management/features/tickets/presentation/logic/others/logic.dart';
import 'package:ticket_raising_management/features/tickets/presentation/logic/provider.dart';
import 'package:ticket_raising_management/services/provider.dart';

class DetailsSheet extends ConsumerStatefulWidget {
  const DetailsSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailsSheetState();
}

class _DetailsSheetState extends ConsumerState<DetailsSheet> {
  @override
  void initState() {
    final provider = ref.read(ticketLogic);
    final notifier1 = ref.refresh(ticketDetailsNotifier.notifier);
    final notifier2 = ref.refresh(attachmentsNotifier.notifier);
    final notifier3 = ref.refresh(commentsNotifier.notifier);
    final notifier4 = ref.refresh(logsNotifier.notifier);

    final String? id = provider.ticketEntity?.ticketId;

    if (id == null) return;

    Future.microtask(() async {
      notifier1.getTicketDetails(id);
      await notifier2.fetchAttachments(id);
      notifier3.fetchComments(id);
      notifier4.fetchLogs(id);
    });

    super.initState();
  }

  void _onViewDetails() {
    final provider = ref.read(ticketLogic);
    final route = ref.read(routeService);
    navigator?.pop();
    Map<String, String> params = {};

    params['id'] = provider.ticketEntity?.ticketId ?? '';

    route.push(RouteName.ticketDetails, params);
  }

  void _onDelete() {
    navigator?.pop();

    final provider = ref.read(ticketLogic);
    final notifier = ref.read(updateTicketNotifier.notifier);
    final String? id = provider.ticketEntity?.ref?.id;
    final params = TicketParams(documentId: id);

    Utils.showAlert(
      context: context,
      child: ConfirmAlert(
        onConfirm: () async {
          await notifier.deleteTicket(params);
          navigator?.pop();
        },
        title: 'Do you want delete this ticket ?',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.read(ticketDetailsLogic);
    final state = ref.watch(ticketDetailsNotifier);

    ref.listen(updateTicketNotifier, (previous, next) {
      next.whenOrNull(
        loading: () => Utils.showLoader(context),
        data: () => Utils.dismissLoader(context),
        error: () => Utils.dismissLoader(context),
      );
    });

    ref.listen(ticketActionNotifier, (previous, next) {
      next.whenOrNull(commented: () => provider.comments.clear());
    });

    return SizedBox(
      width: Dimen.icon * 25,
      child: Stack(alignment: Alignment.centerRight, children: [
        Drawer(
          elevation: 0,
          width: Dimen.icon * 22.5,
          shape: const RoundedRectangleBorder(),
          backgroundColor: AppColors.lightGrey,
          child: state.maybeWhen(
            orElse: () => const Center(child: CircularProgressIndicator()),
            data: (data) {
              final dateTime = Utils.convertDateTime(data.createdAt);
              final ticketOn = dateTime?.formatddMMMYYYYHHmm();
              final hasRights = rightsController.hasTicketRights(data);

              return ListView(padding: Dimen.scaffoldMargin, children: [
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  if (hasRights)
                    IconButton(
                      tooltip: 'Delete',
                      onPressed: _onDelete,
                      icon: const Icon(Icons.delete, color: AppColors.red),
                      iconSize: Dimen.icon,
                    ),
                  if (hasRights)
                    EditTicketButtonPage(child: EditTicket(data: data)),
                  if (hasRights) const SizedBox(width: Dimen.space),
                  PrimaryOutlineButton(
                    text: 'View details',
                    height: 35,
                    borderRadius: radius8,
                    onTap: _onViewDetails,
                  ),
                ]),
                const SizedBox(height: Dimen.halfMargin * 2),
                Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Expanded(child: AppSubCaptionText(data: data.ticketId)),
                  const Spacer(),
                  Expanded(child: StatusDropdown(data: data)),
                ]),
                AppSubCaptionText(
                  data: data.title,
                  fontWeight: FontWeight.bold,
                ),
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
                Row(children: [
                  Expanded(
                    child: Content(
                      title: 'CHANNEL',
                      body: masterController.parseChannel(data.channel),
                    ),
                  ),
                ]),
                const SizedBox(height: Dimen.space * 2),
                RACL(data: data),
              ]);
            },
          ),
        ),
        Positioned(
          left: Dimen.space * 2.5 + .5,
          top: Dimen.space * 2,
          child: SecondaryButton(
            shape: const CircleBorder(),
            color: AppColors.primary,
            child: const Icon(
              Icons.logout,
              color: AppColors.white,
              size: Dimen.icon,
            ),
            onTap: () => navigator?.pop(),
          ),
        ),
      ]),
    );
  }
}

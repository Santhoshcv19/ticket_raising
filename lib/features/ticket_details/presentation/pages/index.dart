// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:ticket_raising_management/core/common/domain/entity/ticket.entity.dart';
import 'package:ticket_raising_management/core/common/logic/provider.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_body.text.dart';
import 'package:ticket_raising_management/core/utils/utils.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/others/logic.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/provider.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/timer/timer.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/basic_details.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/development_details.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/other_details.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/racl/racl.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/sla_timer.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/status.dart';
import 'package:url_launcher/url_launcher.dart';

class TicketDetails extends ConsumerStatefulWidget {
  const TicketDetails({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TicketDetailsState();
}

class _TicketDetailsState extends ConsumerState<TicketDetails> {
  TimerNotifier? _timerNotifier;

  @override
  void initState() {
    Future.microtask(() async => await fetchData());
    super.initState();
  }

  Future<void> fetchData() async {
    ref.refresh(fileNotifier);

    final provider = ref.refresh(ticketDetailsLogic);
    final notifier1 = ref.refresh(ticketDetailsNotifier.notifier);
    final notifier2 = ref.refresh(attachmentsNotifier.notifier);
    final notifier3 = ref.refresh(commentsNotifier.notifier);
    final notifier4 = ref.refresh(logsNotifier.notifier);
    final notifier5 = ref.refresh(childrenNotifier.notifier);

    _timerNotifier = ref.refresh(timerNotifier.notifier);

    var params = Get.parameters;
    final String id = params['id'] ?? '';

    provider.resolution.addListener(provider.onResolutionChange);

    if (id.isEmpty) return;
    notifier1.getTicketDetails(id);
    await notifier2.fetchAttachments(id);
    notifier3.fetchComments(id);
    notifier4.fetchLogs(id);
    notifier5.fetchChildren(id);
  }

  void loadTimer(TicketEntity data) {
    final startTime = Utils.convertDateTime(data.startTime);
    final resolvedTime = Utils.convertDateTime(data.resolvedAt);

    _timerNotifier?.setTime(((data.sla ?? 0) * 60).toInt());

    if (data.ticketStatus == 1 || startTime == null) return;

    if (data.ticketStatus == 2) {
      final currentTime = DateTime.now();
      final duration = currentTime.difference(startTime);
      return _timerNotifier?.initializeTimer(duration.inSeconds);
    }

    _timerNotifier?.stopTimer();

    if (resolvedTime == null) return;
    final duration = resolvedTime.difference(startTime);

    return _timerNotifier?.loadTime(duration.inSeconds);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(ticketDetailsNotifier);
    final provider = ref.read(ticketDetailsLogic);

    ref.listen(ticketActionNotifier, (previous, next) {
      next.maybeWhen(loading: () {}, orElse: () {});
    });

    ref.listen(ticketDetailsNotifier, (previous, next) {
      next.whenOrNull(data: loadTimer);
    });

    ref.listen(emailNotifier, (previous, next) {
      next.whenOrNull(
        loading: () => Utils.showLoader(context),
        data: () {
          Utils.dismissLoader(context);
          Utils.toast('Email Sent');
        },
        error: () {
          Utils.dismissLoader(context);
          Utils.toast('Error sending email');
        },
      );
    });

    ref.listen(ticketActionNotifier, (previous, next) {
      next.whenOrNull(
        parentChild: () {
          Utils.pop(context);
          provider.child.clear();
        },
        commented: () => provider.comments.clear(),
        // resolution: () async {
        // final notifier = ref.read(attachmentsNotifier.notifier);
        // await notifier.fetchAttachments(provider.data?.ticketId);
        // },
        cloned: (id) async {
          Utils.pop(context);
          await launchUrl(
            Uri.parse(
                'https://ticketing-management-sys.web.app/ticketdetails?id=$id'),
            webOnlyWindowName: '_blank',
          );

          // Map<String, String> params = {};
          // params['id'] = id ?? '';
          // ref.read(routeService).pushReplace(RouteName.ticketDetails, params);
        },
      );
    });

    return state.maybeWhen(
      orElse: () => const Center(child: CircularProgressIndicator()),
      error: () => const AppSubBodyText(data: 'Error'),
      data: (data) => Scaffold(
        backgroundColor: AppColors.greyshade2,
        body: Center(
          child: Container(
            width: 1440,
            padding: Dimen.scaffoldMargin,
            child: Row(children: [
              Expanded(
                flex: 3,
                child: Container(
                  color: AppColors.white,
                  child: ListView(padding: Dimen.scaffoldMargin, children: [
                    const BasicDetails(),
                    const SizedBox(height: Dimen.space * 2),
                    const DevelopmentDetails(),
                    const SizedBox(height: Dimen.space * 4),
                    RACL(data: data),
                  ]),
                ),
              ),
              const SizedBox(width: Dimen.space * 3),
              Expanded(
                child: ListView(children: const [
                  ActionStatus(),
                  SizedBox(height: Dimen.space * 2),
                  SLAtimer(),
                  SizedBox(height: Dimen.space * 2),
                  OtherDetails(),
                ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

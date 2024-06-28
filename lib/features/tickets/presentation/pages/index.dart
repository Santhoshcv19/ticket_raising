import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/assets/assets.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_body.text.dart';
import 'package:ticket_raising_management/core/widgets/image.dart';
import 'package:ticket_raising_management/features/tickets/presentation/logic/others/logic.dart';
import 'package:ticket_raising_management/features/tickets/presentation/logic/provider.dart';
import 'package:ticket_raising_management/features/tickets/presentation/widgets/add_new.dart';
import 'package:ticket_raising_management/features/tickets/presentation/widgets/data.dart';
import 'package:ticket_raising_management/features/tickets/presentation/widgets/details/sheet.dart';
import 'package:ticket_raising_management/features/tickets/presentation/widgets/tab.dart';

class Hms extends ConsumerStatefulWidget {
  const Hms({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HmsState();
}

class _HmsState extends ConsumerState<Hms> with TickerProviderStateMixin {
  var selectedItem = 1;

  // final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    final notifier = ref.refresh(fetchTicketNotifier.notifier);
    final provider = ref.refresh(ticketLogic);

    provider.controller = TabController(length: 4, vsync: this);

    // _controller.addListener(() => provider.search(_controller.text));

    Future.microtask(() => notifier.fetchTickets());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.read(ticketLogic);
    final logic = ref.watch(ticketLogic);

    ref.listen(fetchTicketNotifier, (prev, next) {
      next.whenOrNull(data: (data) => provider.setTickets = data);
    });

    return Scaffold(
      endDrawer: const HmsTicketSheet(),
      body: Column(children: [
        Padding(
          padding: Dimen.scaffoldMargin,
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            PopupMenuButton(
              offset: const Offset(-70, 0),
              padding: Dimen.scaffoldMargin,
              tooltip: 'Have any queries/feedback?\nTalk to our Team',
              elevation: 0,
              initialValue: selectedItem,
              onSelected: (val) => setState(() => selectedItem = val),
              child: CircleAvatar(
                backgroundColor: AppColors.primary,
                child: Image.asset(Assets.support, height: 30, width: 30),
              ),
              itemBuilder: (i) => <PopupMenuEntry>[
                const PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: [
                      Svg(svg: Assets.send, color: AppColors.creamPurple),
                      SizedBox(width: Dimen.space),
                      AppSubBodyText(
                        data: 'Chat with our team',
                        color: AppColors.creamPurple,
                      )
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: 2,
                  child: Row(children: [
                    SvgLite(svg: Assets.email),
                    SizedBox(width: Dimen.space),
                    AppSubBodyText(
                        data: 'Email Us', color: AppColors.creamBrown)
                  ]),
                ),
                const PopupMenuItem(
                  value: 3,
                  child: Row(
                    children: [
                      SvgLite(svg: Assets.call),
                      SizedBox(width: Dimen.space),
                      AppSubBodyText(
                        data: 'Call Us',
                        color: AppColors.creamYellow,
                      )
                    ],
                  ),
                ),
              ],
            )
          ]),
        ),
        const SizedBox(height: Dimen.space * 2),
        Center(child: HmsTicketStausTab(controller: logic.controller)),
        const SizedBox(height: Dimen.space * 4),
        Row(children: [
          const Spacer(),
          if (logic.all.isNotEmpty) const HmsAddNew(),
          const SizedBox(width: Dimen.space * 2),
        ]),
        const SizedBox(height: Dimen.space * 2),
        const TicketData(),
      ]),
    );
  }
}

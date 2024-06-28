import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/common/domain/entity/ticket.entity.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/features/tickets/presentation/widgets/details/resolution.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/racl/altflow.dart';
import 'package:ticket_raising_management/core/widgets/logs.dart';

class RAL extends ConsumerStatefulWidget {
  final TicketEntity data;
  final Widget? child;

  const RAL({super.key, required this.data, this.child});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RALState();
}

class _RALState extends ConsumerState<RAL> with TickerProviderStateMixin {
  late TabController _controller;

  final List<Tab> _tabs = [
    const Tab(text: 'Resolution'),
    const Tab(text: 'Alt Flow'),
    const Tab(text: 'Logs'),
  ];

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: double.infinity,
        color: AppColors.paleIndigo,
        child: Theme(
          data: ThemeData.light(useMaterial3: false),
          child: TabBar(
            labelStyle: Theme.of(context).textTheme.bodySmall,
            labelColor: AppColors.blue,
            indicatorColor: AppColors.blue,
            unselectedLabelColor: AppColors.grey,
            controller: _controller,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: _tabs,
          ),
        ),
      ),
      const SizedBox(height: Dimen.space * 2),
      if (_controller.index == 0) HmsResolution(data: widget.data),
      if (_controller.index == 1) AltFlow(data: widget.data),
      if (_controller.index == 2) const Logs(),
    ]);
  }
}

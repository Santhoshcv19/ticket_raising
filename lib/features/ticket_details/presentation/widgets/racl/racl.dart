import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/common/domain/entity/ticket.entity.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/racl/altflow.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/racl/comments.dart';
import 'package:ticket_raising_management/core/widgets/logs.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/racl/resolution.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/racl/comment_field.dart';

class RACL extends ConsumerStatefulWidget {
  final TicketEntity data;
  final Widget? child;

  const RACL({super.key, required this.data, this.child});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RACLState();
}

class _RACLState extends ConsumerState<RACL> with TickerProviderStateMixin {
  late TabController _controller;

  final List<Tab> _tabs = [
    const Tab(text: 'Resolution'),
    const Tab(text: 'Alt Flow'),
    const Tab(text: 'Comments'),
    const Tab(text: 'Logs'),
  ];

  @override
  void initState() {
    _controller = TabController(length: 4, vsync: this);
    _controller.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: Dimen.icon * 2.5,
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
      if (_controller.index == 0) Resolution(data: widget.data),
      if (_controller.index == 1) AltFlow(data: widget.data),
      if (_controller.index == 2) const Comments(),
      if (_controller.index == 2) const SizedBox(height: Dimen.space * 2),
      if (_controller.index == 2) const CommentField(),
      if (_controller.index == 3) const Logs(),
    ]);
  }
}

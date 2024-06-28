import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/styles/border_radius.style.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';

class HmsTicketStausTab extends ConsumerWidget {
  final TabController controller;

  const HmsTicketStausTab({super.key, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      margin: Dimen.horizontalMargin * 5,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: radius4,
      ),
      alignment: Alignment.center,
      child: TabBar(
        isScrollable: true,
        dividerHeight: 0,
        indicatorColor: Colors.transparent,
        labelColor: AppColors.primary,
        controller: controller,
        tabs: const [
          Tab(text: 'All'),
          Tab(text: 'Open / Reopened'),
          Tab(text: 'Resolved'),
          Tab(text: 'Closed'),
        ],
      ),
    );
  }
}

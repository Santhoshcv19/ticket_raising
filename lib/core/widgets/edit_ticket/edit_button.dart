import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';

class EditTicketButtonPage extends ConsumerWidget {
  final Widget child;
  const EditTicketButtonPage({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      tooltip: 'Edit',
      onPressed: () {
        navigator?.pop();
        showDialog(
          context: context,
          builder: (context) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SizedBox(width: Dimen.icon * 30, child: child)],
          ),
        );
      },
      icon: const Icon(Icons.edit, color: AppColors.primary),
      iconSize: Dimen.icon,
    );
  }
}

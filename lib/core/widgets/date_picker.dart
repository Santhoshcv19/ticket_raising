import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/styles/border_radius.style.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/buttons/secondary_button.dart';
import 'package:ticket_raising_management/core/utils/extensions/datetime.extension.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_caption.text.dart';

class AppDatePicker extends ConsumerWidget {
  final DateTime firstDate;
  final DateTime lastDate;
  final Function? onDelete;
  final Function(DateTime) onPicked;
  final String? text;
  final DateTime? dateTime;
  final double? height;

  const AppDatePicker({
    super.key,
    required this.firstDate,
    required this.lastDate,
    required this.onPicked,
    this.onDelete,
    this.text,
    this.dateTime,
    this.height,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SecondaryButton(
      height: height ?? 45,
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          firstDate: firstDate,
          lastDate: lastDate,
          currentDate: dateTime,
        );
        if (picked == null) return;
        onPicked(picked);
      },
      shape: RoundedRectangleBorder(
        borderRadius: radius8,
        side: BorderSide(color: AppColors.grey300),
      ),
      child: Row(children: [
        if (dateTime != null)
          AppSubCaptionText(
            data: dateTime!.formatddMMMYYYY(),
            fontSize: 12,
            color: AppColors.blackgrey,
          ),
        if (dateTime == null)
          AppSubCaptionText(
            data: text,
            fontSize: 12,
            color: AppColors.blackgrey,
          ),
        const Spacer(),
        if (dateTime == null)
          Icon(
            Icons.calendar_today,
            size: Dimen.icon,
            color: AppColors.grey300,
          ),
        if (dateTime != null && onDelete != null)
          IconButton(
            onPressed: () => onDelete!(),
            icon: const Icon(
              Icons.delete,
              size: Dimen.icon,
              color: AppColors.red,
            ),
          ),
      ]),
    );
  }
}

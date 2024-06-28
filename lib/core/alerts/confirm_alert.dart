import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:ticket_raising_management/core/styles/border_radius.style.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/buttons/secondary_button.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_body.text.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_title.text.dart';

class ConfirmAlert extends ConsumerWidget {
  final String title;
  final Function onConfirm;
  final String confirmText;
  final String cancelText;

  const ConfirmAlert({
    super.key,
    required this.onConfirm,
    required this.title,
    this.confirmText = 'Confirm',
    this.cancelText = 'Cancel',
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: radius4),
      elevation: 0,
      contentPadding: Dimen.scaffoldMargin * 2,
      title: AppSubTitleText(data: title, fontWeight: FontWeight.bold),
      content: Row(children: [
        Expanded(
          child: SecondaryButton(
            elevation: 0,
            color: AppColors.red,
            shape: RoundedRectangleBorder(borderRadius: radius16),
            onTap: onConfirm,
            child: AppSubBodyText(data: confirmText, color: AppColors.white),
          ),
        ),
        const SizedBox(width: Dimen.space * 1.5),
        Expanded(
          child: SecondaryButton(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: radius16,
              side: BorderSide(width: 1, color: AppColors.grey300),
            ),
            child: AppSubBodyText(data: cancelText, color: AppColors.grey),
            onTap: () => navigator?.pop(),
          ),
        ),
      ]),
    );
  }
}

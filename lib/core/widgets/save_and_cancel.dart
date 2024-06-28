import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/buttons/primary_text_button.dart';

class SaveAndCancel extends ConsumerWidget {
  final Function onSave;
  final Function onCancel;

  const SaveAndCancel({
    super.key,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      PrimaryTextButton(
        text: 'Cancel',
        onTap: onCancel,
        fontColor: AppColors.red,
      ),
      const SizedBox(width: Dimen.space),
      PrimaryTextButton(
        text: 'Save',
        onTap: onSave,
        // onTap: () {
        //   onSave;
        //   Utils.toast('Saved Succesfully!');
        // },
        fontColor: AppColors.primary,
      ),
    ]);
  }
}

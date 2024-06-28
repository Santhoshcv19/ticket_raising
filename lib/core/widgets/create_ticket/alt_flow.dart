import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/buttons/primary_text_button.dart';
import 'package:ticket_raising_management/core/utils/textfields/form.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_caption.text.dart';
import 'package:ticket_raising_management/features/tickets/presentation/logic/others/logic.dart';

class AltFlowField extends ConsumerWidget {
  const AltFlowField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(ticketLogic);
    final logic = ref.watch(ticketLogic);

    if (!logic.isClick) {
      return Row(children: [
        const AppSubCaptionText(
          data: 'Do you want to record the work around?',
          fontSize: 10,
          color: AppColors.black,
        ),
        PrimaryTextButton(
          text: 'click Here',
          fontSize: 10,
          onTap: provider.onClickHere,
        )
      ]);
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const AppSubCaptionText(data: 'ALT FLOW'),
      const SizedBox(height: Dimen.space),
      AppFormField(
        controller: provider.altflow,
        contentPadding: Dimen.textMargin,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey300),
        ),
      ),
    ]);
  }
}

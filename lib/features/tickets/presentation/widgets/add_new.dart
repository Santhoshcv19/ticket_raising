import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/styles/border_radius.style.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/buttons/secondary_button.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_caption.text.dart';
import 'package:ticket_raising_management/features/tickets/presentation/widgets/create_ticket.dart';

class HmsAddNew extends ConsumerWidget {
  const HmsAddNew({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SecondaryButton(
      color: AppColors.primary,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: radius8),
      child: const Row(children: [
        Icon(Icons.add, color: AppColors.white, size: Dimen.icon),
        SizedBox(width: Dimen.space * .5),
        AppSubCaptionText(data: 'Add new', color: AppColors.white),
      ]),
      onTap: () => showDialog(
        context: context,
        builder: (context) => const HmsAddTicket(),
      ),
    );
  }
}

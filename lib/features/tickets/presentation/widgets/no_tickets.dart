import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/assets/assets.dart';
import 'package:ticket_raising_management/core/utils/buttons/secondary_text_button.dart';
import 'package:ticket_raising_management/core/utils/texts/body.text.dart';
import 'package:ticket_raising_management/core/widgets/image.dart';
import 'package:ticket_raising_management/features/tickets/presentation/widgets/create_ticket.dart';

class HmsNoTickets extends ConsumerWidget {
  const HmsNoTickets({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(children: [
      const Spacer(),
      const Photo(image: Assets.noTickets, size: 130),
      const SizedBox(height: Dimen.space),
      const AppBodyText(data: 'Currently there are no tickets'),
      const SizedBox(height: Dimen.space),
      SecondaryTextButton(
        icon: const Icon(Icons.add, size: Dimen.icon, color: AppColors.primary),
        text: 'Raise a new Ticket',
        onTap: () => showDialog(
          context: context,
          builder: (context) => const HmsAddTicket(),
        ),
      ),
      const Spacer(),
    ]);
  }
}

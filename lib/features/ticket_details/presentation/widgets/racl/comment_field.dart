import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/controller/app_data.controller.dart';
import 'package:ticket_raising_management/core/controller/rights.controller.dart';
import 'package:ticket_raising_management/core/styles/border_radius.style.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/assets/assets.dart';
import 'package:ticket_raising_management/core/utils/textfields/form.dart';
import 'package:ticket_raising_management/core/widgets/image.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/params.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/others/logic.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/provider.dart';

class CommentField extends ConsumerWidget {
  const CommentField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(ticketDetailsLogic).data;

    final provider = ref.read(ticketDetailsLogic);
    final notifier = ref.read(ticketActionNotifier.notifier);

    final hasRights = rightsController.hasTicketRights(data);

    if (!hasRights) return const SizedBox();

    return AppFormField(
      controller: provider.comments,
      contentPadding: Dimen.textMargin,
      border: OutlineInputBorder(
        borderRadius: radius8,
        borderSide: BorderSide(color: AppColors.grey300),
      ),
      hintText: 'Type your text here...',
      suffixIcon: IconButton(
        icon: const Svg(svg: Assets.send, color: AppColors.grey),
        onPressed: () async {
          final user = appController.user;
          final params = TicketDetailsParams(
            commentedBy: user?.iD,
            comment: provider.comments.text,
            ticketId: data?.ref?.id,
          );
          await notifier.addComment(params);
        },
      ),
    );
  }
}

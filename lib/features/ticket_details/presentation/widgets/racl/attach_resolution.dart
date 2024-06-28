import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/common/logic/provider.dart';
import 'package:ticket_raising_management/core/constants/file.constants.dart';
import 'package:ticket_raising_management/core/controller/rights.controller.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/assets/assets.dart';
import 'package:ticket_raising_management/core/utils/buttons/secondary_button.dart';
import 'package:ticket_raising_management/core/utils/texts/caption.text.dart';
import 'package:ticket_raising_management/core/utils/utils.dart';
import 'package:ticket_raising_management/core/widgets/create_ticket/picked_files.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/others/logic.dart';

class AttachResolution extends ConsumerWidget {
  const AttachResolution({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(ticketDetailsLogic);
    final notifier = ref.read(fileNotifier.notifier);
    final state = ref.watch(fileNotifier);

    final hasRights = rightsController.hasTicketRights(provider.data);

    ref.listen(fileNotifier, (previous, next) {
      next.whenOrNull(file: provider.onFilesPicked);
    });

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const AppCaptionText(data: 'ATTACHMENTS'),
      const SizedBox(height: Dimen.space),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          DottedBorder(
            color: AppColors.grey300,
            child: SecondaryButton(
              width: 100,
              height: 100,
              shape: const RoundedRectangleBorder(),
              onTap: () async {
                if (hasRights) return await notifier.pickFile();
                return Utils.toast('You do not have access to this ticket');
              },
              child: Icon(Icons.camera_alt, color: AppColors.grey300),
            ),
          ),
          const SizedBox(width: Dimen.space),
          state.maybeWhen(
            orElse: () => const SizedBox(),
            file: (data) {
              if ((data ?? []).isEmpty) return const SizedBox();
              return Row(
                children: data!.map((e) {
                  final type = e.name.split('.').last;

                  if (FileConstants.images.contains(type)) {
                    return PickedFiles(file: e, icon: Assets.image);
                  } else if (FileConstants.video.contains(type)) {
                    return PickedFiles(file: e, icon: Assets.video);
                  } else if (FileConstants.audio.contains(type)) {
                    return PickedFiles(file: e, icon: Assets.music);
                  } else if (FileConstants.files.contains(type)) {
                    return PickedFiles(file: e, icon: Assets.pdf);
                  } else {
                    return const SizedBox();
                  }
                }).toList(),
              );
            },
          ),
        ]),
      ),
    ]);
  }
}

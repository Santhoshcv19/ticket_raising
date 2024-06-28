import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/common/logic/provider.dart';
import 'package:ticket_raising_management/core/constants/file.constants.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/assets/assets.dart';
import 'package:ticket_raising_management/core/utils/buttons/secondary_button.dart';
import 'package:ticket_raising_management/core/widgets/create_ticket/picked_files.dart';

class AttachEvidence extends ConsumerWidget {
  const AttachEvidence({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(fileNotifier.notifier);
    final state = ref.watch(fileNotifier);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        DottedBorder(
          color: AppColors.grey300,
          child: SecondaryButton(
            width: 100,
            height: 100,
            shape: const RoundedRectangleBorder(),
            onTap: notifier.pickFile,
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
    );
  }
}

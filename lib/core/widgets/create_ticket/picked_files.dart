import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/common/logic/provider.dart';
import 'package:ticket_raising_management/core/styles/border_radius.style.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/buttons/secondary_button.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_caption.text.dart';
import 'package:ticket_raising_management/core/widgets/image.dart';

class PickedFiles extends ConsumerWidget {
  final PlatformFile file;
  final String icon;

  const PickedFiles({super.key, required this.file, required this.icon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(fileNotifier.notifier);

    return Container(
      height: 120,
      width: 130,
      alignment: Alignment.center,
      child: Stack(alignment: AlignmentDirectional.center, children: [
        Container(
          height: 100,
          width: 100,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(width: .5, color: AppColors.grey300),
            borderRadius: radius4,
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Spacer(),
            Photo(image: icon, size: Dimen.icon * 2),
            const Spacer(),
            AppSubCaptionText(data: file.name, fontSize: 8),
          ]),
        ),
        Align(
          alignment: Alignment.topRight,
          child: SecondaryButton(
            height: 3,
            width: 3,
            shape: const CircleBorder(),
            color: AppColors.red,
            child: const Icon(Icons.remove, color: AppColors.white, size: 20),
            onTap: () => notifier.remove(file),
          ),
        ),
      ]),
    );
  }
}

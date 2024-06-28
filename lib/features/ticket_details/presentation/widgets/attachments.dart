import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:ticket_raising_management/core/common/domain/entity/ticket.entity.dart';
import 'package:ticket_raising_management/core/styles/border_radius.style.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/assets/assets.dart';
import 'package:ticket_raising_management/core/utils/buttons/secondary_button.dart';
import 'package:ticket_raising_management/core/utils/texts/caption.text.dart';
import 'package:ticket_raising_management/core/widgets/attachment_view/attachment.dart';
import 'package:ticket_raising_management/core/widgets/image.dart';

class Attachments extends ConsumerWidget {
  final List<AttachmentEntity> data;

  const Attachments({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<AttachmentEntity> images = [];
    List<AttachmentEntity> videos = [];
    List<AttachmentEntity> audios = [];
    List<AttachmentEntity> pdfs = [];

    for (var element in data) {
      images.addIf(element.type == 1, element);
      videos.addIf(element.type == 2, element);
      audios.addIf(element.type == 3, element);
      pdfs.addIf(element.type == 4, element);
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const AppCaptionText(data: 'ATTACHMENTS'),
      const SizedBox(height: Dimen.space),
      Row(children: [
        if (images.isNotEmpty)
          SecondaryButton(
            onTap: () => showDialog(
              context: context,
              builder: (context) => AttachmentView(data: data, type: 1),
            ),
            elevation: 0,
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: radius4,
              side: BorderSide(width: 1, color: AppColors.grey300),
            ),
            child: const Photo(image: Assets.image, size: Dimen.icon),
          ),
        if (images.isNotEmpty) const SizedBox(width: Dimen.space * 2),
        if (videos.isNotEmpty)
          SecondaryButton(
            onTap: () => showDialog(
              context: context,
              builder: (context) => AttachmentView(data: data, type: 2),
            ),
            elevation: 0,
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: radius4,
              side: BorderSide(width: 1, color: AppColors.grey300),
            ),
            child: const Photo(image: Assets.video, size: Dimen.icon),
          ),
        if (videos.isNotEmpty) const SizedBox(width: Dimen.space * 2),
        if (audios.isNotEmpty)
          SecondaryButton(
            onTap: () => showDialog(
              context: context,
              builder: (context) => AttachmentView(data: data, type: 3),
            ),
            elevation: 0,
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: radius4,
              side: BorderSide(width: 1, color: AppColors.grey300),
            ),
            child: const Photo(image: Assets.music, size: Dimen.icon),
          ),
        if (audios.isNotEmpty) const SizedBox(width: Dimen.space * 2),
        if (pdfs.isNotEmpty)
          SecondaryButton(
            onTap: () => showDialog(
              context: context,
              builder: (context) => AttachmentView(data: data, type: 4),
            ),
            elevation: 0,
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: radius4,
              side: BorderSide(width: 1, color: AppColors.grey300),
            ),
            child: const Photo(image: Assets.pdf, size: Dimen.icon),
          ),
      ]),
    ]);
  }
}

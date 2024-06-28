import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/common/domain/entity/ticket.entity.dart';
import 'package:ticket_raising_management/core/providers/providers.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/extensions/datetime.extension.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_caption.text.dart';
import 'package:ticket_raising_management/core/utils/utils.dart';
import 'package:ticket_raising_management/core/widgets/card.dart';

class Comment extends ConsumerWidget {
  final CommentEntity data;

  const Comment({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateTime = Utils.convertDateTime(data.createdAt);
    final user = ref.read(userProvider.notifier);

    return KCard(
      color: AppColors.paleSandal,
      padding: Dimen.textMargin,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        AppSubCaptionText(
            data: data.comment, maxLines: null, color: AppColors.black),
        const SizedBox(height: Dimen.space * 2),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          AppSubCaptionText(
            data: user.getUserFromId(data.commentedBy),
            fontSize: 8,
          ),
          AppSubCaptionText(data: dateTime?.formatddMMMYYYYHHmm(), fontSize: 8),
        ]),
      ]),
    );
  }
}

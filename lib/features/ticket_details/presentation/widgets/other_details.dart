import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/controller/master.controller.dart' as trm;
import 'package:ticket_raising_management/core/providers/providers.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/extensions/datetime.extension.dart';
import 'package:ticket_raising_management/core/utils/texts/caption.text.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_caption.text.dart';
import 'package:ticket_raising_management/core/utils/utils.dart';
import 'package:ticket_raising_management/core/widgets/card.dart';
import 'package:ticket_raising_management/core/widgets/chip.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/others/logic.dart';

class OtherDetails extends ConsumerWidget {
  const OtherDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userProvider.notifier);
    final data = ref.watch(ticketDetailsLogic).data;

    final dT = Utils.convertDateTime(data?.createdAt);

    return KCard(
      padding: Dimen.scaffoldMargin,
      color: AppColors.paleIndigo,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const AppCaptionText(data: 'TYPE'),
        const SizedBox(height: Dimen.space * .5),
        ManualChip(
          label: trm.masterController.parseType(data?.type),
          color: AppColors.lightIndigo,
        ),
        const SizedBox(height: Dimen.space * 2),
        const AppCaptionText(data: 'CATEGORY'),
        const SizedBox(height: Dimen.space * .5),
        ManualChip(
          label: trm.masterController.parseCategory(data?.category),
          color: AppColors.lightBlue,
        ),
        const SizedBox(height: Dimen.space * 2),
        const AppCaptionText(data: 'CLIENT'),
        const SizedBox(height: Dimen.space * .5),
        ManualChip(
          label: trm.masterController.parseClient(data?.client),
          color: AppColors.lightIndigo,
        ),
        const SizedBox(height: Dimen.space * 2),
        const AppCaptionText(data: 'REPORTING DATE'),
        const SizedBox(height: Dimen.space * .5),
        AppSubCaptionText(data: dT?.formatddMMMYYYY(), color: AppColors.black),
        const SizedBox(height: Dimen.space * 2),
        const AppCaptionText(data: 'RAISED BY'),
        const SizedBox(height: Dimen.space * .5),
        AppSubCaptionText(
          data:
              '${user.getUserFromId(data?.createdBy)}(${user.getRolesFromId(data?.createdBy)})',
          color: AppColors.black,
        ),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:ticket_raising_management/core/styles/border_radius.style.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/buttons/secondary_button.dart';
import 'package:ticket_raising_management/core/utils/extensions/datetime.extension.dart';
import 'package:ticket_raising_management/core/utils/textfields/form.dart';
import 'package:ticket_raising_management/core/utils/texts/caption.text.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_body.text.dart';
import 'package:ticket_raising_management/core/utils/texts/sub_caption.text.dart';
import 'package:ticket_raising_management/core/utils/utils.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/params.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/others/logic.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/provider.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/widgets/actions/email/sent_message.dart';

class EmailCustomer extends ConsumerStatefulWidget {
  const EmailCustomer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EmailCustomerState();
}

class _EmailCustomerState extends ConsumerState<EmailCustomer> {
  Future<void> _onSend() async {
    final notifier = ref.read(emailNotifier.notifier);
    final provider = ref.read(ticketDetailsLogic);

    final dateTIme = Utils.convertDateTime(provider.data?.createdAt);

    var params = TicketDetailsParams(
      ticketId: provider.data?.ticketId,
      emailId: provider.to.text,
      subject: provider.subject.text,
      description: provider.mailDescription.text,
      ticketDateTime: dateTIme?.formatddMMMYYYYHHmm(),
    );

    await notifier.sendEmail(params);
    if (!mounted) return;
    Utils.pop(context);
  }

  @override
  void initState() {
    final provider = ref.read(ticketDetailsLogic);
    provider.clearFields();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final logic = ref.watch(ticketDetailsLogic);

    ref.listen(emailNotifier, (previous, next) {
      next.whenOrNull(
        loading: () => Utils.showLoader(context),
        data: () {
          Utils.dismissLoader(context);
          showDialog(
            context: context,
            builder: (context) => const SentMessage(),
          );
          navigator?.pop();
        },
        error: () {
          Utils.dismissLoader(context);
        },
      );
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 450),
      child: Card(
        elevation: 0,
        margin: Dimen.scaffoldMargin,
        shape: const RoundedRectangleBorder(),
        child: ListView(
          padding: Dimen.scaffoldMargin * 2,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const AppSubBodyText(
                data: 'Email Customer About Status',
                fontWeight: FontWeight.bold,
              ),
              IconButton(
                onPressed: () {
                  navigator?.pop();
                },
                icon: const Icon(
                  Icons.close,
                  color: AppColors.grey,
                  size: 30,
                ),
              )
            ]),
            const Divider(),
            const SizedBox(height: Dimen.space * 3),
            const AppCaptionText(data: 'TO'),
            const SizedBox(height: Dimen.space),
            Row(children: [
              Expanded(
                flex: 2,
                child: AppFormField(
                  controller: logic.to,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.grey300)),
                  validator: (value) {
                    if ((value ?? '').isEmpty) return 'Required';
                    return null;
                  },
                ),
              ),
              const Spacer(flex: 1),
            ]),
            const SizedBox(height: Dimen.space * 3),
            const AppCaptionText(data: 'FROM'),
            const SizedBox(height: Dimen.space),
            Row(children: [
              Expanded(
                flex: 2,
                child: AppFormField(
                  enabled: false,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.grey300)),
                  hintText: 'ursugar27172@gmail.com',
                ),
              ),
              const Spacer(flex: 1),
            ]),
            const SizedBox(height: Dimen.space * 3),
            const AppCaptionText(data: 'SUBJECT'),
            const SizedBox(height: Dimen.space),
            Row(children: [
              Expanded(
                flex: 2,
                child: AppFormField(
                  controller: logic.subject,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.grey300)),
                  validator: (value) {
                    if ((value ?? '').isEmpty) return 'Required';
                    return null;
                  },
                ),
              ),
              const Spacer(flex: 1),
            ]),
            const SizedBox(height: Dimen.space * 3),
            const AppCaptionText(data: 'MAIL DESCRIPTION'),
            const SizedBox(height: Dimen.space),
            Row(children: [
              Expanded(
                child: AppFormField(
                  controller: logic.mailDescription,
                  maxLines: 7,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.grey300)),
                  validator: (value) {
                    if ((value ?? '').isEmpty) return 'Required';
                    return null;
                  },
                ),
              ),
            ]),
            const SizedBox(height: Dimen.space * 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Spacer(
                  flex: 3,
                ),
                Expanded(
                  flex: 1,
                  child: SecondaryButton(
                      elevation: 0,
                      padding: Dimen.textMargin * 2,
                      shape: RoundedRectangleBorder(borderRadius: radius6),
                      child: const AppSubCaptionText(
                        data: 'Cancel',
                        fontSize: 12,
                      ),
                      onTap: () {
                        navigator?.pop();
                      }),
                ),
                const SizedBox(width: Dimen.space),
                Expanded(
                  flex: 1,
                  child: SecondaryButton(
                    elevation: 0,
                    padding: Dimen.textMargin * 2,
                    shape: RoundedRectangleBorder(borderRadius: radius6),
                    color: AppColors.blue,
                    onTap: () {
                      _onSend();
                      // showDialog(
                      //   context: context,
                      //   builder: (i) {
                      //     return const SuccessAlert(
                      //       content: 'Email sent successfully',
                      //     );
                      //   },
                      // );
                    },
                    child: const AppSubCaptionText(
                      fontSize: 12,
                      data: 'Send',
                      color: AppColors.white,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

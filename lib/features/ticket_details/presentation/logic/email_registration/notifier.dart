import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/get_email.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/params.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/email_registration/state.dart';

class EmailNotifier extends StateNotifier<EmailState> {
  final SendEmail _emailRegistration;

  EmailNotifier({
    required SendEmail emailRegistration,
  })  : _emailRegistration = emailRegistration,
        super(const EmailState.initial());

  Future<void> sendEmail(TicketDetailsParams params) async {
    state = const EmailState.loading();
    final list = await _emailRegistration.call(params);
    list.fold(
      (l) => state = const EmailState.error(),
      (r) => state = const EmailState.data(),
    );
  }
}

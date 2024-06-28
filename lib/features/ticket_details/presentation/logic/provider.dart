import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/features/ticket_details/data/datasource/remote_datasource.dart';
import 'package:ticket_raising_management/features/ticket_details/data/repository/repository.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/repository/repository.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/add_comment.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/child_link.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/clone_ticket.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/delete_children.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/fetch_attachments.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/fetch_children.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/fetch_comments.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/fetch_details.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/fetch_logs.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/fetch_tickets.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/get_email.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/lock.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/unlock.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/update_resolution.dart';
import 'package:ticket_raising_management/features/ticket_details/domain/usecase/update_tech_assigned.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/attachments/notifier.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/attachments/state.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/children/notifier.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/children/state.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/comments/notifier.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/comments/state.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/email_registration/notifier.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/email_registration/state.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/logs/notifier.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/logs/state.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/others/logic.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/ticket_actions/notifier.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/ticket_actions/state.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/ticket_details/state.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/ticket_details/notifier.dart';
import 'package:ticket_raising_management/features/ticket_details/presentation/logic/timer/timer.dart';
import 'package:ticket_raising_management/services/provider.dart';

final _remoteDatasource = Provider<TicketDetailsRemoteDatasource>(
  (ref) => TicketDetailsRemoteDatasourceImpl(
    firebaseService: ref.read(firebaseService),
    apiservice: ref.read(apiService),
  ),
);

final _repository = Provider<TicketDetailsRepository>(
  (ref) => TicketDetailsRepositoryImpl(
    remoteDatasource: ref.read(_remoteDatasource),
  ),
);

final _fetchTickets = Provider<FetchTickets>(
  (ref) => FetchTickets(repository: ref.read(_repository)),
);

final _fetchDetails = Provider<FetchDetails>(
  (ref) => FetchDetails(repository: ref.read(_repository)),
);

final _fetchAttachments = Provider<FetchAttachments>(
  (ref) => FetchAttachments(repository: ref.read(_repository)),
);

final _fetchComments = Provider<FetchComments>(
  (ref) => FetchComments(repository: ref.read(_repository)),
);

final _fetchChildren = Provider<FetchChildren>(
  (ref) => FetchChildren(repository: ref.read(_repository)),
);

final _fetchLogs = Provider<FetchLogs>(
  (ref) => FetchLogs(repository: ref.read(_repository)),
);

final _updateResolution = Provider<UpdateResolution>(
  (ref) => UpdateResolution(repository: ref.read(_repository)),
);

final _lockTicket = Provider<LockTicket>(
  (ref) => LockTicket(repository: ref.read(_repository)),
);

final _unLockProvider = Provider<UnLock>(
  (ref) => UnLock(repository: ref.read(_repository)),
);

final _cloneTicket = Provider<CloneTicket>(
  (ref) => CloneTicket(repository: ref.read(_repository)),
);

final _addComment = Provider<AddComment>(
  (ref) => AddComment(repository: ref.read(_repository)),
);

final _linkChild = Provider<LinkChild>(
  (ref) => LinkChild(repository: ref.read(_repository)),
);

final _techAssigned = Provider<UpdateTechAssigned>(
  (ref) => UpdateTechAssigned(repository: ref.read(_repository)),
);
final _email = Provider<SendEmail>(
  (ref) => SendEmail(ticketDetailsRepository: ref.read(_repository)),
);
final _deleteChildren = Provider<DeleteChildren>(
    (ref) => DeleteChildren(repository: ref.read(_repository)));

final ticketActionNotifier =
    StateNotifierProvider<TicketActionNotifier, TicketActionState>(
  (ref) => TicketActionNotifier(
    deleteChildren: ref.read(_deleteChildren),
    fetchTickets: ref.read(_fetchTickets),
    updateResolution: ref.read(_updateResolution),
    lockTicket: ref.read(_lockTicket),
    unLock: ref.read(_unLockProvider),
    cloneTicket: ref.read(_cloneTicket),
    addComment: ref.read(_addComment),
    linkChild: ref.read(_linkChild),
    techAssigned: ref.read(_techAssigned),
  ),
);

final ticketDetailsNotifier =
    StateNotifierProvider<TicketDetailsNotifier, TicketDetailsState>(
  (ref) => TicketDetailsNotifier(
    fetchDetailsData: ref.read(_fetchDetails),
    logic: ref.read(ticketDetailsLogic),
  ),
);

final attachmentsNotifier =
    StateNotifierProvider<AttachmentsNotifier, AttachmentsState>(
  (ref) => AttachmentsNotifier(
    fetchAttachments: ref.read(_fetchAttachments),
    fileService: ref.read(fileService),
  ),
);

final commentsNotifier = StateNotifierProvider<CommentNotifier, CommentState>(
  (ref) => CommentNotifier(fetchComments: ref.read(_fetchComments)),
);

final logsNotifier = StateNotifierProvider<LogNotifier, LogState>(
  (ref) => LogNotifier(fetchLogs: ref.read(_fetchLogs)),
);

final childrenNotifier = StateNotifierProvider<ChildrenNotifier, ChildrenState>(
  (ref) => ChildrenNotifier(fetchChildren: ref.read(_fetchChildren)),
);

final timerNotifier = StateNotifierProvider<TimerNotifier, int>(
  (ref) => TimerNotifier(),
);

final emailNotifier = StateNotifierProvider<EmailNotifier, EmailState>(
  (ref) => EmailNotifier(emailRegistration: ref.read(_email)),
);

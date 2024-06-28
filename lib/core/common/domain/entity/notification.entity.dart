import 'package:equatable/equatable.dart';

class NotificationEntity extends Equatable {
  final int? id;
  final String? title;
  final String? body;
  final int? messageId;
  final int? timeStamp;
  final int? category;

  const NotificationEntity({
    required this.id,
    required this.title,
    required this.body,
    required this.timeStamp,
    required this.category,
    required this.messageId,
  });

  @override
  List<Object?> get props => [id, title, body, messageId, timeStamp, category];
}

import 'package:ticket_raising_management/core/common/domain/entity/notification.entity.dart';

class LocalNotificationModel extends NotificationEntity {
  const LocalNotificationModel({
    required super.id,
    required super.title,
    required super.body,
    required super.timeStamp,
    required super.category,
    required super.messageId,
  });

  factory LocalNotificationModel.fromJson(Map<String, String?> json) {
    return LocalNotificationModel(
      id: int.tryParse(json['id'] ?? ''),
      title: json['title'],
      body: json['body'],
      timeStamp: int.tryParse(json['time_stamp'] ?? ''),
      messageId: int.tryParse(json['message_id'] ?? ''),
      category: int.tryParse(json['category'] ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['time_stamp'] = timeStamp;
    data['category'] = category;
    data['message_id'] = messageId;

    return data;
  }

  Map<String, String?> toPayload() {
    final Map<String, String?> data = <String, String?>{};

    data['id'] = '$id';
    data['title'] = '$title';
    data['body'] = '$body';
    data['time_stamp'] = '$timeStamp';
    data['category'] = '$category';
    data['message_id'] = '$messageId';

    return data;
  }
}

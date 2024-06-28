import 'package:ticket_raising_management/core/common/domain/entity/ticket.entity.dart';
import 'package:ticket_raising_management/core/utils/utils.dart';

class TicketHelper {
  static String getResolutionTime(TicketEntity? data) {
    if (data == null) return '';

    final startTime = Utils.convertDateTime(data.startTime);
    final resolvedAt = Utils.convertDateTime(data.resolvedAt);

    if (startTime == null) return '';
    if (resolvedAt == null) return '';

    final difference = resolvedAt.difference(startTime);

    return getHMS(difference.inSeconds);
  }

  static getClosingTime(TicketEntity? data) {
    if (data == null) return '';
    final createdAt = Utils.convertDateTime(data.createdAt);
    final closedAt = Utils.convertDateTime(data.closedAt);

    if (createdAt == null) return '';
    if (closedAt == null) return '';

    final difference = closedAt.difference(createdAt);

    return getHMS(difference.inSeconds);
  }

  static String getHMS(int? seconds) {
    if (seconds == null) return '00H : 00M :00S';

    if (seconds < 10) return '00H :00M :0${seconds}S';
    if (seconds < 60) return '00H :00M :${seconds}S';

    double rawminutes = seconds / 60;
    double rawhours = seconds / 3600;

    int sec = seconds % 60;
    int min = (rawminutes % 60).toInt();
    int hours = rawhours.toInt();

    String finalsec = '$sec';
    String finalmin = '$min';
    String finalhours = '$hours';

    if (sec < 10) finalsec = '0$sec';
    if (min < 10) finalmin = '0$min';
    if (hours < 10) finalhours = '0$hours';

    return '${finalhours}H:${finalmin}M:${finalsec}S';
  }

  static String getDHM(int? seconds) {
    if (seconds == null) return '00D : 00H :00M';

    if (seconds < 10) return '00D :00H :0${seconds}M';
    if (seconds < 60) return '00D :00H :${seconds}M';

    double rawminutes = seconds / 60;
    double rawhours = seconds / 3600;
    double rawDay = seconds / 86400;

    int min = (rawminutes % 60).toInt();
    int hours = (rawhours % 24).toInt();
    int day = rawDay.toInt();

    String finalmin = '$min';
    String finalhours = '$hours';
    String finalDay = '$day';

    if (min < 10) finalmin = '0$min';
    if (hours < 10) finalhours = '0$hours';
    if (day < 10) finalDay = '0$day';

    return '${finalDay}D:${finalhours}H:${finalmin}M';
  }
}

class DateTimeHelper {
  static String geMonthName(int? month) {
    if (month == 1) return 'Jan';
    if (month == 2) return 'February';
    if (month == 3) return 'March';
    if (month == 4) return 'April';
    if (month == 5) return 'May';
    if (month == 6) return 'June';
    if (month == 7) return 'JUly';
    if (month == 8) return 'August';
    if (month == 9) return 'September';
    if (month == 10) return 'October';
    if (month == 11) return 'November';
    if (month == 12) return 'Demeber';
    return '';
  }

  static String getDayName(int? day) {
    if (day == DateTime.sunday) return 'Sunday';
    if (day == DateTime.monday) return 'Monday';
    if (day == DateTime.tuesday) return 'Tuesday';
    if (day == DateTime.wednesday) return 'Wednesday';
    if (day == DateTime.thursday) return 'Thursday';
    if (day == DateTime.friday) return 'Friday';
    if (day == DateTime.saturday) return 'Saturday';
    return '';
  }

  static int getDaysFromMonth(int? month, int? year) {
    if (month == null) return 0;

    if (month == 1) return 31;
    if (month == 2 && isLeapYear(year)) return 29;
    if (month == 2 && !isLeapYear(year)) return 28;
    if (month == 3) return 31;
    if (month == 4) return 30;
    if (month == 5) return 31;
    if (month == 6) return 30;
    if (month == 7) return 31;
    if (month == 8) return 31;
    if (month == 9) return 30;
    if (month == 10) return 31;
    if (month == 11) return 30;
    if (month == 12) return 31;
    return 30;
  }

  static int getDaysFromYear(int? year) {
    if (year == null) return 0;
    if (isLeapYear(year)) return 366;
    return 365;
  }

  static bool isLeapYear(int? year) {
    if (year == null) return false;

    if (year % 4 != 0) return false;
    if (year % 100 == 0 && year % 400 != 0) return false;
    if (year % 400 != 0) return false;
    return true;
  }

  static String getHMS(int? data) {
    if (data == null) return '00H : 00M :00S';

    int rawSeconds = data;
    if (rawSeconds.isNegative) rawSeconds = -rawSeconds;

    if (rawSeconds < 10) return '00H : 00M :0${rawSeconds}S';
    if (rawSeconds < 60) return '00H : 00M :${rawSeconds}S';

    double rawMinutes = rawSeconds / 60;
    double rawHours = rawSeconds / 3600;

    int seconds = (rawSeconds % 60);
    int minutes = (rawMinutes % 60).toInt();
    int hours = rawHours.floor();

    String finalHours = '$hours';
    String finalMins = '$minutes';
    String finalSecs = '$seconds';

    if (seconds < 10) finalSecs = '0$seconds';
    if (minutes < 10) finalMins = '0$minutes';
    if (hours < 10) finalHours = '0$hours';

    return '${finalHours}H : ${finalMins}M :${finalSecs}S';
  }
}

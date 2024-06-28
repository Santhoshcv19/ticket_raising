import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String format(DateFormat format) {
    return format.format(this);
  }

  String formatYYYYMMdd() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  String formatMMMdd() {
    return DateFormat('MMM dd').format(this);
  }

  String formatddMMMM() {
    return DateFormat('dd MMMM').format(this);
  }

  String formatMMMddYYYY() {
    return DateFormat('MMM dd, yyyy').format(this);
  }

  String formatMMMMddYYYY() {
    return DateFormat('MMMM dd, yyyy').format(this);
  }

  String formatMMMMYYYY() {
    return DateFormat('MMMM, yyyy').format(this);
  }

  String formatHHmm() {
    return DateFormat('hh:mm a').format(this);
  }

  String formatddMMMMYYYYHHmm() {
    return DateFormat('dd MMMM yyyy, hh:mm a').format(this);
  }

  String formatddMMMYYYYHHmm() {
    return DateFormat('dd MMM, yyyy | hh:mm a').format(this);
  }

  String formatddMMMYYYY() {
    return DateFormat('dd MMM, yyyy').format(this);
  }
}

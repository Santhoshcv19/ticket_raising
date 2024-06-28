class MediaHelper {
  static String duration(int? duration) {
    if (duration == null) return '00:00:00';

    if (duration < 10) return '00:00:0$duration';
    if (duration < 60) return '00:00:$duration';

    int sec = duration % 60;
    int min = (duration / 60).floor();

    if (min == 1 && sec == 0) return '00:0$min:00';
    if (min == 1 && sec != 0) return '00:0$min:$sec';

    if (sec == 0 && min < 10) return '00:0$min:00';
    if (sec == 0 && min > 10) return '00:$min:00';

    if (min < 10) return '00:0$min:$sec';
    return '00:$min:$sec';
  }
}

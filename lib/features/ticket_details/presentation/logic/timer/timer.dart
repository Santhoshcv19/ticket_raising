import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimerNotifier extends StateNotifier<int> {
  TimerNotifier() : super(0);

  Timer? _timer;

  final _duration = const Duration(seconds: 1);

  void initializeTimer(int time) {
    if (!mounted) return;
    state = state - time;
    _timer = Timer.periodic(_duration, (timer) {
      state = state - 1;
    });
  }

  void stopTimer() {
    if (!(_timer?.isActive ?? false)) return;
    _timer?.cancel();
  }

  void setTime(int time) => state = time;

  void loadTime(int time) => state = state - time;
}

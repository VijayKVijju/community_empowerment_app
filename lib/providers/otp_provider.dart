import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Stores OTP input
final otpProvider = StateProvider<List<String>>((ref) => ["", "", "", ""]);

/// Timer for resend button
final timerProvider = StateNotifierProvider<TimerNotifier, int>((ref) {
  return TimerNotifier();
});

class TimerNotifier extends StateNotifier<int> {
  TimerNotifier() : super(0);

  void start() {
    state = 60;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state == 0) {
        timer.cancel();
      } else {
        state--;
      }
    });
  }
}

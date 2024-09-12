import 'dart:async';

class InActivityController {
  final Function onLogout;
  final Function(int) onCountDownUpdate;
  Timer? _inactivityTimer;
  Timer? _countDownTimer;
  int _countDown = 30;

  InActivityController({
    required this.onLogout,
    required this.onCountDownUpdate,
  });

  void startInactivityTimer() {
    _inactivityTimer = Timer(const Duration(minutes: 1), _startCountdown);
  }

  void resetInactivityTimer() {
    _inactivityTimer?.cancel();
    _countDownTimer?.cancel();
    _countDown = 30;
    startInactivityTimer();
  }

  void _startCountdown() {
    _countDownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _countDown--;
      onCountDownUpdate(_countDown);
      if (_countDown == 0) {
        _logout();
      }
    });
  }

  void _logout() {
    _inactivityTimer?.cancel();
    _countDownTimer?.cancel();
    onLogout();
  }

  void dispose() {
    _inactivityTimer?.cancel();
    _countDownTimer?.cancel();
  }
}

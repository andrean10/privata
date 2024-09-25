import 'package:get/get.dart';
import 'dart:async';

class TimerController extends GetxController {
  final timeLeft = "01:00".obs;
  Timer? _timer;
  int totalSeconds;
  var countSeconds = 0;

  TimerController(this.totalSeconds);

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    countSeconds = totalSeconds;
    _timer = Timer.periodic(1.seconds, (timer) {
      if (countSeconds > 0) {
        countSeconds--;
        updateTimeLeft();
      } else {
        _timer?.cancel();
      }
    });
  }

  void updateTimeLeft() {
    int minutes = countSeconds ~/ 60;
    int seconds = countSeconds % 60;
    timeLeft.value =
        "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}

class Utils {
  static String formattedTimeInHourMinSec({required int timeInSecond}) {
    int h, m, s;

    h = timeInSecond ~/ 3600;

    m = ((timeInSecond - h * 3600)) ~/ 60;

    s = timeInSecond - (h * 3600) - (m * 60);

    String hourLeft = h.toString().length < 2 ? "0$h" : h.toString();

    String minuteLeft = m.toString().length < 2 ? "0$m" : m.toString();

    String secondsLeft = s.toString().length < 2 ? "0$s" : s.toString();

    if (hourLeft == '00') {
      return "${minuteLeft}m:${secondsLeft}s";
    }
    return "${hourLeft}h:${minuteLeft}m:${secondsLeft}s";
  }
}

part of 'colorize_interceptor.dart';

void color(
  String text, {
  Styles? front,
  Styles? back,
  bool isUnderline = false,
  bool isBold = false,
  bool isDark = false,
  bool isItalic = false,
  bool isReverse = false,
}) {
  Colorize string = Colorize(text);

  if (front != null) {
    string.apply(front);
  }

  if (back != null) {
    string.apply(back);
  }

  if (isUnderline) {
    string.apply(Styles.underline);
  }

  if (isBold) {
    string.apply(Styles.bold);
  }

  if (isDark) {
    string.apply(Styles.dark);
  }

  if (isItalic) {
    string.apply(Styles.italic);
  }

  if (isReverse) {
    string.apply(Styles.reverse);
  }
}

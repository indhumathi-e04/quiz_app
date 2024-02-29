part of 'colorize_interceptor.dart';

class Colorize {
  static const String esc = "\u{1B}";

  String initial = '';

  Colorize([this.initial = '']);

  Colorize apply(Styles style, [String? text]) {
    text ??= initial;

    initial = _applyStyle(style, text);
    return this;
  }

  Colorize bgBlack() {
    return apply(Styles.bgBlack);
  }

  Colorize bgBlue() {
    return apply(Styles.bgBlue);
  }

  Colorize bgCyan() {
    return apply(Styles.bgCyan);
  }

  Colorize bgDarkGray() {
    return apply(Styles.bgDarkGray);
  }

  Colorize bgDefault() {
    return apply(Styles.bgDefault);
  }

  Colorize bgGreen() {
    return apply(Styles.bgGreen);
  }

  Colorize bgLightBlue() {
    return apply(Styles.bgLightBlue);
  }

  Colorize bgLightCyan() {
    return apply(Styles.bgLightCyan);
  }

  Colorize bgLightGray() {
    return apply(Styles.bgLightGray);
  }

  Colorize bgLightGreen() {
    return apply(Styles.bgLightGreen);
  }

  Colorize bgLightMagenta() {
    return apply(Styles.bgLightMagenta);
  }

  Colorize bgLightRed() {
    return apply(Styles.bgLightRed);
  }

  Colorize bgLightYellow() {
    return apply(Styles.bgLightYellow);
  }

  Colorize bgMagenta() {
    return apply(Styles.bgMagenta);
  }

  Colorize bgRed() {
    return apply(Styles.bgRed);
  }

  Colorize bgWhite() {
    return apply(Styles.bgWhite);
  }

  Colorize bgYellow() {
    return apply(Styles.bgYellow);
  }

  Colorize black() {
    return apply(Styles.black);
  }

  Colorize blink() {
    return apply(Styles.blink);
  }

  Colorize blue() {
    return apply(Styles.blue);
  }

  Colorize bold() {
    return apply(Styles.bold);
  }

  String buildEscSeq(Styles style) {
    return "$esc[${getStyle(style)}m";
  }

  Colorize call(String text) {
    initial = text;
    return this;
  }

  Colorize concealed() {
    return apply(Styles.concealed);
  }

  Colorize cyan() {
    return apply(Styles.cyan);
  }

  Colorize dark() {
    return apply(Styles.dark);
  }

  Colorize darkGray() {
    return apply(Styles.darkGray);
  }

  Colorize defaultStyle() {
    return apply(Styles.default_);
  }

  Colorize green() {
    return apply(Styles.green);
  }

  Colorize italic() {
    return apply(Styles.italic);
  }

  Colorize lightBlue() {
    return apply(Styles.lightBlue);
  }

  Colorize lightCyan() {
    return apply(Styles.lightCyan);
  }

  Colorize lightGray() {
    return apply(Styles.lightGray);
  }

  Colorize lightGreen() {
    return apply(Styles.lightGreen);
  }

  Colorize lightMagenta() {
    return apply(Styles.lightMagenta);
  }

  Colorize lightRed() {
    return apply(Styles.lightRed);
  }

  Colorize lightYellow() {
    return apply(Styles.lightYellow);
  }

  Colorize magenta() {
    return apply(Styles.magenta);
  }

  Colorize red() {
    return apply(Styles.red);
  }

  Colorize reverse() {
    return apply(Styles.reverse);
  }

  @override
  String toString() {
    return initial;
  }

  Colorize underline() {
    return apply(Styles.underline);
  }

  Colorize white() {
    return apply(Styles.white);
  }

  Colorize yellow() {
    return apply(Styles.yellow);
  }

  String _applyStyle(Styles style, String text) {
    return buildEscSeq(style) + text + buildEscSeq(Styles.reset);
  }

  static String getStyle(Styles style) {
    switch (style) {
      case Styles.reset:
        return '0';
      case Styles.bold:
        return '1';
      case Styles.dark:
        return '2';
      case Styles.italic:
        return '3';
      case Styles.underline:
        return '4';
      case Styles.blink:
        return '5';
      case Styles.reverse:
        return '7';
      case Styles.concealed:
        return '8';
      case Styles.default_:
        return '39';
      case Styles.black:
        return '30';
      case Styles.red:
        return '31';
      case Styles.green:
        return '32';
      case Styles.yellow:
        return '33';
      case Styles.blue:
        return '34';
      case Styles.magenta:
        return '35';
      case Styles.cyan:
        return '36';
      case Styles.lightGray:
        return '37';
      case Styles.darkGray:
        return '90';
      case Styles.lightRed:
        return '91';
      case Styles.lightGreen:
        return '92';
      case Styles.lightYellow:
        return '93';
      case Styles.lightBlue:
        return '94';
      case Styles.lightMagenta:
        return '95';
      case Styles.lightCyan:
        return '96';
      case Styles.white:
        return '97';
      case Styles.bgDefault:
        return '49';
      case Styles.bgBlack:
        return '40';
      case Styles.bgRed:
        return '41';
      case Styles.bgGreen:
        return '42';
      case Styles.bgYellow:
        return '43';
      case Styles.bgBlue:
        return '44';
      case Styles.bgMagenta:
        return '45';
      case Styles.bgCyan:
        return '46';
      case Styles.bgLightGray:
        return '47';
      case Styles.bgDarkGray:
        return '100';
      case Styles.bgLightRed:
        return '101';
      case Styles.bgLightGreen:
        return '102';
      case Styles.bgLightYellow:
        return '103';
      case Styles.bgLightBlue:
        return '104';
      case Styles.bgLightMagenta:
        return '105';
      case Styles.bgLightCyan:
        return '106';
      case Styles.bgWhite:
        return '107';
      default:
        return '';
    }
  }
}

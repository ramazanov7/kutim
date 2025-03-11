extension DoubleExtension on double {
  double navbarFontSizeByWidth() {
    if (this > 410) {
      return 10;
    } else if (this > 390) {
      return 9.5;
    } else {
      return 9;
    }
  }
}

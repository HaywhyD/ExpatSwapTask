String formatDigit(int digit) {
  if (digit < 10) {
    return '0$digit';
  } else {
    return digit.toString();
  }
}

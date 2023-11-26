import 'dart:async';
import 'dart:io';

String formatDigit(int digit) {
  if (digit < 10) {
    return '0$digit';
  } else {
    return digit.toString();
  }
}

void handleException(
    {required dynamic e, required void Function(String message) action}) {
  if (e is TimeoutException) {
    action('Request timed out. Please try again later.');
  } else if (e is SocketException) {
    action('No internet connection. Please check your network.');
  } else {
    action('An unexpected error occurred.');
  }
}

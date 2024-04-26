import 'package:flutter/material.dart';

class FlashWidget {
  static void show(
    BuildContext context, {
    required bool status,
    required String message,
    int duration = 3,
  }) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor:
          status ? Colors.green : Theme.of(context).colorScheme.error,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: duration),
      showCloseIcon: true,
      closeIconColor: Colors.white,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

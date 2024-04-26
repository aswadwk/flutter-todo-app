import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AlertWidget {
  static void showSnackBar(
    BuildContext context, {
    required bool status,
    required String message,
    int duration = 3,
  }) {
    final snackBar = SnackBar(
      content: Text(message,
          style: const TextStyle(
            fontSize: 12,
          )),
      backgroundColor:
          status ? Colors.green : Theme.of(context).colorScheme.error,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: duration),
      showCloseIcon: true,
      closeIconColor: Colors.white,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Alert alertConfirmation(
    BuildContext context, {
    String? title,
    String? description,
    required VoidCallback onPressed,
  }) {
    return Alert(
      context: context,
      image: Icon(
        Icons.question_mark_sharp,
        color: Theme.of(context).primaryColor,
        size: 80,
      ),
      title: title ?? '',
      desc: description ?? '',
      style: const AlertStyle(
        overlayColor: Colors.black54,
        backgroundColor: Colors.white,
        animationType: AnimationType.fromBottom,
        isCloseButton: false,
        isOverlayTapDismiss: false,
        descStyle: TextStyle(
            color: Colors.grey, fontSize: 14, fontWeight: FontWeight.normal),
      ),
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 1,
          ),
          child: Text(
            "Belum nih",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
            onPressed();
          },
          color: Theme.of(context).primaryColor,
          child: const Text(
            "Yakin",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

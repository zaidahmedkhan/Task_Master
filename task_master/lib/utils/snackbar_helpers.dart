import 'package:flutter/material.dart';

void showErrorMessage(BuildContext context, {required String message}) {
  final snackbar = SnackBar(
    content: Text(
      message,
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.red,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}

void showSuccessMessage(BuildContext context, {required String message}) {
  final snackbar = SnackBar(content: Text(message));
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}

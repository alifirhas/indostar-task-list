import 'package:flutter/material.dart';

class ConfirmationPopup extends StatelessWidget {
  final Function() onCancel;
  final Function() onContinue;
  final Function()? afterContinue;
  final String judul;
  final String detail;

  const ConfirmationPopup({
    super.key,
    required this.onCancel,
    required this.onContinue,
    required this.judul,
    required this.detail,
    this.afterContinue,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(judul),
      content: Text(detail),
      actions: [
        TextButton(
          child: const Text('Batal'),
          onPressed: () {
            onCancel();
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Lanjutkan'),
          onPressed: () {
            onContinue();
            Navigator.of(context).pop();
            afterContinue!();
          },
        ),
      ],
    );
  }
}

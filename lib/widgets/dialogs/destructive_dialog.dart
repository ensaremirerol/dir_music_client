import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DestructiveDialog extends StatelessWidget {
  const DestructiveDialog(
      {super.key,
      required this.title,
      required this.content,
      required this.destructiveText,
      this.onDestructivePressed});

  final String title;
  final String content;
  final String destructiveText;
  final VoidCallback? onDestructivePressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('cancel').tr()),
        TextButton(
            onPressed: onDestructivePressed,
            child: Text(destructiveText).tr())
      ],
    );
  }
}

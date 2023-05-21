import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DirPrimaryButton extends ConsumerWidget {
  const DirPrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
  }) : icon = null;

  const DirPrimaryButton.icon({
    super.key,
    required this.label,
    required this.icon,
    this.onPressed,
  });

  final Widget label;
  final Icon? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (icon != null) {
      return ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon!,
        label: label,
      );
    }
    return ElevatedButton(onPressed: onPressed, child: label);
  }
}

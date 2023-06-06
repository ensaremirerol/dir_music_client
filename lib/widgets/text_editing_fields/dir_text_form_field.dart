import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DirTextFormField extends ConsumerWidget {
  const DirTextFormField({
    super.key,
    this.label,
    this.hint,
    this.onChanged,
    this.onTap,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.obscureText = false,
    this.inputFormatters,
    this.readOnly = false,
  });
  final void Function(String value)? onChanged;
  final void Function()? onTap;
  final bool readOnly;
  final String? Function(String? value)? validator;
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final Icon? prefixIcon;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      inputFormatters: inputFormatters,
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(21),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            )),
      ),
      onChanged: onChanged,
      controller: controller,
      validator: validator,
      obscureText: obscureText,
    );
  }
}

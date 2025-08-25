import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.controller,
    required this.label,
    this.isPassword = false,
    this.iconLeft,
    this.iconRight,
    this.keyboardType = TextInputType.text,
    this.inputFormatters = const [],
  });

  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final Widget? iconLeft;
  final Widget? iconRight;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      obscureText: isPassword,
      controller: controller,
      keyboardType: keyboardType, //f9faff
      inputFormatters: inputFormatters,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: label,
        prefix: iconLeft,
        suffixIcon: iconRight,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Ingrese ${label.toLowerCase()}';
        }
        return null;
      },
    );
  }
}

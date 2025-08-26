import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.title,
    this.align = TextAlign.left,
  });

  final String title;
  final TextAlign align;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: align,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}

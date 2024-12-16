import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String hint;
  const CustomField({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
      ),
    );
  }
}

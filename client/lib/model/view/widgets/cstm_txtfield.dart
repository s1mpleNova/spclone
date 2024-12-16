import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isObsecure;
  const CustomField(
      {super.key,
      required this.hint,
      required this.controller,
      this.isObsecure = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
      ),
      obscureText: isObsecure,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return "$hint is empty";
        }
        ;
      },
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:client/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AuthgradButton extends StatelessWidget {
  const AuthgradButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Pallete.gradient1, Pallete.gradient2],
          ),
          borderRadius: BorderRadius.circular(12.0)),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            fixedSize: Size(395, 55),
            backgroundColor: Pallete.transparentColor,
            shadowColor: Pallete.transparentColor),
        child: Text(
          "Sign-Up",
          style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

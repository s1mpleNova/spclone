// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:client/model/view/widgets/authgrad_button.dart';
import 'package:flutter/material.dart';

import '../../../model/view/widgets/cstm_txtfield.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key, required String title});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: const Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            CustomField(
              hint: "Name",
            ),
            const SizedBox(height: 15.0),
            CustomField(
              hint: "Email",
            ),
            const SizedBox(height: 15.0),
            CustomField(
              hint: "Password",
            ),
            const SizedBox(height: 20.0),
            AuthgradButton(),
          ],
        ),
      ),
    );
  }
}

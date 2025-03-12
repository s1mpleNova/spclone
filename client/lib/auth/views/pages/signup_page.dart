// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:client/auth/views/pages/login_page.dart';
import 'package:client/core/theme/app_pallete.dart';
import 'package:client/model/view/widgets/authgrad_button.dart';
import 'package:flutter/material.dart';

import '../../../model/view/widgets/cstm_txtfield.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key, required String title});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    super.dispose();
    // formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
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
                controller: nameController,
                hint: "Name",
              ),
              const SizedBox(height: 15.0),
              CustomField(
                controller: emailController,
                hint: "Email",
              ),
              const SizedBox(height: 15.0),
              CustomField(
                controller: passController,
                hint: "Password",
                isObsecure: true,
              ),
              const SizedBox(height: 20.0),
              AuthgradButton(
                butname: "Sign-Up",
                onTap: () {},
              ),
              const SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(
                        title: "Login",
                      ),
                    ),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Pallete.gradient2),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

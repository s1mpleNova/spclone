// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:client/auth/repositories/auth_remote_repo.dart';
import 'package:client/auth/views/pages/signup_page.dart';
import 'package:client/core/theme/app_pallete.dart';
import 'package:client/model/view/widgets/authgrad_button.dart';
import 'package:flutter/material.dart';

import '../../../model/view/widgets/cstm_txtfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required String title});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
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
                  "LogIn",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
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
                butname: "Login",
                onTap: () async {
                  await AuthRemoteRepo().login(
                      email: emailController.text,
                      password: passController.text);
                },
              ),
              const SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupPage(title: "Signup",),
                    ),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: "Sign up",
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

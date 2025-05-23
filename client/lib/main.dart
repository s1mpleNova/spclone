import 'package:client/auth/views/pages/login_page.dart';
import 'package:client/core/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkThemeMode,
      home: const LoginPage(title: 'Signup'),
      debugShowCheckedModeBanner: false,
    );
  }
}
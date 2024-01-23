import 'package:chat_app/Theme/light_mode_theme.dart';
import 'package:flutter/material.dart';

import 'Screens/login_page.dart';
import 'Screens/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: light_mode,
      home: RegisterPage()
    );
  }
}


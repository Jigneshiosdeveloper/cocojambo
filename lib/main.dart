import 'package:coco_jambo_admin/ui/login.dart';
import 'package:coco_jambo_admin/utils/color.dart';
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
      title: 'Coco Jambo Admin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
           primary: const Color(0xFF1B586B),
        ),
      ),
      home: const Login(),
    );
  }
}



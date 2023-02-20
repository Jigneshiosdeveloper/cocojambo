import 'package:coco_jambo_admin/ui/login.dart';
import 'package:coco_jambo_admin/utils/color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDQ1tkeCMe7ne9BKCE0jlVCavMa217kdPE",
        appId: "1:886261199978:web:fdd17a03f61a875a178613",
        messagingSenderId: "886261199978",
        projectId: "parless-app",
        storageBucket : "parless-app.appspot.com"
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
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



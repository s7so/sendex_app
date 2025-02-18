import 'package:flutter/material.dart';
import 'screens/registration_screen.dart'; // استورد شاشة التسجيل

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sendex App', // اسم التطبيق
      theme: ThemeData(
        primarySwatch: Colors.blue, // لون رئيسي للتطبيق
      ),
      home: RegistrationScreen(), // حدد شاشة التسجيل كالشاشة الرئيسية
    );
  }
}

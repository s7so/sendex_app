import 'package:flutter/material.dart';
import 'screens/registration_screen.dart'; // استورد شاشة التسجيل
import 'screens/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      // إضافة دعم التوطين للغة العربية
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', ''), // العربية
      ],
      locale: const Locale('ar', ''), // تعيين العربية كلغة افتراضية
      theme: ThemeData(
        primarySwatch: Colors.blue, // لون رئيسي للتطبيق
        // إضافة دعم للغة العربية
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Cairo', // خط يدعم اللغة العربية
              bodyColor: Colors.black87,
              displayColor: Colors.black,
            ),
        // تخصيص شكل الـ Input fields
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          filled: true,
          fillColor: Colors.grey[50],
        ),
      ),
      initialRoute: '/register',
      routes: {
        '/register': (context) => const RegistrationScreen(),
        '/home': (context) => const HomeScreen(),
      },
      builder: (context, child) {
        // تطبيق اتجاه RTL على كل الشاشات
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
    );
  }
}

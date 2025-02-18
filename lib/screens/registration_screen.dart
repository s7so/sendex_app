import 'package:flutter/material.dart';
import '../services/auth_service.dart'; // استورد خدمة التسجيل
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final AuthService _authService = AuthService(); // instance من خدمة التسجيل

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تسجيل المستخدم'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: fullNameController,
                decoration: InputDecoration(labelText: 'الاسم الكامل'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال الاسم الكامل';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20), // مسافة رأسية بين الحقول

              TextFormField(
                controller: phoneNumberController,
                decoration: InputDecoration(labelText: 'رقم الهاتف'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال رقم الهاتف';
                  }
                  return null;
                },
              ),

              SizedBox(height: 20), // مسافة رأسية بين الحقول

              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'البريد الإلكتروني'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال البريد الإلكتروني';
                  }
                  return null;
                },
              ),

              SizedBox(height: 30), // مسافة رأسية أكبر شوية قبل الزر

              ElevatedButton(
                onPressed: () async {
                  // خلي الدالة async عشان نستدعي خدمة التسجيل الـ asynchronous
                  if (_formKey.currentState!.validate()) {
                    String fullName = fullNameController.text;
                    String phoneNumber = phoneNumberController.text;
                    String email = emailController.text;

                    // استدعاء خدمة التسجيل
                    User? registeredUser = await _authService.registerUser(
                      fullName: fullName,
                      phoneNumber: phoneNumber,
                      email: email,
                    );

                    if (registeredUser != null) {
                      // تم التسجيل بنجاح
                      print(
                          'تم التسجيل بنجاح: ${registeredUser.email}'); // طباعة رسالة نجاح في الـ Console
                      // **هنا ممكن تروح للشاشة اللي بعد التسجيل (مثلاً شاشة التحقق من OTP)**
                    } else {
                      // فشل التسجيل
                      print('فشل التسجيل'); // طباعة رسالة فشل في الـ Console
                      // **هنا ممكن تعرض رسالة خطأ للمستخدم**
                    }
                  }
                },
                child: Text('تسجيل'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // هنا هيتم تنفيذ عملية التسجيل لما الزر يداس
                    String fullName = fullNameController.text;
                    String phoneNumber = phoneNumberController.text;
                    String email = emailController.text;
                    print(
                        'الاسم الكامل: $fullName, رقم الهاتف: $phoneNumber, البريد الإلكتروني: $email');
                    // المفروض هنا تستدعي خدمة التسجيل وترسل البيانات دي
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

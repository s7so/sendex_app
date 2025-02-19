# 🚀 Sendex - تطبيق المحفظة الإلكترونية | Digital Wallet App

<div align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" />
  <img src="https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black" />
  <img src="https://img.shields.io/badge/WhatsApp-25D366?style=for-the-badge&logo=whatsapp&logoColor=white" />
</div>

## 📱 نظرة عامة | Overview

Sendex هو تطبيق محفظة إلكترونية متكامل يوفر تجربة مستخدم سلسة وآمنة. يدعم التطبيق اللغة العربية بشكل كامل ويستخدم أحدث تقنيات Flutter و Firebase.

## ✨ المميزات | Features

- 🔐 نظام تسجيل وتوثيق آمن
- 📲 توثيق عبر WhatsApp OTP
- 💰 محفظة إلكترونية برصيد افتراضي
- 🎨 واجهة مستخدم عربية أنيقة
- 📊 إدارة حساب المستخدم
- ⚡ أداء عالي وتجربة مستخدم سلسة

## 🛠️ التقنيات المستخدمة | Tech Stack

- **Frontend**: Flutter & Dart
- **Backend**: Firebase
  - Authentication
  - Cloud Firestore
- **APIs**: Vonage WhatsApp API
- **State Management**: setState
- **Design**: Material Design with RTL support

## 🏗️ هيكل المشروع | Project Structure

```
lib/
├── models/
│   └── wallet_model.dart
├── screens/
│   ├── registration_screen.dart
│   ├── otp_verification_screen.dart
│   └── home_screen.dart
├── services/
│   ├── auth_service.dart
│   └── whatsapp_service.dart
└── main.dart
```

## 🚀 كيفية البدء | Getting Started

1. **متطلبات النظام**:
   - Flutter SDK
   - Dart SDK
   - Firebase CLI
   - Android Studio / VS Code

2. **تثبيت المشروع**:
   ```bash
   git clone https://github.com/s7so/sendex-app.git
   cd sendex-app
   flutter pub get
   ```

3. **إعداد Firebase**:
   - قم بإنشاء مشروع Firebase جديد
   - قم بتكوين Flutter مع Firebase
   - قم بتفعيل خدمات Authentication و Firestore

4. **تشغيل التطبيق**:
   ```bash
   flutter run
   ```


## 🔒 الأمان | Security

- تشفير البيانات
- توثيق OTP عبر WhatsApp
- حماية البيانات الحساسة
- تحقق من صحة المدخلات

## 🤝 المساهمة | Contributing

نرحب بمساهماتكم! يرجى اتباع الخطوات التالية:

1. Fork المشروع
2. إنشاء فرع للميزة الجديدة
3. Commit التغييرات
4. Push إلى الفرع
5. فتح Pull Request

## 📄 الترخيص | License

هذا المشروع مرخص تحت [MIT License](LICENSE).

## 👥 المطورون | Developers

- Hussein El-Daramally - مطور رئيسي

## 📞 التواصل | Contact

للاستفسارات والدعم الفني:
- البريد الإلكتروني: graphiceldaramally@gmail.com
- تويتر: [@s7socoding](https://twitter.com/s7socoding)

---

<div align="center">
  صنع بـ ❤️ في مصر
</div>

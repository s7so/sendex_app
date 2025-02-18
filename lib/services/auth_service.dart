import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/wallet_model.dart'; // استورد نموذج المحفظة

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // دالة تسجيل المستخدم
  Future<User?> registerUser({
    required String fullName,
    required String phoneNumber,
    required String email,
  }) async {
    try {
      // 1. إنشاء مستخدم جديد في Firebase Authentication
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: email, // **ملاحظة:** استخدام الإيميل ككلمة مرور للتجربة فقط، في التطبيقات الحقيقية يجب استخدام كلمة مرور قوية وآمنة
      );
      User? user = userCredential.user;

      if (user != null) {
        // 2. إنشاء محفظة للمستخدم الجديد في Firestore
        Wallet newWallet = Wallet(userId: user.uid); // استخدم الـ UID من Firebase Authentication
        await _firestore.collection('wallets').doc(user.uid).set(newWallet.toJson()); // خزّن المحفظة في Firestore

        return user; // إرجاع المستخدم في حالة النجاح
      } else {
        return null; // إرجاع null في حالة فشل إنشاء المستخدم (غير متوقع هنا، لكن للسلامة)
      }
    } catch (e) {
      print("Error during registration: $e"); // طباعة الخطأ في الـ Console
      return null; // إرجاع null في حالة حدوث خطأ
    }
  }
}
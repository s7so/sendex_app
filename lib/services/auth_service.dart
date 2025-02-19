import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'whatsapp_service.dart'; // استورد خدمة WhatsApp API
import 'dart:math'; // عشان نولد رمز OTP عشوائي
import '../models/wallet_model.dart'; // استورد نموذج المحفظة

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final WhatsappService _whatsappService = WhatsappService();

  // دالة تسجيل المستخدم
  Future<User?> registerUser({
    required String fullName,
    required String phoneNumber,
    required String email,
  }) async {
    try {
      // 1. إنشاء مستخدم جديد في Firebase Authentication
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: email, // **ملاحظة:** استخدام الإيميل ككلمة مرور للتجربة فقط
      );
      User? user = userCredential.user;

      if (user != null) {
        // 2. إنشاء محفظة للمستخدم الجديد في Firestore
        Wallet newWallet = Wallet(userId: user.uid);
        await _firestore
            .collection('wallets')
            .doc(user.uid)
            .set(newWallet.toJson());

        // 3. توليد رمز OTP عشوائي
        String otpCode = generateOtp(); // دالة توليد OTP (هنعملها تحت)

        // 4. إرسال رمز OTP عبر WhatsApp باستخدام WhatsappService
        bool isOtpSent = await _whatsappService.sendWhatsappOtp(
            recipientPhoneNumber: phoneNumber, otpCode: otpCode);

        if (isOtpSent) {
          print('تم إرسال رمز OTP عبر WhatsApp بنجاح إلى رقم: $phoneNumber');
          return user; // إرجاع المستخدم في حالة النجاح وإرسال OTP
        } else {
          print('فشل إرسال رمز OTP عبر WhatsApp إلى رقم: $phoneNumber');
          // **ممكن هنا تقرر إيه اللي يحصل لو فشل إرسال OTP، هل تفشل عملية التسجيل كلها؟ أو تكمل التسجيل من غير OTP؟**
          // في الاختبار ده، ممكن نكمل التسجيل حتى لو فشل إرسال OTP، ونعتبر إن التسجيل تم بنجاح جزئياً.
          return user; // إرجاع المستخدم حتى لو فشل إرسال OTP (اعتبر التسجيل ناجح جزئياً)
        }
      } else {
        return null; // إرجاع null في حالة فشل إنشاء المستخدم
      }
    } catch (e) {
      print("Error during registration: $e");
      return null; // إرجاع null في حالة حدوث خطأ عام
    }
  }

// دالة لتوليد رمز OTP عشوائي (مكون من 6 أرقام)
  String generateOtp() {
    final random = Random();
    String otp = '';
    for (int i = 0; i < 6; i++) {
      otp += random.nextInt(10).toString(); // أرقام من 0 إلى 9
    }
    return otp;
  }
}

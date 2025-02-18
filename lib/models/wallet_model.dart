class Wallet {
  String userId;
  double balance;

  Wallet({
    required this.userId,
    this.balance = 0.0, // القيمة الافتراضية للرصيد هي 0.0
  });

  // لتحويل الـ Wallet object إلى Map عشان نقدر نخزنه في Firestore
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'balance': balance,
    };
  }

  // عشان نرجع Wallet object من Map جاي من Firestore
  factory Wallet.fromJson(Map<String, dynamic> json) {
    return Wallet(
      userId: json['userId'],
      balance: (json['balance'] ?? 0.0).toDouble(), // استخدم 0.0 كقيمة افتراضية لو الرصيد مش موجود في الـ Map
    );
  }
}
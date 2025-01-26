import 'package:cloud_firestore/cloud_firestore.dart';

class MoneyRecord {
  final String amount;
  final String receivePhone;
  final String uId;
  final String userId;
  final String userName;
  final DateTime time;
  final String paymentMethod;
  final String paymentMethodEn;
  final String status;
  final String email;
  final bool isSendingMoney;

  MoneyRecord({
    required this.amount,
    required this.receivePhone,
    required this.uId,
    required this.userId,
    required this.userName,
    required this.time,
    required this.paymentMethod,
    required this.paymentMethodEn,
    required this.status,
    required this.email,
    required this.isSendingMoney,
  });

  // Factory method to create a MoneyRecord from a Firestore document
  factory MoneyRecord.fromMap(Map<String, dynamic> data) {
    return MoneyRecord(
      amount: data['amount'] ?? '',
      receivePhone: data['receive_phone'] ?? '',
      uId: data['uId'] ?? '',
      userId: data['userId'] ?? '',
      userName: data['user_name'] ?? '',
      time: (data['time'] as Timestamp).toDate(), // Convert Firestore Timestamp to DateTime
      paymentMethod: data['payment_method'] ?? '',
      paymentMethodEn: data['payment_method_en'] ?? '',
      status: data['status'] ?? '',
      email: data['email'] ?? '',
      isSendingMoney: data['isSendingMoney'] ?? false,
    );
  }

  // Convert MoneyRecord to a map (optional, useful for adding/updating data)
  // Map<String, dynamic> toMap() {
  //   return {
  //     'amount': amount,
  //     'receive_phone': receivePhone,
  //     'uId': uId,
  //     'userId': userId,
  //     'user_name': userName,
  //     'time': Timestamp.fromDate(time), // Convert DateTime to Firestore Timestamp
  //     'payment_method': paymentMethod,
  //     'payment_method_en': paymentMethodEn,
  //     'status': status,
  //     'email': email,
  //   };
  // }
}
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Timestamp

class UserModel {
  final DateTime createdAt; // Change to DateTime
  final String email;
  final String firstName;
  final String lastName;
  final double myCash;
  final int myPoints;
  final String phoneNumber;
  final String uId;
  final String userId;

  UserModel({
    required this.createdAt,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.myCash,
    required this.myPoints,
    required this.phoneNumber,
    required this.uId,
    required this.userId,
  });

  // Factory method to create a UserModel from a Firestore document
  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      createdAt: (data['createdAt'] as Timestamp).toDate(), // Convert Timestamp to DateTime
      email: data['email'] ?? '',
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      myCash: (data['myCash'] ?? 0).toDouble(),
      myPoints: data['myPoints'] ?? 0,
      phoneNumber: data['phoneNumber'] ?? '',
      uId: data['uId'] ?? '',
      userId: data['userId'] ?? '',
    );
  }

  // Convert UserModel to a map (optional, useful for adding/updating data)
  Map<String, dynamic> toMap() {
    return {
      'createdAt': Timestamp.fromDate(createdAt), // Convert DateTime to Timestamp
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'myCash': myCash,
      'myPoints': myPoints,
      'phoneNumber': phoneNumber,
      'uId': uId,
      'userId': userId,
    };
  }
}
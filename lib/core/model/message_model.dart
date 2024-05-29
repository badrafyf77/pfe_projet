// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String message;
  final Timestamp createdAt;

  Message({
    required this.message,
    required this.createdAt,
  });

  Message.fromJson(json)
      : this(
          message: json['message'] as String,
          createdAt: json['createdAt'] as Timestamp,
        );

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'createdAt': createdAt,
    };
  }
}

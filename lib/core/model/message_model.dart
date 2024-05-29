// ignore_for_file: public_member_api_docs, sort_constructors_first
class Message {
  final String message;
  final DateTime createdAt;

  Message({
    required this.message,
    required this.createdAt,
  });

  Message.fromJson(Map<String, dynamic> json)
      : this(
          message: json['message']! as String,
          createdAt: json['createdAt']! as DateTime,
        );

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'createdAt': createdAt,
    };
  }
}

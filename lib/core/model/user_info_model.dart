// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserInformation {
  final String nom;
  final String prenom;
  final String cin;
  String phone;
  String email;
  String password;
  bool isCinVerified;
  bool isEmailVerified;

  UserInformation({
    required this.nom,
    required this.prenom,
    required this.cin,
    required this.phone,
    required this.email,
    required this.password,
    required this.isCinVerified,
    required this.isEmailVerified,
  });

  UserInformation.fromJson(Map<String, dynamic> json)
      : this(
          nom: json['nom']! as String,
          prenom: json['prenom']! as String,
          cin: json['cin']! as String,
          phone: json['phone']! as String,
          email: json['email']! as String,
          password: json['password']! as String,
          isCinVerified: json['isCinVerified']! as bool,
          isEmailVerified: json['isEmailVerified']! as bool,
        );

  Map<String, dynamic> toJson() {
    return {
      'nom': nom,
      'prenom': prenom,
      'cin': cin,
      'phone': phone,
      'email': email,
      'password': password,
      'isCinVerified': isCinVerified,
      'isEmailVerified': isEmailVerified,
    };
  }
}

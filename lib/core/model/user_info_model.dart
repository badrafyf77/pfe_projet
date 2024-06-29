// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserInformation {
  final String nom;
  final String prenom;
  final String cin;
  final String advisorId;
  final String agence;
  final String ville;
  String phone;
  String email;
  String password;
  bool isCinVerified;
  bool isEmailVerified;
  bool isMessagesReaded;

  UserInformation({
    required this.nom,
    required this.prenom,
    required this.cin,
    required this.advisorId,
    required this.agence,
    required this.ville,
    required this.phone,
    required this.email,
    required this.password,
    required this.isCinVerified,
    required this.isEmailVerified,
    required this.isMessagesReaded,
  });

  UserInformation.fromJson(Map<String, dynamic> json)
      : this(
          nom: json['nom']! as String,
          prenom: json['prenom']! as String,
          cin: json['cin']! as String,
          advisorId: json['advisorId'] as String,
          agence: json['agence'] as String,
          ville: json['ville'] as String,
          phone: json['phone']! as String,
          email: json['email']! as String,
          password: json['password']! as String,
          isCinVerified: json['isCinVerified']! as bool,
          isEmailVerified: json['isEmailVerified']! as bool,
          isMessagesReaded: json['isMessagesReaded']! as bool,
        );

  Map<String, dynamic> toJson() {
    return {
      'nom': nom,
      'prenom': prenom,
      'cin': cin,
      'advisorId': advisorId,
      'agence': agence,
      'ville': ville,
      'phone': phone,
      'email': email,
      'password': password,
      'isCinVerified': isCinVerified,
      'isEmailVerified': isEmailVerified,
      'isMessagesReaded': isMessagesReaded,
    };
  }
}

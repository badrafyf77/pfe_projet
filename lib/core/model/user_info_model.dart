class UserInformation {
  final String nom;
  final String prenom;
  final String cin;
  String phone;
  String email;
  String password;

  UserInformation({
    required this.nom,
    required this.prenom,
    required this.cin,
    required this.phone,
    required this.email,
    required this.password,
  });

  UserInformation.fromJson(Map<String, dynamic> json)
      : this(
          nom: json['nom']! as String,
          prenom: json['prenom']! as String,
          cin: json['cin']! as String,
          phone: json['phone']! as String,
          email: json['email']! as String,
          password: json['password']! as String,
        );

  Map<String, dynamic> toJson() {
    return {
      'nom': nom,
      'prenom': prenom,
      'cin': cin,
      'phone': phone,
      'email': email,
      'password': password,
    };
  }
}

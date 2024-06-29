// ignore_for_file: public_member_api_docs, sort_constructors_first
class Advisor {
  final String id;
  final String nomComplet;
  final String email;
  final String phone;
  final String agence;
  final String ville;

  Advisor({
    required this.id,
    required this.nomComplet,
    required this.email,
    required this.phone,
    required this.agence,
    required this.ville,
  });

  Advisor.fromJson(json)
      : this(
          id: json['id'] as String,
          nomComplet: json['nomComplet'] as String,
          email: json['email'] as String,
          phone: json['phone'] as String,
          agence: json['agence'] as String,
          ville: json['ville'] as String,
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nomComplet': nomComplet,
      'email': email,
      'phone': phone,
      'agence': agence,
      'ville': ville,
    };
  }
}
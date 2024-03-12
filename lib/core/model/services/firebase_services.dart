import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfe_projet/core/model/user_info_model.dart';

class FirebaseService {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(String email, String password, String nom, String prenom,
      String cin, String phone) async {
    UserInfo user = UserInfo(
        nom: nom,
        prenom: prenom,
        cin: cin,
        phone: phone,
        email: email,
        password: password);

    await users.doc(email).set(user.toJson());
  }
}

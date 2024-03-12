import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfe_projet/core/model/user_info_model.dart';

class FirebaseService {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(String email, String password, String nom, String prenom,
      String cin, String phone) async {
    UserInformation user = UserInformation(
        nom: nom,
        prenom: prenom,
        cin: cin,
        phone: phone,
        email: email,
        password: password);

    await users.doc(email).set(user.toJson());
  }

  // Future<Map<String, dynamic>> getUser(String email) async {
  //   var data = await users.doc(email).get();
  //   return;
  // }

  Future<dynamic> getUser(String email) async {
    dynamic data;

    final DocumentReference document = users.doc(email);

    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      data = snapshot.data();
    });

    return data;
  }
}

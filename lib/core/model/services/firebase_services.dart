import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfe_projet/core/model/user_info_model.dart';

class FirebaseService {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(UserInformation userInfo) async {
    await users.doc(userInfo.email).set(userInfo.toJson());
  }


  Future<Map<String, dynamic>> getUser(String email) async {
    Map<String, dynamic>? data;

    final DocumentReference document = users.doc(email);

    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      data = snapshot.data() as Map<String, dynamic>;
    });

    return data!;
  }
}

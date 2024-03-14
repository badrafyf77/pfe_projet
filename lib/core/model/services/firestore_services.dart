import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfe_projet/core/model/user_info_model.dart';

class FirestoreService {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(UserInformation userInfo) async {
    await users.doc(userInfo.email).set(userInfo.toJson());
  }

  Future<UserInformation> getUser(String email) async {
    dynamic data;
    UserInformation user;
    final DocumentReference document = users.doc(email);
    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      data = snapshot.data();
    });
    user = UserInformation.fromJson(data);
    return user;
  }

  Future<void> deleteUser(String email) async {
    await users.doc(email).delete();
  }
}

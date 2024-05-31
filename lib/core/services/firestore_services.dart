import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pfe_projet/core/model/message_model.dart';
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

  Future<void> updateStatuEmail(bool statu) async {
    await users.doc(FirebaseAuth.instance.currentUser!.email!).update({
      'isEmailVerified': statu,
    });
  }

  Future<void> updateIsMessagesReadedStatu(bool statu) async {
    await users.doc(FirebaseAuth.instance.currentUser!.email!).update({
      'isMessagesReaded': statu,
    });
  }

  Future<void> updateStatuCin(bool statu) async {
    await users.doc(FirebaseAuth.instance.currentUser!.email!).update({
      'isCinVerified': statu,
    });
  }

  Future<void> deleteUser(String email) async {
    await users.doc(email).delete();
  }

  Future<void> updatePassword(String newPassword) async {
    await users.doc(FirebaseAuth.instance.currentUser!.email!).update({
      'password': newPassword,
    });
  }

  Future<void> addMessage(Message message) async {
    await users
        .doc(FirebaseAuth.instance.currentUser!.email!)
        .collection('messages')
        .add(message.toJson());
  }

  List<Message> getMessages() {
    List<Message> messagesList = [];
    users
        .doc(FirebaseAuth.instance.currentUser!.email!)
        .collection('messages')
        .orderBy('createdAt')
        .snapshots()
        .listen((event) {
      for (var doc in event.docs) {
        messagesList.add(Message.fromJson(doc));
      }
    });
    return messagesList;
  }

  Future<bool> isMessagesReaded() async {
    UserInformation user =
        await getUser(FirebaseAuth.instance.currentUser!.email!);
    return user.isMessagesReaded;
  }

  Future<bool> isCinVerified() async {
    UserInformation user =
        await getUser(FirebaseAuth.instance.currentUser!.email!);
    return user.isCinVerified;
  }
}

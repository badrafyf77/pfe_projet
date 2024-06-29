import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pfe_projet/core/model/advisor_model.dart';
import 'package:pfe_projet/core/model/message_model.dart';
import 'package:pfe_projet/core/model/user_info_model.dart';
import 'package:pfe_projet/features/insurances/data/model/devis_info.dart';
import 'package:uuid/uuid.dart';

class FirestoreService {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference advisors =
      FirebaseFirestore.instance.collection('advisors');

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

  Future<void> addAdvisor(Advisor advisor) async {
    await advisors.doc(advisor.id).set(advisor.toJson());
  }

  Future<void> addAssurance(DevisInfo devisInfo) async {
    String id = const Uuid().v4();
    List<String> garanties = [];
    for (var garantie in devisInfo.garantiesList!) {
      garanties.add(garantie.title);
    }
    devisInfo.garanties = garanties;
    devisInfo.id = id;
    await users
        .doc(FirebaseAuth.instance.currentUser!.email!)
        .collection('auto_assurances')
        .doc(id)
        .set(devisInfo.toJson());
  }

  List<DevisInfo> getUserInsurances() {
    List<DevisInfo> devisList = [];
    users
        .doc(FirebaseAuth.instance.currentUser!.email!)
        .collection('auto_assurances')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen((event) {
      for (var doc in event.docs) {
        devisList.add(DevisInfo.fromJson(doc));
      }
    });
    return devisList;
  }

  Future<void> updateStatuCarteGrise(String id, bool statu) async {
    await users
        .doc(FirebaseAuth.instance.currentUser!.email!)
        .collection('auto_assurances')
        .doc(id)
        .update({
      'carteGriseVerified': statu,
    });
  }

  Future<void> updateStatuPermisRecto(String id, bool statu) async {
    await users
        .doc(FirebaseAuth.instance.currentUser!.email!)
        .collection('auto_assurances')
        .doc(id)
        .update({
      'permisRectoVerified': statu,
    });
  }

  Future<void> updateStatuPermisVerso(String id, bool statu) async {
    await users
        .doc(FirebaseAuth.instance.currentUser!.email!)
        .collection('auto_assurances')
        .doc(id)
        .update({
      'permisVersoVerified': statu,
    });
  }

  Future<DevisInfo> getInsurance(String id) async {
    dynamic data;
    DevisInfo devisInfo;
    final DocumentReference document = users
        .doc(FirebaseAuth.instance.currentUser!.email!)
        .collection('auto_assurances')
        .doc(id);
    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      data = snapshot.data();
    });
    devisInfo = DevisInfo.fromJson(data);
    return devisInfo;
  }

  Future<void> updateStatuEmail(bool statu) async {
    await users.doc(FirebaseAuth.instance.currentUser!.email!).update({
      'isEmailVerified': statu,
    });
  }

  Future<void> updateMessagesStatu(bool statu) async {
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

  Future<void> addMessage(String message) async {
    Message m = Message(
        message: message, createdAt: Timestamp.fromDate(DateTime.now()));
    await users
        .doc(FirebaseAuth.instance.currentUser!.email!)
        .collection('messages')
        .add(m.toJson());
    await updateMessagesStatu(false);
  }

  List<Message> getMessages() {
    List<Message> messagesList = [];
    users
        .doc(FirebaseAuth.instance.currentUser!.email!)
        .collection('messages')
        .orderBy('createdAt', descending: true)
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

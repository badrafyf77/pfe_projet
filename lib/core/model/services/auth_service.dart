import 'package:firebase_auth/firebase_auth.dart';
import 'package:pfe_projet/core/model/services/firestore_services.dart';
import 'package:pfe_projet/core/model/user_info_model.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  final _firestoreService = FirestoreService();
  Future<User> signUp(String email, String password) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user!;
  }

  Future<User> signIn(String email, String password) async {
    final credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user!;
  }

  Future<bool> checkIsEmailVerified() async {
    await _auth.currentUser?.reload();
    return _auth.currentUser!.emailVerified;
  }

  void sendEmailVerification() async {
    await _auth.currentUser?.sendEmailVerification();
  }

  Future<void> sendPasswordReset(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> updateEmail(String newEmail) async {
    await _auth.currentUser!.updateEmail(newEmail);
  }

  Future<void> updatePassword(String newPassword) async {
    await _auth.currentUser!.updatePassword(newPassword);
  }

  Future<bool> checkPassword(String password) async {
    var data = await _firestoreService.getUser(_auth.currentUser!.email!);
    return UserInformation.fromJson(data).password == password;
  }
}

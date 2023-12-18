import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<User> signUp(String email, String password) async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user!;
  }
  Future<User> signIn(String email, String password) async {
    final credential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user!;
  }

  Future<bool> checkIsEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();

    return FirebaseAuth.instance.currentUser!.emailVerified;
  }

  void sendEmailVerification() async {
    await FirebaseAuth.instance.currentUser?.sendEmailVerification();
  }
}

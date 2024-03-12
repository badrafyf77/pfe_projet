

class FirebaseService {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
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
}

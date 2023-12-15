import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String errMessage;

  Failure({
    required this.errMessage,
  });
}

class FirebaseAuthFailure extends Failure {
  FirebaseAuthFailure({required super.errMessage});

  factory FirebaseAuthFailure.fromFirebaseAuthException(
      FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        {
          return FirebaseAuthFailure(errMessage: 'mot de passe faible');
        }
      case 'email-already-in-use':
        {
          return FirebaseAuthFailure(errMessage: 'Email déjà utilisé');
        }
      default:
        return FirebaseAuthFailure(errMessage: 'il y a une erreur, veuillez réessayer');
    }
  }
}

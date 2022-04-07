import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// final authStreamProvider = StreamProvider<User?>((ref) async* {
//    FirebaseAuth.instance
//   .authStateChanges().listen((user) => user);
// });

class AuthService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth;
  AuthService(this._firebaseAuth);
  Future<String?> signIn({required String phoneNumber}) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {},
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
  // Future<String?> signUp({required String phoneNumber}) async {
  //   try {
  //     await _firebaseAuth.verifyPhoneNumber(phoneNumber: phoneNumber, verificationCompleted: (authCredential){}, verificationFailed: verificationFailed, codeSent: codeSent, codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  //   } on FirebaseAuthException catch (e) {
  //     return e.message;
  //   }
  // }

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  
  
}


final authStreamProvider = StreamProvider<User?>((authService) {
  return AuthService(FirebaseAuth.instance).authStateChanges;
});

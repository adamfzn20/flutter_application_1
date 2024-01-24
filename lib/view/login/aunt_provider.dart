import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool visible = false;

  bool passwordObscureText = true;
  UserModel? _user;

  UserModel? get user => _user;

  // Future<void> signInWithEmailAndPassword(String email, String password) async {
  //   try {
  //     UserCredential authResult = await _auth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );

  //     User? firebaseUser = authResult.user;

  //     if (firebaseUser != null) {
  //       _user =
  //           UserModel(uid: firebaseUser.uid, email: firebaseUser.email ?? '');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }

  //   notifyListeners();
  // }

  // void passwordObscureTextStatus() {
  //   passwordObscureText = !passwordObscureText;
  //   notifyListeners();
  // }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );
        await _auth.signInWithCredential(credential);
        visible = true;
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  late SharedPreferences _preferences;

  bool visible = false;
  bool passwordObscureText = true;
  UserModel? _user;

  UserModel? get user => _user;

  AuthProvider() {
    _initPreferences();
  }

  Future<void> _initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> _saveLoginState(bool isLoggedIn) async {
    await _preferences.setBool('isLoggedIn', isLoggedIn);
  }

  Future<bool> _getLoginState() async {
    return _preferences.getBool('isLoggedIn') ?? false;
  }

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
        await _saveLoginState(true); // Save login state to shared preferences
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<void> checkLoginStatus() async {
    final bool isLoggedIn = await _getLoginState();
    visible = isLoggedIn;
    notifyListeners();
  }
}

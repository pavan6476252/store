import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn googleSignIn = GoogleSignIn();

class MyAuth {
  Future getCurrentUser() async {
    var _user = await googleSignIn.currentUser;
    print("User: ${_user!.displayName ?? "None"}");
    return _user;
  }

  Future<void> signInGoogle() async {
    try {
      await googleSignIn.signIn();
    } catch (e) {
      print("sign in error");
    }
  }

  signOut() async {
    googleSignIn.signOut();
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<GoogleSignInAccount?> _handleSignIn() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) return googleSignInAccount;
    } catch (error) {
      print("Error ejecutando googleSignIn() $error");
    }
    return null;
  }

  Future<UserCredential> signIn() async {
    GoogleSignInAccount? googleSignInAccount = await _handleSignIn();

    GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;

    UserCredential user = await _auth.signInWithCredential(
      GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication?.idToken,
          accessToken: googleSignInAuthentication?.accessToken),
    );

    return user;
  }

  singOut() async {
    await _auth.signOut().then((value) => print("Sesión cerrada firebase."));
    googleSignIn.signOut().then((value) => print("Sesión cerrada de google."));
  }
}

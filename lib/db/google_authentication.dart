import 'package:drpani/Pages/App.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthentication {
  static Future<FirebaseApp> initializeFirebase({BuildContext context}) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    //add auto login logic
    User user = FirebaseAuth.instance.currentUser;

    if(user!=null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => App(user: user,))
      );
    }
    return firebaseApp;

  }
  static Future<User> signInWithGoogle({BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

    if(googleSignInAccount!=null) {
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken
    );

      try {
        final UserCredential userCredential = await auth.signInWithCredential(credential);

        user = userCredential.user;
    } on FirebaseAuthException catch(e) {
        if(e.code == 'account-exists-with-different-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
          GoogleAuthentication.customSnackBar(
          content:
          'The account already exists with a different credential.',
          ),
    );

    }
        else if(e.code == 'invalid-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
          GoogleAuthentication.customSnackBar(
          content:
          'Error occurred while accessing credentials. Try again.',
          ),
    );

    }
    } catch(e) {
        ScaffoldMessenger.of(context).showSnackBar(
        GoogleAuthentication.customSnackBar(
        content: 'Error occurred using Google Sign-In. Try again.',
      ),
    );

    }
    }
    return user;
  }

  static SnackBar customSnackBar({String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content:  Text(
      content,
      style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
    ),);
  }


}
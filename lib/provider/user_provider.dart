import 'package:drpani/Models/user.dart';
import 'package:drpani/services/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum Status {Uninitialized, Authenticated, Authenticating, Unauthenticated}

class UserProvider with ChangeNotifier {

  final googleSignIn = GoogleSignIn();

  FirebaseAuth _auth;
  UserServices _userServices = UserServices();
  User _user;
  Status _status = Status.Uninitialized;
  UserModel _userModel;

  //getters
  UserModel get userModel => _userModel;
  Status get status => _status;
  User get user => _user;

  UserProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges().listen(_onStateChanged);
  }

  Future<bool> signIn(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) async{
        _userModel = await _userServices.getUserById(value.user.uid);
        notifyListeners();
      });
      return true;
    }catch(e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<bool> signUp(String name,String email,String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((user) async {
        print('CREATE USER');
        _userServices.createUser({
         'name': name,
          'email': email,
          'uid': user.user.uid,
          'stripeId': ""
        });
        _userModel = await _userServices.getUserById(user.user.uid);
        notifyListeners();
      });
      return true;
    }catch(e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      notifyListeners();
    }
  }


  Future<bool> signInwithGoogle() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      _status = Status.Authenticating;
      notifyListeners();
      AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      UserCredential result = await _auth.signInWithCredential(credential);

      User user = _auth.currentUser;
      _userModel = await _userServices.getUserById(user.uid);
      notifyListeners();

      print(user.uid);

      return Future.value(true);
    }
  }

  Future signOut() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }


  Future<void> _onStateChanged(User user) async {
    if(user == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = user;
      _userModel = await _userServices.getUserById(user.uid);
      _status = Status.Authenticated;
    }
    notifyListeners();
  }

}
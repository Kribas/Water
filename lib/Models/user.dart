import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const ID = "uid";
  static const NAME = "name";
  static const EMAIL = "email";
  static const PHOTO_URL = "photoUrl";
  static const STRIPE_ID = "stripeId";

  String _id;
  String _name;
  String _email;
  String _photoUrl;
  String _stripeId;

  //getters
  String get id => _id;
  String get name => _name;
  String get email => _email;
  String get photoUrl => _photoUrl;
  String get stripeId => _stripeId;


  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data()[ID];
    _name = snapshot.data()[NAME];
    _email = snapshot.data()[EMAIL];
    _photoUrl = snapshot.data()[PHOTO_URL];
    _stripeId = snapshot.data()[STRIPE_ID] ?? "";
  }


}
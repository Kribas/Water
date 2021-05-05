import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const ID = "uid";
  static const NAME = "name";
  static const EMAIL = "email";
  static const STRIPE_ID = "stripeId";

  String _id;
  String _name;
  String _email;
  String _stripeId;

  //getters
  String get id => _id;
  String get name => _name;
  String get email => _email;
  String get stripeId => _stripeId;


  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data()[ID];
    _name = snapshot.data()[NAME];
    _email = snapshot.data()[EMAIL];
    _stripeId = snapshot.data()[STRIPE_ID] ?? "";
  }


}
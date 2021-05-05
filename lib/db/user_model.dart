import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drpani/Pages/Notifications.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UserServices {
  FirebaseDatabase _database = FirebaseDatabase.instance;
  String ref = "users";

  createUser(Map value) {
    _database.reference().child(ref).push().set(
        value
    ).catchError((e) => {print(e.toString())});
  }
}
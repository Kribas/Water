import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drpani/Models/user.dart';
import 'package:flutter/cupertino.dart';

class UserServices {
FirebaseFirestore _firestore = FirebaseFirestore.instance;
String collection = "users";

createUser(Map<String,dynamic> data) async {
  try {
    _firestore.collection(collection).doc(data["uid"]).set(data);
    print("USER WAS CREATED");
  }catch(e) {
      print("ERROR: ${e.toString()}");
  }
}

Future<UserModel> getUserById(String id) => _firestore.collection(collection).doc(id).get().then((doc) {

  print("==========id is $id=============");
  debugPrint("==========NAME is ${doc.data()['name']}=============");
  debugPrint("==========NAME is ${doc.data()['name']}=============");
  debugPrint("==========NAME is ${doc.data()['name']}=============");
  debugPrint("==========NAME is ${doc.data()['name']}=============");

  print("==========NAME is ${doc.data()['name']}=============");
  print("==========NAME is ${doc.data()['name']}=============");
  print("==========NAME is ${doc.data()['name']}=============");

  return UserModel.fromSnapshot(doc);
});
}
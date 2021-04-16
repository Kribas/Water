// @dart=2.9


import 'package:drpani/Pages/FirstPage.dart';
import 'package:drpani/Pages/Profile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileScreen(),
    theme: ThemeData(
      primarySwatch: Colors.lightBlue,
    ),
  )
  );
}






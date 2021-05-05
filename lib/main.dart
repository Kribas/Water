

import 'package:drpani/Pages/App.dart';
import 'package:drpani/Pages/FirstPage.dart';
import 'package:drpani/Pages/Splash.dart';
import 'package:drpani/provider/app.dart';
import 'package:drpani/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: UserProvider.initialize()),
      ChangeNotifierProvider.value(value: AppProvider()),

    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreensController(),
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
    ),
  )
  );

}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch(user.status) {
      case Status.Uninitialized:
        return SplashScreen();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return FirstPage();
      case Status.Authenticated:
        return App();
      default:
        return FirstPage();
    }
  }
}










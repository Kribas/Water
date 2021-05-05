import 'package:drpani/Pages/Login.dart';
import 'package:drpani/Pages/SignUp.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Login',
                icon: Icon(Icons.lock,
                ),
              ),
              Tab(
                text: 'SignUp',
                icon: Icon(Icons.person,
                ),
              )
            ],
          ),
        ),
        body: TabBarView(children: [
          LogIn(),
          SignUp()
        ]),
      ),
    );
  }
}

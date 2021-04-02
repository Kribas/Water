import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(padding: EdgeInsets.only(top: 200),
          child: Center(
            child: Form(child: Column(
              children: [

              ],
            )),
          ),
          )
        ],
      )
    );
  }
}

import 'package:drpani/Components/Loading.dart';
import 'package:drpani/Pages/App.dart';
import 'package:drpani/provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:drpani/Utilities/Constants.dart';
import 'package:provider/provider.dart';
import 'package:drpani/Pages/ForgotPassword.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  String _email;


  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  final auth = FirebaseAuth.instance;



  Widget _buildEmailTF() {
    return Padding(
      padding:
      const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey.withOpacity(0.3),
        elevation: 0.0,
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: ListTile(
            title: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Email",
                icon: Icon(Icons.alternate_email),
              ),
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
              validator: (value) => !value.contains('@') ? 'Enter a valid email' : null,
            ),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      key: _key,
      body: user.status == Status.Authenticating ? Loading() : Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: ExactAssetImage('images/drpani_logo.jpg'),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),

                      _buildEmailTF(),

                      Container(
                        padding: EdgeInsets.symmetric(vertical: 25.0),
                        width: 300,
                        child: RaisedButton(
                          elevation: 0.0,
                          onPressed: () {
                            if(_formKey.currentState.validate()) {
                              auth.sendPasswordResetEmail(email: _email);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password reset link sent')));
                              Navigator.pop(context);
                            }

                          },
                          padding: EdgeInsets.all(15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Colors.deepPurple[900],
                          child: Text(
                            'SEND LINK',
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 1.5,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),



    );
  }
}





import 'package:drpani/Components/GoogleSignInButton.dart';
import 'package:drpani/Components/Loading.dart';
import 'package:drpani/Pages/App.dart';
import 'package:drpani/db/google_authentication.dart';
import 'package:drpani/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:drpani/Utilities/Constants.dart';
import 'package:provider/provider.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  bool hidePass = true;

  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();




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
              controller: _email,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Email",
                icon: Icon(Icons.alternate_email),
              ),
              validator: (value) => !value.contains('@') ? 'Enter a valid email' : null,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordTF() {
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
              obscureText: hidePass,
              controller: _password,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Password",
                icon: Icon(Icons.lock_outline),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return "The password field cannot be empty";
                } else if (value.length < 6) {
                  return "the password has to be at least 6 characters long";
                }
                return null;
              },
            ),
            trailing: IconButton(
                icon: Icon(Icons.remove_red_eye),
                onPressed: () {
                  setState(() {
                    hidePass = !hidePass;
                  });
                }),
          ),
        ),
      ),
    );
  }

//  Widget _buildForgotPasswordBtn() {
//    return Container(
//      child: FlatButton(
//        onPressed: () {
//
//        },
//        padding: EdgeInsets.only(right: 0.0),
//        child: Text(
//          'Forgot Password?',
//          style: kLabelStyle,
//        ),
//      ),
//    );
//  }






  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
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

                            Column(
                              children: [
                                _buildEmailTF(),
                                SizedBox(height: 30.0),
                                _buildPasswordTF()

                              ],
                            ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 25.0),
                            width: 300,
                            child: RaisedButton(
                              elevation: 0.0,
                              onPressed: () async {
                                if(_formKey.currentState.validate()) {
                                  if(!await user.signIn(_email.text, _password.text)) {
                                      _key.currentState.showSnackBar(SnackBar(content: Text('SignIn Failed')));
                                      return;
                                  }
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => App()));

                                }
                              },
                              padding: EdgeInsets.all(15.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              color: Colors.deepPurple[900],
                              child: Text(
                                'LOGIN',
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
                            //_buildForgotPasswordBtn(),

                            FutureBuilder(
                              future: GoogleAuthentication.initializeFirebase(context: context),
                              builder: (context,snapshot) {
                                if(snapshot.hasError) {
                                  return Text('Error initializing firebase');
                                } else if(snapshot.connectionState == ConnectionState.done) {
                                  return GoogleSignInButton();
                                }
                                return CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color> (
                                    Colors.orange
                                  ),
                                );

                              },
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
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:drpani/Utilities/Constants.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();



  Widget _buildNumberTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            hintText: 'Email',
            hintStyle: kHintTextStyle,
          ),
          validator: (value) => !value.contains('@') ? "Field must contain a valid email" : null,
          controller: _emailController,
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          obscureText: true,
          style: TextStyle(
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            hintText: 'Enter your Password',
            hintStyle: kHintTextStyle,
          ),
          validator: (value) {
            if(value.isEmpty) {
              return 'The password field cannot be empty';
            }else if(value.length < 6) {
              return 'The password has to be atleast 6 characters long';
            }else {
              return null;
            }
          },
          controller: _passwordController,
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      child: FlatButton(
        onPressed: () {

        },
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }


  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: 300,
      child: RaisedButton(
        elevation: 0.0,
        onPressed: () {

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
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Sign in with',
          style: kLabelStyle,
        ),
      ],
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: _buildSocialBtn(
            () => print('Login with Google'),
        AssetImage(
          'images/google.jpg',
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
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

                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              _buildNumberTF(),
                              SizedBox(height: 30.0),
                              _buildPasswordTF()

                            ],
                          ),
                        ),
                        _buildLoginBtn(),
                        _buildForgotPasswordBtn(),
                        _buildSignInWithText(),
                        _buildSocialBtnRow(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
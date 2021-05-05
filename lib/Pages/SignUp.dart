import 'package:drpani/Pages/App.dart';
import 'package:drpani/Pages/Home.dart';
import 'package:drpani/Pages/Notifications.dart';
import 'package:drpani/db/user_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:drpani/Utilities/Constants.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../main.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UserServices _userServices = UserServices();

  DatabaseReference dbRef = FirebaseDatabase.instance.reference().child("Users");


  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  bool hidePass = true;

  Widget _buildNameTF() {
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
              controller: _name,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Full Name",
                icon: Icon(Icons.person_outline),
              ),
              validator: (value) {
                if(value.isEmpty) {
                  return 'The name field cannot be empty';
                }else {
                  return null;
                }
              },
            ),
          ),
        ),
      ),
    );
  }

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

  Widget _buildNewPasswordTF() {
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

//  Widget _buildReEnterPasswordTF() {
//    return Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: <Widget>[
//        TextFormField(
//          keyboardType: TextInputType.text,
//          obscureText: true,
//          style: TextStyle(
//            fontFamily: 'OpenSans',
//          ),
//          decoration: InputDecoration(
//            hintText: 'Re-enter Password',
//            hintStyle: kHintTextStyle,
//          ),
//          controller: _confirmPasswordTextController,
//          validator: (value) {
//            if(value == null) {
//              return 'The password field cannot be empty';
//            }else if(value.length < 6) {
//              return 'The password has to be atleast 6 characters long';
//            }else if(_password.text!=value){
//              return 'The passwords do not match';
//            }else {
//              return null;
//            }
//          },
//        ),
//      ],
//    );
//  }


//  Widget _buildCategory() {
//    return Container(
//      width: 300,
//      child: DropdownButton<String>(
//        value: dropdownValue,
//        icon: const Icon(Icons.arrow_drop_down),
//        iconSize: 24,
//        elevation: 16,
//        onChanged: (String? newValue)
//          {
//          setState(() {
//          dropdownValue = newValue!;
//          });
//          },
//
//        items: <String>['Category',
//          'Home',
//          'Apartments,Housing and Colony',
//          'Office',
//          'Grocery Shop',
//          'Bank and Finanace',
//          'Restaurants and Bakery',
//          'Hotel and Guest House',
//          'Canteen',
//          'Super Market and Mini Mart',
//          'Hospital and Medical',
//          'Factory',
//          'Others'
//        ]
//            .map<DropdownMenuItem<String>>((String value) {
//          return DropdownMenuItem<String>(
//            value: value,
//            child: Text(value),
//          );
//        }).toList(),
//      ),
//    );
//  }

  Widget _buildSignUpBtn() {
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
          'SIGNUP',
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: Stack(
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
                          _buildNameTF(),
                          SizedBox(height: 30.0),
                          _buildEmailTF(),
                          SizedBox(height: 30.0),
                          _buildNewPasswordTF()

                        ],
                      ),
                      _buildSignUpBtn(),
                      //_buildForgotPasswordBtn()
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



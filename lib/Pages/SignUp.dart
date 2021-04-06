import 'package:flutter/material.dart';
import 'package:drpani/Utilities/Constants.dart';
import 'package:flutter/services.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _mobileNumberTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _confirmPasswordTextController = TextEditingController();
  TextEditingController _referralCodeTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  String dropdownValue = "Category";

  Widget _buildNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          keyboardType: TextInputType.text,
          style: TextStyle(
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            hintText: 'Name',
            hintStyle: kHintTextStyle,
          ),
          controller: _nameTextController,
          validator: (value) {
            if(value.isEmpty) {
              return "The name field cannot be empty";
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildMobileNumberTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          keyboardType: TextInputType.number,
          style: TextStyle(
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            hintText: 'Mobile Number',
            hintStyle: kHintTextStyle,
          ),
          controller: _mobileNumberTextController,
          validator: (value) {
            if(value.isEmpty) {
              return "The number field cannot be empty";
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildNewPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          keyboardType: TextInputType.text,
          obscureText: true,
          style: TextStyle(
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            hintText: 'New Password',
            hintStyle: kHintTextStyle,
          ),
          controller: _passwordTextController,
          validator: (value) {
            if(value.isEmpty) {
              return 'The password field cannot be empty';
            }else if(value.length < 4) {
              return 'The password has to be atleast 4 characters long';
            }else {
              return null;
            }
          },
        ),
      ],
    );
  }

  Widget _buildReEnterPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          keyboardType: TextInputType.text,
          obscureText: true,
          style: TextStyle(
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            hintText: 'Re-enter Password',
            hintStyle: kHintTextStyle,
          ),
          controller: _confirmPasswordTextController,
          validator: (value) {
            if(value.isEmpty) {
              return 'The password field cannot be empty';
            }else if(value.length < 4) {
              return 'The password has to be atleast 4 characters long';
            }else if(_passwordTextController.text!=value){
              return 'The passwords do not match';
            }else {
              return null;
            }
          },
        ),
      ],
    );
  }

  Widget _buildReferralCodeTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          keyboardType: TextInputType.number,
          style: TextStyle(
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            hintText: 'Referral Code(if any)',
            hintStyle: kHintTextStyle,
          ),
          controller: _referralCodeTextController,
        ),
      ],
    );
  }

  Widget _buildCategory() {
    return Container(
      width: 300,
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        onChanged: (String newValue) {
      setState(() {
      dropdownValue = newValue;
      });
      },
        items: <String>['Category',
          'Home',
          'Apartments,Housing and Colony',
          'Office',
          'Grocery Shop',
          'Bank and Finanace',
          'Restaurants and Bakery',
          'Hotel and Guest House',
          'Canteen',
          'Super Market and Mini Mart',
          'Hospital and Medical',
          'Factory',
          'Others'
        ]
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

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
                          radius: 50,
                          backgroundImage: ExactAssetImage('images/drpani_logo.jpg'),
                        ),
                        SizedBox(height: 30.0),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              _buildNameTF(),
                              SizedBox(
                                height: 30.0,
                              ),
                              _buildMobileNumberTF(),
                              SizedBox(
                                height: 30.0,
                              ),
                              _buildNewPasswordTF(),
                              SizedBox(
                                height: 30.0,
                              ),
                              _buildReEnterPasswordTF(),
                              SizedBox(
                                height: 30.0,
                              ),
                              _buildReferralCodeTF(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        _buildCategory(),
                        SizedBox(
                          height: 30.0,
                        ),
                        _buildSignUpBtn()


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



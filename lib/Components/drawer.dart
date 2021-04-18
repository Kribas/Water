import 'package:drpani/Pages/AboutUs.dart';
import 'package:drpani/Pages/ContactUs.dart';
import 'package:drpani/Pages/Feedback.dart';
import 'package:drpani/Pages/FirstPage.dart';
import 'package:drpani/Pages/PrivacyPolicy.dart';
import 'package:drpani/Pages/Profile.dart';
import 'package:drpani/Pages/Refer.dart';
import 'package:drpani/Pages/ShopNow.dart';
import 'package:drpani/Pages/TermsandConditions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AppDrawer extends StatefulWidget {

  final User _user;

  const AppDrawer({Key? key, required User user})
      : _user = user,
        super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {

  late User _user;

  final GoogleSignIn googleSignIn = GoogleSignIn();


  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FirstPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    _user = widget._user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => ProfileScreen(user: _user,)));
              },
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                accountName: Text(_user.displayName!),
                accountEmail: Text(_user.email!),
                currentAccountPicture: _user.photoURL != null
                  ? CircleAvatar(
                  backgroundImage: NetworkImage(_user.photoURL!),
                )
                    :
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                  )
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => ProfileScreen(user: _user,)));
              },
              leading: Icon(FontAwesomeIcons.user),
              title: Text('Profile'),
            ),

            ListTile(
              leading: Icon(FontAwesomeIcons.store),
              title: Text('Shop Now'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ShopNowScreen()));
              },
            ),

            ListTile(
              leading: Icon(FontAwesomeIcons.comment),
              title: Text('Feedback'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FeedbackScreen()));
              },
            ),

            ListTile(
              leading: Icon(FontAwesomeIcons.calendar),
              title: Text('Terms and Conditions'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TermsandConditionsScreen()));

              },
            ),

            ListTile(
              leading: Icon(Icons.security),
              title: Text('Privacy Policy'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()));

              },

            ),

            ListTile(
              leading: Icon(Icons.send),
              title: Text('Refer a Friend'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ReferScreen()));
              },

            ),

            ListTile(
              leading: Icon(FontAwesomeIcons.question),
              title: Text('About Us'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsScreen()));

              },

            ),

            ListTile(
              leading: Icon(Icons.people),
              title: Text('Contact Us'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsScreen()));
              },

            ),

            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: () async{
                await FirebaseAuth.instance.signOut();
                googleSignIn.signOut();

                Navigator.of(context)
                    .pushReplacement(_routeToSignInScreen());
              },

            ),

          ],
        ),
      ),
    );
  }
}

import 'package:drpani/Pages/AboutUs.dart';
import 'package:drpani/Pages/ContactUs.dart';
import 'package:drpani/Pages/Feedback.dart';
import 'package:drpani/Pages/PrivacyPolicy.dart';
import 'package:drpani/Pages/Profile.dart';
import 'package:drpani/Pages/Refer.dart';
import 'package:drpani/Pages/ShopNow.dart';
import 'package:drpani/Pages/TermsandConditions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              accountName: Text('Kribas Rimal'),
              accountEmail: Text('kribasrimal180@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/ball1.png'),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => ProfileScreen()));
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

          ],
        ),
      ),
    );
  }
}

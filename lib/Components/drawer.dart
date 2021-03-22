import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
          Padding(padding: EdgeInsets.only(top: 20)),

          ListTile(
            leading: Icon(FontAwesomeIcons.user),
            title: Text('Profile'),
          ),

          ListTile(
            leading: Icon(FontAwesomeIcons.store),
            title: Text('Shop Now'),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(FontAwesomeIcons.comment),
            title: Text('Feedback'),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(FontAwesomeIcons.calendar),
            title: Text('Terms and Conditions'),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.security),
            title: Text('Privacy Policy'),
            onTap: () {},

          ),

          ListTile(
            leading: Icon(Icons.send),
            title: Text('Refer a Friend'),
            onTap: () {},

          ),

          ListTile(
            leading: Icon(FontAwesomeIcons.question),
            title: Text('About Us'),
            onTap: () {},

          ),

          ListTile(
            leading: Icon(Icons.people),
            title: Text('Contact Us'),
            onTap: () {},

          ),

        ],
      ),
    );
  }
}

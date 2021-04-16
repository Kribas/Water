import 'package:drpani/Pages/FirstPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileScreen extends StatefulWidget {

  final User _user;

  const ProfileScreen({Key? key, required User user})
      : _user = user,
        super(key: key);


  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  late User _user;

  bool isSwitched = false;

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


    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.indigo[900],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                _user.photoURL != null ?
                CircleAvatar(
                  backgroundImage: NetworkImage(_user.photoURL!),
                  radius: 50,
                )
                :
                CircleAvatar(
                  backgroundImage: AssetImage('images/UserProfile.png'),
                  radius: 50,
                ),



                  SizedBox(height: 10,),

                  Text(_user.displayName!,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  ),
                  Text(_user.email!,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  )
                ],
              )
            ),

            SizedBox(height: 10,),

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ListTile(
                      onTap: () {},
                      leading: Icon(Icons.shopping_cart,
                      color: Colors.blueAccent,
                        size: 30,
                      ),
                      title: Text('My Orders'),
                      subtitle: Text('View my orders'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.local_offer,
                        color: Colors.blueAccent,
                        size: 30,
                      ),
                      title: Text('Subscribe Offer'),
                      subtitle: Text('Suscribe to Offers/Newsletters'),
                      trailing: Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                        activeTrackColor: Colors.indigo[200],
                        activeColor: Colors.indigo[900],
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ListTile(
                      onTap: () {},
                      leading: Icon(Icons.pin_drop,
                        color: Colors.blueAccent,
                        size: 30,
                      ),
                      title: Text('Address'),
                      subtitle: Text('View your address detail'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ListTile(
                      onTap: () {},
                      leading: Icon(Icons.comment,
                        color: Colors.blueAccent,
                        size: 30,
                      ),
                      title: Text('Feedback'),
                      subtitle: Text('Provide feedback'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ListTile(
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        googleSignIn.signOut();

                        Navigator.of(context)
                            .pushReplacement(_routeToSignInScreen());
                      },
                      leading: Icon(Icons.logout,
                        color: Colors.blueAccent,
                        size: 30,
                      ),
                      title: Text('Sign Out'),
                      subtitle: Text('Sign out from this app'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

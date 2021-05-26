import 'dart:io';
import 'dart:math';

import 'package:drpani/Pages/FirstPage.dart';
import 'package:drpani/provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:drpani/Components/avatar.dart';

class ProfileScreen extends StatefulWidget {



  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  bool isSwitched = false;

  final picker = ImagePicker();

  File imageFile;

  Future getImage() async {
     PickedFile pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
     var tempImage = File(pickedFile.path);
     setState(() {
       if(pickedFile!=null) {
         imageFile = tempImage;
       }else {
         print('No image selected');
       }
     });
  }

  uploadImage() {
    var randomno = Random(25);
    final Reference storageRef = FirebaseStorage.instance.ref().child(
      'profilepics/${randomno.nextInt(5000).toString()}.jpg');

    UploadTask task = storageRef.putFile(imageFile);

    task.then((value) {

    }).catchError((e) {
      print(e);
    });
  }

  String imageLink;



  @override
  Widget build(BuildContext context) {

    final userProvider = Provider.of<UserProvider>(context);


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

//                _user.photoURL != null ?
//                CircleAvatar(
//                  backgroundImage: NetworkImage(_user.photoURL),
//                  radius: 50,
//                )
//



                  SizedBox(height: 10,),

                  Text(userProvider.userModel?.name ?? "loading username",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  ),
                  Text(userProvider.userModel?.email??"loading email",
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
                      onTap: () {
                        userProvider.signOut();
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (context) => FirstPage()));
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

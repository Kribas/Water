import 'package:drpani/Components/Categories.dart';
import 'package:drpani/Components/ImageCarousel.dart';
import 'package:drpani/Components/Products.dart';
import 'package:drpani/Components/drawer.dart';
import 'package:drpani/Pages/Refer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {

  final User _user;

  const Home({Key key, User user})
      : _user = user,
        super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  User _user;

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
        title: Text('Home'),
      ),

      drawer: AppDrawer(user: _user),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: ImageCarousel(),
              ),
            ),

            Divider(),

            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Categories()
            ),
            Divider(),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ReferScreen()));

                },
                child: Image.asset('images/Image1.jpg',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text('Products',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),
                  )),
            ),

            Products(),


          ],
        ),
      ),


    );
  }
}

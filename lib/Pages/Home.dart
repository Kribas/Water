import 'package:drpani/Components/Categories.dart';
import 'package:drpani/Components/ImageCarousel.dart';
import 'package:drpani/Components/Products.dart';
import 'package:drpani/Components/drawer.dart';
import 'package:drpani/Pages/Refer.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {

  final String uid;

  Home({this.uid});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),

      drawer: AppDrawer(),

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

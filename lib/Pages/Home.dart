import 'package:drpani/Components/ImageCarousel.dart';
import 'package:drpani/Components/drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),

      drawer: AppDrawer(),

      body: Column(
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 30.0,
                          child: Icon(Icons.store,
                          color: Colors.white,
                            size: 35,
                          ),
                      ),

                      SizedBox(height: 5,),


                      Text('Shop Now'),
                    ],
                  ),
                ),

                InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 30.0,
                        child: Icon(FontAwesomeIcons.mapMarked,
                        size: 30,
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(height: 5,),


                      Text('Track Order'),
                    ],
                  ),
                ),

                InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 30.0,
                        child: Icon(FontAwesomeIcons.gift,
                        size: 30,
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(height: 5,),


                      Text('My Rewards'),
                    ],
                  ),
                ),

                InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 30.0,
                        child: Icon(FontAwesomeIcons.comment,
                        size: 30,
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(height: 5,),

                      Text('Feedback'),

                    ],
                  ),
                ),

              ],
            ),
          ),
          Divider(),

        ],
      ),

    );
  }
}
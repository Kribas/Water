import 'package:drpani/Pages/Feedback.dart';
import 'package:drpani/Pages/MyRewards.dart';
import 'package:drpani/Pages/ShopNow.dart';
import 'package:drpani/Pages/TrackOrder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ShopNowScreen()));

          },
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


              Text('Shop Now',
                style: TextStyle(
                    fontSize: 13
                ),
              )
            ],
          ),
        ),

        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => TrackOrderScreen()));

          },
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


              Text('Track Order',
                style: TextStyle(
                    fontSize: 13
                ),
              ),
            ],
          ),
        ),

        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyRewardsScreen()));

          },
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


              Text('My Rewards',
                style: TextStyle(
                    fontSize: 13
                ),
              ),
            ],
          ),
        ),

        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => FeedbackScreen()));

          },
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

              Text('Feedback',
                style: TextStyle(
                    fontSize: 13
                ),
              ),

            ],
          ),
        ),

      ],
    );
  }
}

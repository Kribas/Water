import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.indigo[900],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('images/UserProfile.png'),
                      radius: 50,
                    ),
                    Positioned(
                      top: 70,
                      left: 70,
                      child: Icon(
                        Icons.camera_alt,color: Colors.white,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10,),

                Text('Kribas Rimal',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
                ),
                Text('kribasrimal180@gmail.com',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                )
              ],
            )
          )
        ],
      ),
    );
  }
}

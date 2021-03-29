import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 350,
          height: 110,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
          ),
          child: Center(
            child: ListTile(
              onTap: () {

              },
              leading: Icon(FontAwesomeIcons.shuttleVan,
              color: Colors.blue,
              ),
              title: Text('20 Liter Jar'),
              trailing: Image(
                image: NetworkImage('https://5.imimg.com/data5/RL/LA/VI/SELLER-16401673/mineral-water-jar-500x500.jpg'),
              ),
            ),
          )
        ),

        SizedBox(height: 10,),

        Container(
            width: 350,
            height: 110,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
            ),
            child: Center(
              child: ListTile(
                onTap: () {

                },
                leading: Icon(FontAwesomeIcons.shuttleVan,
                  color: Colors.blue,
                ),
                title: Text('1 Liter Bottle(Cartoon)'),
                trailing: Image(
                  image: NetworkImage('https://5.imimg.com/data5/FG/WH/MY-44916065/mineral-water-500x500-500x500.jpg'),
                ),
              ),
            )
        ),




      ],
    );
  }
}


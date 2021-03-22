import 'package:drpani/Components/ImageCarousel.dart';
import 'package:drpani/Components/drawer.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),

      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 200,
          width: double.infinity,
          child: ImageCarousel(),
        ),
      ),
    );
  }
}
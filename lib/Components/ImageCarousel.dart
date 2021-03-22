import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ImageCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Carousel(
      boxFit: BoxFit.cover,
      dotSize: 3.0,
      indicatorBgPadding: 5.0,
      autoplay: false,
      images: [
        AssetImage('images/CarouselImage1.jpg'),
        AssetImage('images/CarouselImage2.jpg'),
        AssetImage('images/CarouselImage3.jpg'),
        AssetImage('images/CarouselImage4.jpg'),
      ],
    );
  }
}

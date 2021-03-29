import 'package:flutter/material.dart';
import 'package:drpani/Models/Product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  Future<List<Product>> future;
  List<Product> product;

  void fetch() async {
    future = Product.browse();
    product = await future;
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

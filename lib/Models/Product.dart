import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
part 'Product.g.dart';


@JsonSerializable()
class Product {
  final String name;
  final String picture;

  Product({this.name,this.picture});

  factory Product.fromJson(Map<String,dynamic> json) => _$ProductFromJson(json);


  static Future<List<Product>> browse() async {
    String url = 'https://run.mocky.io/v3/c67d094a-992a-4f14-b6e1-f1b46607c037';

    http.Response response = await http.get(Uri.parse(url));
    List content = jsonDecode(response.body);

    List<Product> _product = content.map((json) => Product.fromJson(json)).toList();

    return _product;

  }


}




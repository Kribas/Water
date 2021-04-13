import 'package:drpani/Models/Product.dart';
import 'package:drpani/Pages/ProductDetail.dart';
import 'package:flutter/material.dart';

class ShopNowScreen extends StatefulWidget {
  @override
  _ShopNowScreenState createState() => _ShopNowScreenState();
}

class _ShopNowScreenState extends State<ShopNowScreen> {

  late Future<List<Product>> future;
  late List<Product> product;

  void fetch() async {
    future = Product.browse();
    product = await future;
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Product Categories'),
      ),

      body: FutureBuilder(
          future: future,
          builder: (BuildContext context,AsyncSnapshot<dynamic> snapshot) {
            switch(snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                return Center(child: CircularProgressIndicator(),);

              default:
                var products = snapshot.data;
                return ListView.separated(
                    itemBuilder: (context,index) {
                      Product product = products[index];
                      return ListTile(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail()));
                        },
                        title: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueAccent)
                          ),
                          child: Column(
                            children: [
                              Image(
                                width: 200,
                                height: 200,
                                image: NetworkImage(product.picture),
                              ),
                              SizedBox(height: 10,),
                              Text(product.name,
                                style: TextStyle(
                                    fontSize: 20
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context,index) => Divider(),
                    itemCount: products?.length ?? 0
                );
            }

          }
      ),
    );
  }
}

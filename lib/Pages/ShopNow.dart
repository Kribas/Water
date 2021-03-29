import 'package:drpani/Models/Product.dart';
import 'package:flutter/material.dart';

class ShopNowScreen extends StatefulWidget {
  @override
  _ShopNowScreenState createState() => _ShopNowScreenState();
}

class _ShopNowScreenState extends State<ShopNowScreen> {

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
    return Scaffold(

      appBar: AppBar(
        title: Text('Product Categories'),
      ),

      body: FutureBuilder(
          future: future,
          builder: (BuildContext context,AsyncSnapshot<dynamic> snapshot) {
            var products = snapshot.data;
            return ListView.separated(
                itemBuilder: (context,index) {
                  Product product = products[index];
                  return ListTile(
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
      ),
    );
  }
}

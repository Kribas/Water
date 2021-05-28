import 'package:flutter/material.dart';

enum Status { Regular,Premium }

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int _itemJarExchangeCount = 0;
  int _itemNewJarCount = 0;
  int _totalPrice = 0;

  Status _status;


  Widget buildRegularDetail() {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue)
                ),
                child: Image(
                    height: 200,
                    width: 200,
                    image: AssetImage('images/regularwaterjar.jpg')),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Believe Moist',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                  ),
                ),
                SizedBox(height: 10),
                Text('Buy with Jar Exchange Rs.70.0',
                  style: TextStyle(
                      color: Colors.purple[300]
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    _itemJarExchangeCount!=0? CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 20,
                        child: new  IconButton(
                          icon: new Icon(Icons.remove),onPressed: ()=>setState((){
                          _itemJarExchangeCount-=1;
                          _totalPrice = _totalPrice - 70;

                        }),)):new Container(),
                    SizedBox(width: 10,),

                    new Text(_itemJarExchangeCount.toString()),

                    SizedBox(width: 10,),
                    CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 20,
                        child: IconButton(icon: new Icon(Icons.add),onPressed: ()=>setState((){
                          _itemJarExchangeCount+=1;
                          _totalPrice = _totalPrice + 70;
                        }))),
                  ],
                ),

                SizedBox(height: 10),

                Text('Buy with New Jar Rs.350.0',
                  style: TextStyle(
                      color: Colors.purple[300]
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    _itemNewJarCount!=0? CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 20,
                        child: new  IconButton(
                          icon: new Icon(Icons.remove),
                          onPressed: ()=>setState((){
                            _itemNewJarCount-=1;
                            _totalPrice = _totalPrice - 350;
                          }),)):new Container(),
                    SizedBox(width: 10,),
                    new Text(_itemNewJarCount.toString()),
                    SizedBox(width: 10,),
                    CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: IconButton(
                            icon: new Icon(Icons.add),onPressed: ()=>setState((){
                          _itemNewJarCount+=1;
                          _totalPrice = _totalPrice + 350;
                        }))),
                  ],
                ),
                SizedBox(height: 10,),
                Text("Total: Rs$_totalPrice")
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget buildPremiumDetail() {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue)
                ),
                child: Image(
                    height: 200,
                    image: AssetImage('images/premiumwaterjar.png')),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Drink Me',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                  ),
                ),
                SizedBox(height: 10),
                Text('Buy with Jar Exchange Rs.100.0',
                  style: TextStyle(
                      color: Colors.purple[300]
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    _itemJarExchangeCount!=0? CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 20,
                        child: new  IconButton(
                          icon: new Icon(Icons.remove),onPressed: ()=>setState((){
                          _itemJarExchangeCount-=1;
                          _totalPrice = _totalPrice - 100;

                        }),)):new Container(),
                    SizedBox(width: 10,),

                    new Text(_itemJarExchangeCount.toString()),

                    SizedBox(width: 10,),
                    CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 20,
                        child: IconButton(icon: new Icon(Icons.add),onPressed: ()=>setState((){
                          _itemJarExchangeCount+=1;
                          _totalPrice = _totalPrice + 100;
                        }))),
                  ],
                ),

                SizedBox(height: 10),

                Text('Buy with New Jar Rs.600.0',
                  style: TextStyle(
                      color: Colors.purple[300]
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    _itemNewJarCount!=0? CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 20,
                        child: new  IconButton(
                          icon: new Icon(Icons.remove),
                          onPressed: ()=>setState((){
                            _itemNewJarCount-=1;
                            _totalPrice = _totalPrice - 600;
                          }),)):new Container(),
                    SizedBox(width: 10,),
                    new Text(_itemNewJarCount.toString()),
                    SizedBox(width: 10,),
                    CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: IconButton(
                            icon: new Icon(Icons.add),onPressed: ()=>setState((){
                          _itemNewJarCount+=1;
                          _totalPrice = _totalPrice + 600;
                        }))),
                  ],
                ),
                SizedBox(height: 10,),
                Text("Total: Rs$_totalPrice")
              ],
            )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: Column(
        children: [
          _status == Status.Regular ? buildRegularDetail() : buildPremiumDetail(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      _status = Status.Regular;
                      _totalPrice = 0;
                      _itemNewJarCount = 0;
                      _itemJarExchangeCount = 0;

                    });
                  },
                  child: Text('Regular')),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      _status = Status.Premium;
                      _totalPrice = 0;
                      _itemNewJarCount = 0;
                      _itemJarExchangeCount = 0;
                    });
                  },
                  child: Text('Premium'))
            ],
          )

        ],
      )
    );
  }
}

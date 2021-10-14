import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/customClasses.dart';


class FoodOrderPage extends StatefulWidget {

  //FoodOrderPage({Key key, @required this.orderedFoodDetails, @required this.customerDetails}) : super(key:key);

  @override
  _FoodOrderPageState createState() => _FoodOrderPageState();
}


class _FoodOrderPageState extends State<FoodOrderPage> {

  /*List<Map> orderedFood = [
    {'name': 'chicken stew', 'image': 'assets/images/img1.jpg', 'price': '2,000', 'averageRating': '3.5'},
  ];*/


  //Map orderedFoodDetails;
  Map orderedFoodDetails;
  int _quantity = 1;



  /*Map customerDetails = {
    'address':'Lagos',
    'phoneNumber':'08063458969',
    'lastName': 'Komolehin'
  };*/

  @override
  Widget build(BuildContext context) {

    orderedFoodDetails = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('My Order'),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            //height: MediaQuery.of(context).size.height,
            //heightFactor: 100,
            child: Container(
              //height: MediaQuery.of(context).size.height,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 150,
                          margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: Card(
                            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                            elevation: 0,
                            color: Color.fromRGBO(35, 24, 75, 1.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.all(30),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          orderedFoodDetails['address'],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          'Edit',
                                          style: TextStyle(
                                              color: Colors.amber
                                          ),
                                        )
                                      ]
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(30, 10, 20, 20),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        'N' + orderedFoodDetails['price'],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white54
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: Column(
                            children: <Widget>[
                              Price(
                                  Container(
                                    width: 100,
                                    height: 100,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image(
                                        image: AssetImage(orderedFoodDetails['image']),
                                        fit: BoxFit.fill,

                                      ),
                                    ),
                                  ),
                                  _quantity.toString() + ' x ' + orderedFoodDetails['name'], 'N' + orderedFoodDetails['price']),
                              Price(
                                  Container(

                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromRGBO(254,247,236,1),
                                    ),
                                    child: ClipRRect(

                                      child: Icon(
                                        Icons.delivery_dining,
                                        size: 25,
                                        color: Color.fromRGBO(245, 192, 85, 1),
                                      ),
                                    ),
                                  ), 'Delivery', 'N' + '0.00'),

                              Container(
                                margin: EdgeInsets.fromLTRB(0, 50, 0, 30),
                                width: MediaQuery.of(context).size.width,
                                //color: Colors.red,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Quantity',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),

                                      child: Row(
                                        //mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          Container(
                                              height: 40,
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  top: BorderSide(
                                                      width: 1,
                                                      color: Colors.black12
                                                  ),
                                                  right: BorderSide(
                                                      width: 1,
                                                      color: Colors.black12
                                                  ),

                                                  bottom: BorderSide(
                                                      width: 1,
                                                      color: Colors.black12
                                                  ),

                                                  left: BorderSide(
                                                      width: 1,
                                                      color: Colors.black12
                                                  ),

                                                ),
                                                borderRadius: BorderRadius.circular(10),



                                              ),
                                              child: Row(
                                                children: <Widget>[
                                                  TextButton(
                                                    onPressed: ()=>setState((){
                                                      //quantity won't go less than one
                                                      _quantity > 1 ? _quantity -= 1 : _quantity = 1;
                                                      print(orderedFoodDetails);
                                                    }
                                                    ),
                                                    child: Text('-'),
                                                    style: TextButton.styleFrom(
                                                      primary: Colors.black,
                                                    ),

                                                  ),
                                                  //quantity of the number of orders
                                                  Text(_quantity.toString()),
                                                  TextButton(onPressed: ()=>setState(()=>_quantity += 1), child: Text('+'),
                                                    style: TextButton.styleFrom(
                                                      primary: Colors.black,
                                                    ),
                                                  ),

                                                ],
                                              )
                                          ),

                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),

                    Container(

                          width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: Column(
                            children: [
                              Container(
                              margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                      'Total:',
                                      style: TextStyle(
                                        fontSize: 20
                                      )
                                  ),
                                  Text(
                                      'N'+'2,000',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      )
                                  )
                                ],
                              ),
                            ),
                          SizedBox(
                            height: 20,
                            child: Divider(
                              height: 4,
                              color: Colors.black,
                              thickness: 0.1,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
                                child: Container(
                                  //margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
                                  
                                  child: TextButton(onPressed: (){}, child: Icon(
                                    Icons.add_shopping_cart
                                  ),
                                      style: TextButton.styleFrom(
                                          primary: Colors.black,
                                          backgroundColor: Color.fromRGBO(245, 192, 85, 1),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(10),
                                                  bottomRight: Radius.circular(10)

                                              )
                                          )
                                      )

                                  ),
                                ),
                              ),
                            Container(
                              //margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
                              width: 140,
                              child: TextButton(onPressed: (){}, child: Row(
                                              children: <Widget>[
                                                Padding(
                                                    padding: EdgeInsets.all(8),
                                                    child: Text('Checkout')
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_sharp
                                                )

                                              ],
                                            ),
                                              style: TextButton.styleFrom(
                                                primary: Colors.black,
                                                backgroundColor: Color.fromRGBO(245, 192, 85, 1),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(10),
                                                    bottomLeft: Radius.circular(10)

                                                  )
                                                )
                                              )

                                            ),
                                          ),
          ]
                          ),


                              ],
                            ),
                          )
          ]
      ),
                        ),
                    //),
                   // )

                ),
            ),
          )
          //),
        //),
    );
  }
}

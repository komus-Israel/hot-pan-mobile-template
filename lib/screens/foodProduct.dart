import 'package:flutter/material.dart';
import '../routes/routes.dart';
import '../screens/order.dart';

class FoodProducts extends StatelessWidget {

  List<Map> foodProducts= [
      {'name': 'chicken stew', 'image': 'assets/images/img1.jpg', 'price': '2000', 'averageRating': '3.5'},
      {'name': 'assorted okra', 'image': 'assets/images/img2.jpg', 'price': '2000', 'averageRating': '3.5'},
      {'name': 'fish stew', 'image': 'assets/images/img3.jpg', 'price': '2000', 'averageRating': '3.5'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(30, 0, 30, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: foodProducts.map((food)=>Container(

                margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Column(
                  children:  <Widget>[
                      Stack(

                      children: <Widget>[
                        Container(
                          height: 200,
                          width: 500,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage(food['image']),
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20)

                                ),
                              color: Color.fromRGBO(248, 248, 248, 1),
                            ),

                            child: Padding(
                              padding: EdgeInsets.all(10),
                                child: Text(
                                    'N' + food['price'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,

                                ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,

                        children: <Widget>[
                          Row(

                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Text(
                              food['name'],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                            ),

                              TextButton(
                                  onPressed: ()=>namedPageRoute(
                                      context,
                                      '/order',
                                      {'name': 'chicken stew', 'image': 'assets/images/img1.jpg', 'price': '4 ,000', 'averageRating': '3.5', 'address':'ilorin'}
                                      ),
                                  child: Text('Order'),
                                  style: ButtonStyle(
                                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                                  ),
                              )
                      ]
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),

                            child: Row(

                              children: [
                                Icon(
                                    Icons.star_rate_rounded,
                                    size: 17,
                                    color: Color.fromRGBO(237, 161, 69, 1),
                                ),
                                Text(
                                    food['averageRating']
                                ),

                              ],
                            ),
                          )

                        ],
                      ),
                    )
                ],
                ),
              )).toList(),
            ),
          )

        ),
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/categories.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  List<String> foodCategories = [
    'Soup', 'Stew', 'Sauce', 'Efo riro'
  ];

  List<Map> foodPictures= [
    {'name': 'chicken stew', 'image': 'assets/images/img1.jpg', 'price': '2000', 'averageRating': '3.5'},
    {'name': 'assorted okra', 'image': 'assets/images/img2.jpg', 'price': '2000', 'averageRating': '3.5'},
    {'name': 'fish stew', 'image': 'assets/images/img3.jpg', 'price': '2000', 'averageRating': '3.5'}
  ];

  String selected;




  @override

  void initState(){
    super.initState();
    selected = foodCategories[0];

  }

  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;


    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                    margin: EdgeInsets.fromLTRB(30, 60, 30, 30),
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),

                    child: Stack(
                      clipBehavior: Clip.hardEdge,
                        overflow: Overflow.visible,
                        children: <Widget>[
                                Positioned(

                                  child: FractionalTranslation(
                                    translation: Offset(-0.3, 0.1),
                                    child: Image(
                                      image: AssetImage('assets/images/delivery.png'),

                      ),
                                  ),
                                ),

                          Positioned(
                              top:30,
                              right:0,

                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                          'Quick and Easy',
                                        style: TextStyle(
                                          color: Colors.yellow,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                        child: Text(
                                            'Delivery',
                                          style: TextStyle(
                                              color: Color.fromRGBO(80,62,157,1),
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,

                                          ),
                                        ),
                                      )
                                ]
                                ),
                              )
                          ),
                              ],

                            ),
                  color: Color.fromRGBO(254,247,236,1),
      ),

                Container(
                  margin: EdgeInsets.fromLTRB(30, 0,0,0),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                  ),
                ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  margin: EdgeInsets.fromLTRB(0, 30,0,0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: foodCategories.length,
                    itemBuilder: (context, index){
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border(
                                top: BorderSide(width: 3, color: Colors.grey),
                                left: BorderSide(width: 3, color: Colors.grey),
                                bottom: BorderSide(width: 3, color: Colors.grey),
                                right: BorderSide(width: 3, color: Colors.grey)
                            ),
                            color:  selected == foodCategories[index] ? Colors.grey : Colors.transparent
                        ),
                        child: FlatButton(
                          child: Text(
                            foodCategories[index],
                            style: TextStyle(
                                color: selected == foodCategories[index] ? Colors.white : Colors.grey
                            ),
                          ),
                          onPressed: (){
                            setState(() {
                              selected = foodCategories[index];
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                categoryCarousel(foodPictures, widthSize)

    ]
                  ),
          ),
              ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hot_pan/components/customClasses.dart';


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
              children: foodProducts.map((food)=>FoodCard(food:food)).toList(),
            ),
          )

        ),
      ),
    );
  }
}

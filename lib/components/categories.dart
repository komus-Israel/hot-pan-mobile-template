import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



List<Map> food= [
  {'name': 'chicken stew', 'image': 'assets/images/img1.jpg', 'price': '2000', 'averageRating': '3.5'},
  {'name': 'assorted okra', 'image': 'assets/images/img2.jpg', 'price': '2000', 'averageRating': '3.5'},
  {'name': 'fish stew', 'image': 'assets/images/img3.jpg', 'price': '2000', 'averageRating': '3.5'}
];

Widget categoryCarousel(List category, double widthSize){
  return CarouselSlider.builder(
      itemCount: category.length,
      itemBuilder: (context, index, ind){
        return Container(

          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          width: widthSize * 0.8,
          decoration: BoxDecoration(
            //color: Colors.red
          ),
          child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image(
                    image: AssetImage(category[index]['image']),
                    fit: BoxFit.cover,
                    width: widthSize * 0.8,
                  ),
                ),

                Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30)
                      )
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      /*child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              category[index]['name']
                          ),

                          Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star_rate_rounded,
                                  size: 17,
                                  color: Color.fromRGBO(237, 161, 69, 1),
                                ),
                                Text(
                                    category[index]['averageRating']
                                ),
                              ],
                            ),
                          )

                        ],
                      ),*/
                      child: Text(
                          category[index]['name'],
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),

                  ),
                )
              ]
          ),
        );
      },
      options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true
      ));

}


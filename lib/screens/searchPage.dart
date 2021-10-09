import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hot_pan/components/customClasses.dart';



class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  List<Map> foodProducts= [
    {'name': 'chicken stew', 'image': 'assets/images/img1.jpg', 'price': '2000', 'averageRating': '3.5'},
    {'name': 'assorted okra', 'image': 'assets/images/img2.jpg', 'price': '2000', 'averageRating': '3.5'},
    {'name': 'fish stew', 'image': 'assets/images/img3.jpg', 'price': '2000', 'averageRating': '3.5'}
  ];

  bool isSearching=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Form(
          child: TextFormField(
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(),
              hintText: 'Efo Riro',
              hintStyle: TextStyle(
                color: Colors.black12
              )
            ),
            cursorColor: Colors.deepPurple,
            textInputAction: TextInputAction.search,
          )
        ),
        elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(30, 0, 30, 30),
        child: isSearching ? Center(
            child: Image(
              image: AssetImage(
                  'assets/images/loader.gif'
              ),
              height: 50,

            )
        ) : ListView.builder(
          itemCount: foodProducts.length,
            itemBuilder: (context, index){
              return FoodCard(food: foodProducts[index]);
            },
        ),
      ),
    );
  }
}

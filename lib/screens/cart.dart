import 'package:flutter/material.dart';
import '../components/customClasses.dart';
import '../routes/routes.dart';

List<Map> food= [
  {'name': 'chicken stew', 'image': 'assets/images/img1.jpg', 'price': '2000', 'averageRating': '3.5'},
  {'name': 'assorted okra', 'image': 'assets/images/img2.jpg', 'price': '2000', 'averageRating': '4.5'},
  {'name': 'fish stew', 'image': 'assets/images/img3.jpg', 'price': '2000', 'averageRating': '2.5'},
  {'name': 'chicken stew', 'image': 'assets/images/img1.jpg', 'price': '2000', 'averageRating': '3.5'},
  {'name': 'assorted okra', 'image': 'assets/images/img2.jpg', 'price': '2000', 'averageRating': '4.5'},
  {'name': 'fish stew', 'image': 'assets/images/img3.jpg', 'price': '2000', 'averageRating': '3.5'},
  {'name': 'chicken stew', 'image': 'assets/images/img1.jpg', 'price': '2000', 'averageRating': '3.0'},
  {'name': 'assorted okra', 'image': 'assets/images/img2.jpg', 'price': '2000', 'averageRating': '3.5'},
  {'name': 'fish stew', 'image': 'assets/images/img3.jpg', 'price': '2000', 'averageRating': '3.5'},
  {'name': 'chicken stew', 'image': 'assets/images/img1.jpg', 'price': '2000', 'averageRating': '3.5'},
  {'name': 'assorted okra', 'image': 'assets/images/img2.jpg', 'price': '2000', 'averageRating': '3.5'},
  {'name': 'fish stew', 'image': 'assets/images/img3.jpg', 'price': '2000', 'averageRating': '3.5'}
];


class FoodCart extends StatefulWidget {
  @override
  _FoodCartState createState() => _FoodCartState();
}

class _FoodCartState extends State<FoodCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: food.length,
          itemBuilder: (context, index){
            return Card(
              child: ListTile(
                leading: Container(
                  width: 70,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: Image(
                      width: 70,
                      fit: BoxFit.cover,
                      image: AssetImage(food[index]['image'])
                    ),
                  ),
                ),
                title: Text(
                    food[index]['name'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                subtitle: Text('N' + food[index]['price']),
                trailing: Container(
                  child: IconButton(
                    onPressed: (){print('deleted');},
                    icon: Icon(
                      Icons.delete,
                      color:Colors.black54,
                    ),
                  )
                ),
                onTap: ()=>namedPageRoute(context, '/order', {'name': food[index]['name'], 'image': food[index]['image'], 'price': food[index]['price'], 'averageRating': food[index]['averageRating'], 'address':'ilorin'}) ,

              ),
              elevation:0.0
            );
          }),
    );
  }
}

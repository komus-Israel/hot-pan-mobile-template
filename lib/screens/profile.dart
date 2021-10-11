import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

  Map profileAccount =
    {
      'name':'Komolehin Israel',
      'email':'komolehinisrael@gmail.com',
      'address':'Lagos',
      'number_of_purchases':10,
    };

 List<Map> gridOption = [
   {'name':'Cart', 'number': '10', 'icon':Icons.shopping_cart},
   {'name':'Total Orders', 'number': '20', 'icon':Icons.border_all_rounded},
   {'name':'Current Order', 'number': '10', 'icon':Icons.local_shipping_outlined}

 ];

 List<Map> transactions =[
   {'foodPurchased':'Chicken stew', 'ref':'123243', 'amount':'1500'},
   {'foodPurchased':'Chicken sauce', 'ref':'123243', 'amount':'3000'},
   {'foodPurchased':'Efo Riro', 'ref':'123243', 'amount':'200'},
   {'foodPurchased':'Pepper soup', 'ref':'123243', 'amount':'1000'},
   {'foodPurchased':'Fish stew', 'ref':'123243', 'amount':'1200'},
 ];

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            //height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.20,
                    margin: EdgeInsets.fromLTRB(15, 10, 20, 0),
                    width: MediaQuery.of(context).size.width,
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              Text(
                                profileAccount['name'],
                                style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height * 0.035,
                                    color: Color.fromRGBO(80,62,157,1),
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Icon(
                                Icons.stars_sharp,
                                size: MediaQuery.of(context).size.height * 0.055,
                                color: Colors.amber[200],
                              )
                            ]
                          ),
                          SizedBox(height: 10,),
                          Row(
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  size: 15,
                                  color: Colors.amber,
                                ),
                                SizedBox(width: 10,),
                                Text(
                                    profileAccount['address'],
                                  style: TextStyle(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold
                                  ),
                                )
                              ]

                          ),
                        ]

                      ),

                    ),

                  Expanded(
                    flex: 1,
                    child: Container(
                      //margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(30, 100, 30, 0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           Container(
                             height:70,
                             decoration: BoxDecoration(
                               color: Colors.white30,
                               borderRadius: BorderRadius.circular(7)
                             ),
                             child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 //crossAxisAlignment: CrossAxisAlignment.stretch,
                                 children: gridOption.map((option){
                                   return Container(
                                     margin: EdgeInsets.fromLTRB(0, 15, 6, 0),
                                     child: Column(
                                       children: [
                                           Stack(
                                               children: [
                                                 Icon(
                                                     option['icon'],
                                                   color: Colors.white,
                                                 ),
                                                 Positioned(
                                                   child: FractionalTranslation(
                                                     translation: Offset(1, -0.5),
                                                     child: Text(
                                                       option['number'],
                                                       style: TextStyle(
                                                           color: Colors.amber,
                                                         fontStyle:FontStyle.italic,
                                                         fontWeight: FontWeight.bold,
                                                       ),
                                                     ),
                                                   ),
                                                 ),


                                               ]
                                           ),
                                         Container(
                                           margin:EdgeInsets.fromLTRB(0, 10, 0, 0),
                                           child: Text(
                                             option['name'],
                                             style: TextStyle(
                                                 color: Colors.amber[300],
                                               fontWeight: FontWeight.bold,


                                             ),
                                           ),
                                         )
                        ]
                                     ),
                                   );
                                 }).toList()
                        ),
                             ),

                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Transactions',
                                    style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.height * 0.030,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white60
                                    ),
                                  ),

                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white30,
                                      borderRadius: BorderRadius.circular(7)
                                    ),
                                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    height: 150,
                                    child: Padding(
                                      padding: EdgeInsets.all(1),
                                      child: ListView.builder(
                                        itemCount: transactions.length,
                                        itemBuilder: (context, index)=>ElevatedButton(
                                              onPressed: ()=>print('pressed'),
                                              style: ButtonStyle(
                                                elevation: MaterialStateProperty.resolveWith((states) => 0),
                                                backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.transparent),
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    transactions[index]['foodPurchased'],
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15,
                                                      color: Color.fromRGBO(
                                                          164, 146, 245, 1.0),
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('Reference Number'),
                                                      Text(transactions[index]['ref']),
                                                    ],
                                                  ),
                                                  Text(
                                                      'N '+ transactions[index]['amount'],
                                                    style: TextStyle(
                                                      color: Colors.amber,
                                                      fontStyle: FontStyle.italic
                                                    ),
                                                  ),
                                                ],
                                              )
                                          ),
                                      ),
                                    ),
                                  )

                                ],
                              ),
                            )
          ]
                        )
                      ),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(35, 24, 75, 1.0),
                        //color: Colors.amber,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 15.0,
                            offset: Offset(0.0,-5.0)
                          )
                        ],


                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}

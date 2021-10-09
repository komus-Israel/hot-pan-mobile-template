import 'package:flutter/material.dart';


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
   {'name':'Total Orders', 'number': '20', 'icon':Icons.shopping_cart},
   {'name':'Current Order', 'number': '10', 'icon':Icons.shopping_cart}

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
                    margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                    width: MediaQuery.of(context).size.width,
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text(profileAccount['name']),
                          Text(profileAccount['address']),
                        ]

                      ),
                      
                    ),

                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(30, 100, 30, 0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           Container(
                             height:70,
                             decoration: BoxDecoration(
                               color: Colors.white10,
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
                                                   color: Colors.black54,
                                                 ),
                                                 Positioned(
                                                   child: FractionalTranslation(
                                                     translation: Offset(1, -0.5),
                                                     child: Text(
                                                       option['number'],
                                                       style: TextStyle(
                                                           color: Colors.amber[300]
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
                                                 color: Colors.white
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
                              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Column(
                                children: [
                                  Text('Transactions'),

                                ],
                              ),
                            )
          ]
                        )
                      ),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(80,62,157,1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),

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

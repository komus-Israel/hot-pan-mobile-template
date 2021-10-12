import 'package:flutter/material.dart';


class TransactionLog extends StatefulWidget {
  @override
  _TransactionLogState createState() => _TransactionLogState();
}

class _TransactionLogState extends State<TransactionLog> {

  List<Map> transactions =[
    {'foodPurchased':'Chicken stew', 'ref':'123243', 'amount':'1500'},
    {'foodPurchased':'Chicken sauce', 'ref':'123243', 'amount':'3000'},
    {'foodPurchased':'Efo Riro', 'ref':'123243', 'amount':'200'},
    {'foodPurchased':'Pepper soup', 'ref':'123243', 'amount':'1000'},
    {'foodPurchased':'Fish stew', 'ref':'123243', 'amount':'1200'},
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        /*child: ListView.builder(
            itemBuilder: itemBuilder
        )*/
      child:Text('Transaction')
    );
  }
}

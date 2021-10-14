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
    {'foodPurchased':'Chicken stew', 'ref':'123243', 'amount':'1500'},
    {'foodPurchased':'Chicken sauce', 'ref':'123243', 'amount':'3000'},
    {'foodPurchased':'Efo Riro', 'ref':'123243', 'amount':'200'},
    {'foodPurchased':'Pepper soup', 'ref':'123243', 'amount':'1000'},
    {'foodPurchased':'Fish stew', 'ref':'123243', 'amount':'1200'},
    {'foodPurchased':'Chicken stew', 'ref':'123243', 'amount':'1500'},
    {'foodPurchased':'Chicken sauce', 'ref':'123243', 'amount':'3000'},
    {'foodPurchased':'Efo Riro', 'ref':'123243', 'amount':'200'},
    {'foodPurchased':'Pepper soup', 'ref':'123243', 'amount':'1000'},
    {'foodPurchased':'Fish stew', 'ref':'123243', 'amount':'1200'},
    {'foodPurchased':'Chicken stew', 'ref':'123243', 'amount':'1500'},
    {'foodPurchased':'Chicken sauce', 'ref':'123243', 'amount':'3000'},
    {'foodPurchased':'Efo Riro', 'ref':'123243', 'amount':'200'},
    {'foodPurchased':'Pepper soup', 'ref':'123243', 'amount':'1000'},
    {'foodPurchased':'Fish stew', 'ref':'123243', 'amount':'1200'},
    {'foodPurchased':'Chicken stew', 'ref':'123243', 'amount':'1500'},
    {'foodPurchased':'Chicken sauce', 'ref':'123243', 'amount':'3000'},
    {'foodPurchased':'Efo Riro', 'ref':'123243', 'amount':'200'},
    {'foodPurchased':'Pepper soup', 'ref':'123243', 'amount':'1000'},
    {'foodPurchased':'Fish stew', 'ref':'123243', 'amount':'1200'},
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
      child:Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(transactions[index]['foodPurchased'].length > 5 ? transactions[index]['foodPurchased'].substring(0,6) + ' ...' : transactions[index]['foodPurchased']),
                    
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Reference'),
                        Text(transactions[index]['ref']),
                      ],
                      ),
                      Text(transactions[index]['amount']),
                  ],
                  );
              }
                  ),
              )
        ),
    );
  }
}

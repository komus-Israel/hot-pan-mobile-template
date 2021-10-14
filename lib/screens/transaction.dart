import 'package:flutter/material.dart';
import '../components/customClasses.dart';
import 'transaction_receipt.dart';


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
          color: Color.fromRGBO(35, 24, 75, 1.0),
            height: MediaQuery.of(context).size.height,
            child: Container(
              color: Colors.white10,
              child: Container(
                margin: EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index){
                    return Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 0.5),
                          top: BorderSide.none,
                          left: BorderSide.none,
                          right: BorderSide.none
                          )
                      ),
                      child: ElevatedButton(
                      onPressed: ()=>showDialog(
                            context:context,
                            builder:(context)=>TransactionReceipt()), 
                      child: transactionLog(context, transactions[index]),
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.resolveWith((states) => 0),
                        backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.transparent),
                
                      ),
                      ),
                    );
                  }
                      ),
              ),
            ),
              )
        ),
    );
  }
}

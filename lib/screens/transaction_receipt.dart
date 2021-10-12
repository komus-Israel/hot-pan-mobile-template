import 'package:flutter/material.dart';


class TransactionReceipt extends StatefulWidget {
  @override
  _TransactionReceiptState createState() => _TransactionReceiptState();
}

class _TransactionReceiptState extends State<TransactionReceipt> {
  @override
  Widget build(BuildContext context) {
    double screen_height = MediaQuery.of(context).size.height;
    double receipt_height = screen_height/2;

    return Container(
      height: screen_height,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
              child: Container(
                height: receipt_height,
                width:  MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )
                ),
                child: Column(
                  children: [
                  /*Container(
                        height: receipt_height/2.5,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50)
                            ),


                        ),
                        child: Text('yes')
                    ),*/

                  ],
                ),

                    )
                ),

        ],
      ),
    );
  }
}

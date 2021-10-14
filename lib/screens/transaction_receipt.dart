import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shape_of_view/shape/arc.dart';
import 'package:shape_of_view/shape_of_view.dart';
import '../components/customClasses.dart';
import 'dart:ui' as ui;


class TransactionReceipt extends StatefulWidget {
  @override
  _TransactionReceiptState createState() => _TransactionReceiptState();
}

class _TransactionReceiptState extends State<TransactionReceipt> {

  Map receipt = {
    'buyer':'komolehin Israel Timilehin',
    'ref': '12324325435',
    'date': '20-08-2020',
    'food_ordered': 'Chicken Stew',
    'amount': 'N1500'
  };

  GlobalKey _globalKey = new GlobalKey();

  Future _capturePng() async {
    RenderRepaintBoundary boundary = _globalKey.currentContext.findRenderObject();
    await Future.delayed(const Duration(milliseconds: 20));
    ui.Image image= await boundary.toImage(pixelRatio: 3.0);
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    var pngBytes = byteData.buffer.asUint8List();
    /*var bs64 = base64Encode(pngBytes);
    print(pngBytes);
    return pngBytes;*/

    String dir = (await getApplicationDocumentsDirectory()).path;
    print(dir);
  }
  @override
 Widget build(BuildContext context) {
    double screen_height = MediaQuery.of(context).size.height;
    double receipt_height = screen_height/2;

    return RepaintBoundary(
      key: _globalKey,
      child: Container(
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: ShapeOfView(
                              height: receipt_height/2.5,
                              width: MediaQuery.of(context).size.width,
                            elevation: 0,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: ArcShape(
                              direction: ArcDirection.Inside,
                              position: ArcPosition.Bottom
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(35, 24, 75, 0.9),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  topLeft: Radius.circular(15),
                                )
                              ),
                              width:MediaQuery.of(context).size.width,
                              height: receipt_height/2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    image: AssetImage(
                                        'assets/images/hot_logo_cropped.png',
                                    ),
                                    height: receipt_height/10,
                                  ),
                                  SizedBox(height: 20,),
                                  Text(
                                      receipt['amount'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white

                                    ),
                                  ),
                                  Text(
                                      'PayStack Payment GateWay',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                    ),
                                  )
                                ],
                              ),
                            )
                          ),
                        ),

                      Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        //height: receipt_height/2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ReceiptStatementContainer(statement:receipt['buyer'], statementHeader: 'Buyer'),
                            ReceiptStatementContainer(statement:receipt['ref'], statementHeader: 'Reference'),
                            ReceiptStatementContainer(statement:receipt['date'], statementHeader: 'Date'),
                            ReceiptStatementContainer(statement:'order of ${receipt['food_ordered']}', statementHeader: 'Narration')
                          ],
                        ),
                      ),

                      ElevatedButton(
                            onPressed:_capturePng,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color.fromRGBO(35, 24, 75, 1.0)),
                          ),
                          child: Container(
                            width: 100,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.download_rounded
                                ),
                                Text('Download')
                              ],
                            ),
                          ),
                        ),



                    ],
                  ),

                      )
                  ),

          ],
        ),
      ),
    );
  }
}

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
//import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import '../routes/routes.dart';
import 'dart:async';


class TabRouteObject{

  String tabName;
  Widget tabPage;
  Widget tabIcon;

  TabRouteObject({this.tabName, this.tabPage, this.tabIcon});
}

Widget price(Widget widget, packageName, price){
  return Container(
    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        widget,
        Text(
            packageName,
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
        ),
        Text(
            price,
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
        )

      ],
    ),
  );
}

class BuildForm extends StatefulWidget {

  Size size;
  String hint = 'Category';
  String inputType;
  Widget prefixIcon;
  bool obscure = false;
  bool suffixIcon = false;
  Function onSaved;



  BuildForm({Key key, this.size, this.hint,  this.inputType,  this.prefixIcon,  this.suffixIcon:false,  this.obscure:false, this.onSaved}) : super(key: key);
  @override
  _BuildFormState createState() => _BuildFormState();
}

class _BuildFormState extends State<BuildForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        //height: size.height * 0.08,
        width: widget.size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[500].withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
        ),

        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.hint,
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: widget.suffixIcon ? IconButton(
                    icon: Icon(Icons.remove_red_eye_outlined),
                    onPressed: ()=>widget.obscure ? setState(()=> widget.obscure = false) : setState(()=> widget.obscure = true),
                    enableFeedback: false,
                  ) : null

                //hintStyle: kBodyText,
              ),

              style: TextStyle(
                  color: Colors.white
              ),
              cursorColor: Colors.amber,
              obscureText: widget.obscure,
              onSaved: widget.onSaved),


            ),
          ),
        ),
      );
  }
}

Widget buildActionButton(action){
  return Container(
    height: 60,
    width: 60,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white
    ),
    child:TextButton(
        onPressed: action,
        child: Icon(
          Icons.arrow_forward_ios_sharp,
          color: Colors.amber,
        ),
      style: ButtonStyle(
        enableFeedback: false,
        overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent)
      ),
       )
  );
}

Widget BackgroundImage(image){
  return ShaderMask(
          shaderCallback: (rect)=>LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.centerRight,
                colors: [Colors.black, Colors.transparent]
            ).createShader(rect),
        blendMode: BlendMode.darken,
        child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                image,
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)
      )
      ),
    ),
  );
}

class FoodCard extends StatefulWidget {

  Map food;
  @override
  FoodCard({Key key, @required this.food}) : super(key:key);
  _FoodCardState createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: Column(
        children:  <Widget>[
      Stack(

      children: <Widget>[
        Container(
        height: 200,
        width: 500,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Image(
            fit: BoxFit.cover,
            image: AssetImage(widget.food['image']),
          ),
        ),
      ),

      Positioned(
        bottom: 0,
        child: Container(
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)

            ),
            color: Color.fromRGBO(248, 248, 248, 1),
          ),

          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'N' + widget.food['price'],
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,

            ),
          ),
        ),
      ),
      ],
    ),
    Container(
          margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: <Widget>[
                        Row(

                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                          Text(
                            widget.food['name'],
                         style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                       ),
                      ),

                     TextButton(
                   onPressed: ()=>namedPageRoute(
                              context,
                              '/order',
                              {'name': 'chicken stew', 'image': 'assets/images/img1.jpg', 'price': '4 ,000', 'averageRating': '3.5', 'address':'ilorin'}
                          ),
                           child: Text('Order'),
                          style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                           backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(35, 24, 75, 1.0)),
                      ),
                  )
                  ]
       ),
                  Container(
                         margin: EdgeInsets.fromLTRB(0, 10, 0, 0),

                          child: Row(

                            children: [
                                         Icon(
                                                 Icons.star_rate_rounded,
                                                   size: 17,
                                                    color: Color.fromRGBO(237, 161, 69, 1),
                                         ),
                          Text(
                      widget.food['averageRating']
                    ),

                   ],
              ),
    )
                    ]
      )
                    )
    ]
      )
                    );
  }
}

class ReceiptStatementContainer extends StatelessWidget {

  final statement;
  final statementHeader;
  ReceiptStatementContainer({Key key, this.statement, this.statementHeader}): super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 3, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              statementHeader+':',
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width/2,
            child: Text(
              statement,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                color: Colors.black54
              ),
            ),
          )
        ],
      ),
    );
  }
}

/*Future<void> createPDF() async{
  PdfDocument document = PdfDocument();
  document.pages.add();

  List<int> bytes = document.save();
  document.dispose();

  saveAndLaunchFile(bytes, 'Output.pdf');
}

Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async{
  final path = (await getExternalStorageDirectory()).path;
  final file = File('$path/$fileName');
  await file.writeAsBytes(bytes, flush: true);
  OpenFile.open('$path/$fileName');
}*/

Widget transactionLog(BuildContext context, Map log){
  return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              log['foodPurchased'].length > 5 ? log['foodPurchased'].substring(0,6) + ' ...' : log['foodPurchased'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Reference Number',
                  style: TextStyle(
                    color: Colors.grey
                  ),
                ),
                Text(
                    log['ref'],
                  style: TextStyle(
                    color: Colors.grey
                  ),
                ),
              ],
            ),
            Text(
                'N '+ log['amount'],
              style: TextStyle(
                color: Colors.amber[200],
                fontStyle: FontStyle.italic
              ),
            ),
          ],
        );
}
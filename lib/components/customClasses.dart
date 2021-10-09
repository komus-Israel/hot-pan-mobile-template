import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../routes/routes.dart';

class TabRouteObject{

  String tabName;
  Widget tabPage;
  Widget tabIcon;

  TabRouteObject({this.tabName, this.tabPage, this.tabIcon});
}

Widget Price(Widget widget, packageName, price){
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

class buildForm extends StatefulWidget {

  Size size;
  String hint = 'Category';
  String inputType;
  Widget prefixIcon;
  bool obscure = false;
  bool suffixIcon = false;
  Function onSaved;



  buildForm({Key key, this.size, this.hint,  this.inputType,  this.prefixIcon,  this.suffixIcon:false,  this.obscure:false, this.onSaved}) : super(key: key);
  @override
  _buildFormState createState() => _buildFormState();
}

class _buildFormState extends State<buildForm> {
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
                           backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
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

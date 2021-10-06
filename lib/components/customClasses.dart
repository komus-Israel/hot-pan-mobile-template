import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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


/*Widget buildLoginForm({size, String hint : 'Category', String inputType, prefixIcon, obscure:false, bool suffixIcon:false, action}){
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10.0),
    child: Container(
      //height: size.height * 0.08,
      width: size.width * 0.8,
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
                hintText: hint,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon ? IconButton(
                    icon: Icon(Icons.remove_red_eye_outlined),
                  onPressed: action,
                ) : null
                //hintStyle: kBodyText,
              ),

            style: TextStyle(
              color: Colors.white
            ),
            cursorColor: Colors.amber,
            obscureText: obscure,


          ),
        ),
      ),
    ),
  );
}*/

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
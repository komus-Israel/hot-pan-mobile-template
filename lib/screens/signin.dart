import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:hot_pan/routes/routes.dart';
import '../components/customClasses.dart';
import 'signup.dart';


class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin{

  AnimationController _controller;
  Animation animation;

  String username = 'test';
  String password = 'test';

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this,
      duration: Duration(milliseconds: 200),
      animationBehavior: AnimationBehavior.preserve,
    );

    _controller.forward();
  }

  _onLogin() async{
    _formkey.currentState.save();

    SnackBar credentialStatus = SnackBar(
      content: Text('incorrect login details'),
      backgroundColor: Colors.amber,
      action: SnackBarAction(
        label: 'ok',
        textColor: Colors.deepPurple,
        onPressed: (){},
      ),
      duration: Duration(
          seconds: 15
      ),
      animation: Tween(
          begin: 2.0,
          end: 1.0
      ).animate(_controller),
    );

    (username != 'test' || password != 'test') ? ScaffoldMessenger.of(context).showSnackBar(credentialStatus) : namedPageRoute(context, '/tabView', {'signedIn':true});
    print(username);
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
        children: [
          BackgroundImage('assets/images/bg3.jpg'),
          Scaffold(
            backgroundColor: Colors.transparent,
            //resizeToAvoidBottomInset: false,

            body: Builder(builder: (context) {
                return SafeArea(
                child: ListView(
                    children: [
                      Container(
                        height: size.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Hot Pan',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 50,
                                            fontWeight: FontWeight.bold
                                        ),

                                      ),

                                      Text(
                                        'Hope you enjoy your stay',
                                        style: TextStyle(
                                            color: Colors.amber,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                            ),


                            ClipRect(

                              child: Container(
                                width: 50,
                                child: Column(
                                  children: <Widget>[
                                    Divider(
                                      color: Colors.white,
                                      thickness: 5,
                                    ),
                                    Text(
                                      'Log In',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),

                            ClipRect(
                              child: Container(
                                //color: Colors.red,
                                child: Form(
                                  key: _formkey,
                                  child: Column(
                                    children: [

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .end,
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceEvenly,
                                        children: [
                                          buildForm(size: size,
                                            hint: 'Email',
                                            prefixIcon: Icon(Icons.mail_outline,
                                              color: Colors.white
                                            ),
                                            onSaved: (value)=>username=value,
                                          ),
                                          buildForm(size: size,
                                              hint: 'Password',
                                              prefixIcon: Icon(
                                                Icons.lock, color: Colors.white,),
                                              obscure: true,
                                              suffixIcon: true,
                                            onSaved: (value)=>password=value,
                                          ),
                                          Text('Forgot Password?',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),

                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      buildActionButton(
                                          _onLogin
                                      )
                                      // ),


                                    ],
                                  ),
                                ),
                              ),
                            ),
                            //),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'No account?',
                                    style: TextStyle(
                                        color: Colors.white
                                    ),
                                  ),
                                  Container(
                                    //margin: EdgeInsets.fromLTRB(0, 50, 0, 10),
                                    child: TextButton(
                                        child: Text(
                                          'Sign Up',
                                          style: TextStyle(
                                              color: Colors.amber
                                          ),
                                        ),
                                        style: ButtonStyle(
                                            enableFeedback: false,
                                            overlayColor: MaterialStateColor
                                                .resolveWith((states) =>
                                            Colors.transparent)
                                        ),

                                        onPressed: () => pageRoute(
                                            context, SignUp(), false)),

                                  ),
                                ]
                            ),
                            //),

                          ],
                        ),
                      ),
                    ]
                ),
             );
           }
            ),
            ),
          //)
        ],


      //),
    );
  }
}

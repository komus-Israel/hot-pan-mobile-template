import 'package:flutter/material.dart';
import '../components/customClasses.dart';
import 'package:hot_pan/routes/routes.dart';
import 'signin.dart';

class SignUp extends StatefulWidget {


  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool _obscure = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage('assets/images/bg3.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: ListView(
              children: [
                Container(
                  height:size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                    children: [
                      BuildForm(size: size, hint: 'First Name', prefixIcon:Icon(Icons.person_outlined, color: Colors.white,)),
                      BuildForm(size: size, hint: 'Last Name', prefixIcon:Icon(Icons.person_outlined, color: Colors.white,)),
                      BuildForm(size: size, hint: 'Email', prefixIcon:Icon(Icons.mail_outline, color: Colors.white,)),
                      BuildForm(size: size, hint: 'Phone', prefixIcon:Icon(Icons.phone, color: Colors.white,)),
                      BuildForm(size: size, hint: 'Password', prefixIcon:Icon(Icons.lock_outline, color: Colors.white,), suffixIcon:true, obscure: true,),
                      BuildForm(size: size, hint: 'Confirm Password', prefixIcon:Icon(Icons.lock, color: Colors.white,), suffixIcon:true, obscure: true),
                    ],
                  ),

                    SizedBox(
                      height: 30,
                    ),

                    buildActionButton(
                      //()=> openTabViewComponent(context)
                            ()=>print('sign up')
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                          Container(
                            //margin: EdgeInsets.fromLTRB(0, 50, 0, 10),
                            child: TextButton(
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                      color: Colors.amber
                                  ),
                                ),
                                style: ButtonStyle(
                                    enableFeedback: false,
                                    overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent)
                                ),

                                onPressed: ()=>pageRoute(context, SignIn(), false)),

                          ),
                        ]
                    ),
    ]
                ),
              ),
    ]
            ),
          ),
        )

      ],
    );
  }
}

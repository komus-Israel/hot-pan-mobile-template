import 'package:flutter/material.dart';



class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Form(
          child: TextFormField(
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                
              ),
            ),
          )
        ),
        elevation: 0.0,
      ),
      body: Center(
        child: Text(
          'search'
        ),
      ),
    );
  }
}

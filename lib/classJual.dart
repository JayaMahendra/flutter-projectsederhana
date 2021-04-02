import 'package:flutter/material.dart';

class classJual extends StatefulWidget {
  @override
  _classJualState createState() => _classJualState();
}

class _classJualState extends State<classJual> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Data Penjualan'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
              // Icons.backspace_sharp , onPressed: (){},
            )));
  }
}

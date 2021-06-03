import 'package:flutter/material.dart';
import 'package:project_sedeerhana/home.dart';

class Depan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
          Image.network(
              'https://image.freepik.com/free-vector/logo-lightning-circle_15870-263.jpg',
              width: 600),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Text("Next"))
        ]));
  }
}

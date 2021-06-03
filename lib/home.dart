import 'package:flutter/material.dart';
import 'package:project_sedeerhana/classItem.dart';
import 'depan.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Toko Listrik',
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Image.network(
                'https://png.pngtree.com/png-vector/20190329/ourlarge/pngtree-vector-electric-shock-icon-png-image_887050.jpg',
                width: 200,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 40.0),
              child: Text('UD. Listrik Terbang'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                    child: Text('Data Barang'),
                    color: Colors.yellowAccent[400],
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => classItem()));
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}

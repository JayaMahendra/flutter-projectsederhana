import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

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
          'KasirKU',
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(20),
                height: 200,
                width: 500,
                alignment: Alignment.center,
                color: Colors.blueGrey[700],
                child: Text(
                  'Bisa Jualan Gak?',
                  style: TextStyle(color: Colors.white),
                )),
            RaisedButton(child: Text('Data Barang'), onPressed: () {}),
            RaisedButton(child: Text('Data Penjualan'), onPressed: () {})
          ],
        ),
      ),
    );
  }
}

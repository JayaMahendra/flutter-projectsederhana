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
          'LISTRIK KUNING',
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(children: [
              Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text('Aplikasi Sederhana \n Data-Data Listrik',
                      style: TextStyle(fontSize: 22),
                      textAlign: TextAlign.start))
            ]),
            Padding(
                padding: EdgeInsets.only(top: 13, bottom: 15.0),
                child: Text('Kategori', style: TextStyle(fontSize: 17))),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Column(
                children: [
                  Text('Kabel'),
                  Image.network(
                      'https://image.freepik.com/free-photo/carrying-noise-category-white-plastic_1232-4123.jpg',
                      width: 60)
                ],
              ),
              Column(
                children: [
                  Text('Lampu'),
                  Image.network(
                      'https://image.freepik.com/free-psd/creative-light-bulb-icon_53876-12236.jpg',
                      width: 30)
                ],
              ),
              Column(
                children: [
                  Text('Baterai'),
                  Image.network(
                      'https://image.flaticon.com/icons/png/512/543/543250.png',
                      width: 55)
                ],
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Galeri', style: TextStyle(fontSize: 17)),
                  Image.network(
                      'https://image.freepik.com/free-photo/engineer-working-checking-maintenance-equipment-wiring-plc-cabinet_29285-1084.jpg',
                      width: 200),
                  ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: RaisedButton(
                        child: Text('Data Barang'),
                        color: Colors.yellowAccent[400],
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => classItem()));
                        }))
              ],
            )
          ],
        ),
      ),
    );
  }
}

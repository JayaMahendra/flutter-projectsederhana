//kode utama Aplikasi tampilan awal
import 'package:flutter/material.dart';
// import 'home.dart';
import 'depan.dart';

//package letak folder Anda
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tambahkan Item',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Depan(),
    );
  }
}

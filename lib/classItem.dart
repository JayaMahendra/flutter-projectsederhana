import 'package:flutter/material.dart';
import 'package:project_sedeerhana/inputItem.dart';

class classItem extends StatefulWidget {
  @override
  _classItemState createState() => _classItemState();
}

class _classItemState extends State<classItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Data Barang'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: Container(
            alignment: Alignment.center,
            child: SizedBox(
                child: RaisedButton(
                    child: Text("Tambah Item"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => inputItem()));
                    }))));

    // onPressed: () async {
    //   var item = await navigateToinputItem(context, null);
    //   if (item != null) {
    //     // 2 Panggil Fungsi untuk Insert ke DB
    //     int result = await dbHelper.insert(item);
    //     if (result > 0) {
    //       updateListView();
    //     }}},),),));
  }
}

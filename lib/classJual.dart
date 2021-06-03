import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart'; //utk database
import 'dbHelper.dart'; //class database
import 'inputJual.dart';
import 'jual.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class classJual extends StatefulWidget {
  @override
  _classJualState createState() => _classJualState();
}

class _classJualState extends State<classJual> {
  DbHelper dbHelper = DbHelper();
  List<Jual> jualList;
  var count = 0;

  @override

  //digunakan untuk update
  void initState() {
    super.initState();
    updateListViewj();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Data Penjualan'),
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                })),
        body: Column(children: [
          Expanded(
            child: createListj(), //membuat list dengan memanggil fungsi tsb
          ),
          Container(
              alignment: Alignment.center,
              child: SizedBox(
                  child: RaisedButton(
                      child: Text("Tambah Item"),
                      color: Colors.yellowAccent[400],
                      onPressed: () async {
                        var jual = await navigateToinputJual(context, null);
                        if (jual != null) {
                          // 2 Panggil Fungsi untuk Insert ke DB
                          int result = await dbHelper.insertjual(jual);
                          if (result > 0) {
                            updateListViewj(); //update list
                          }
                        }
                      })))
        ]));
  }

  Future<Jual> navigateToinputJual(BuildContext context, Jual jual) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return InputJual(jual);
    }));
    return result;
  }

  ListView createListj() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                  backgroundColor: Colors.yellow,
                  child: Image.network(
                      'https://w7.pngwing.com/pngs/445/818/png-transparent-computer-icons-encapsulated-postscript-lightning-icon-angle-triangle-electrical-wires-cable.png')),
              title: Text(jualList[index].tgl.toString()),

              // subtitle: Text(jualList[index].desc),
              subtitle: Text(jualList[index].desc),
              // jualList[index].desc != null ? jualList[index].desc : ' '),
              // title: Text(itemList[index].nama),
              // subtitle: Text(itemList[index].harga.toString() +
              //     '\t\t\t\t stock : ' +
              //     itemList[index].qty.toString()),
              trailing: GestureDetector(
                  child: Icon(Icons.delete),
                  onTap: () async {
                    //3 Panggil Fungsi untuk Delete dari DB berdasarkan Item
                    var result = await dbHelper.deletejual(jualList[index].idj);
                    if (result > 0) {
                      updateListViewj(); //update
                    }
                  }),
              onTap: () async {
                var jual =
                    await navigateToinputJual(context, this.jualList[index]);
                //4 Panggil Fungsi untuk Edit data
                var result = await dbHelper.updatejual(jual);
                if (result > 0) {
                  updateListViewj(); //update
                }
              },
            ));
      },
    );
  }

  //update List jual
  void updateListViewj() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      //TODO 1 Select data dari DB
      Future<List<Jual>> jualListFuture = dbHelper.getJualList();
      jualListFuture.then((jualList) {
        setState(() {
          this.jualList = jualList;
          this.count = jualList.length;
        });
      });
    });
  }
}

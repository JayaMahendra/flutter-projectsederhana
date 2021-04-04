import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dbHelper.dart';
import 'inputJual.dart';
import 'jual.dart';
import 'dart:async';    

class classJual extends StatefulWidget {
  @override
  _classJualState createState() => _classJualState();
}

class _classJualState extends State<classJual> {
  DbHelper dbHelper = DbHelper();
  List<Jual> jualList;
  var count = 0;

  @override
  void initState(){
    super.initState();
    updateListView();
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
            child: createList(),
          ),
          Container(
              alignment: Alignment.center,
              child: SizedBox(
                  child: RaisedButton(
                      child: Text("Tambah Item"),
                      onPressed: () async {
                        var jual = await navigateToinputJual(context, null);
                        if (jual != null) {
                          // 2 Panggil Fungsi untuk Insert ke DB
                          int result = await dbHelper.insertjual(jual);
                          if (result > 0) {
                            updateListView();
                          }
                        }
                      })))
        ]));
  }

  Future<Jual> navigateToinputJual(BuildContext context, Jual jual) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return inputJual(jual);
    }));
    return result;
  }

  ListView createList() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(Icons.ad_units),
              ),
              title: Text(jualList[index].tgl.toString()),
              subtitle: Text(jualList[index].desc),
              trailing: GestureDetector(
                  child: Icon(Icons.delete),
                  onTap: () async {
                    //3 Panggil Fungsi untuk Delete dari DB berdasarkan Item
                    var result = await dbHelper.deletejual(jualList[index].id);
                    if (result > 0) {
                      updateListView();
                    }
                  }),
              onTap: () async {
                var jual =
                    await navigateToinputJual(context, this.jualList[index]);
                //4 Panggil Fungsi untuk Edit data
                var result = await dbHelper.updatejual(jual);
                if (result > 0) {
                  updateListView();
                }
              },
            ));
      },
    );
  }

  //update List item
  void updateListView() {
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

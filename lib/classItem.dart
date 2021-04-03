import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project_sedeerhana/dbHelper.dart';
import 'package:project_sedeerhana/inputItem.dart';
import 'item.dart';
import 'package:sqflite/sqflite.dart';

class classItem extends StatefulWidget {
  @override
  _classItemState createState() => _classItemState();
}

class _classItemState extends State<classItem> {
  DbHelper dbHelper = DbHelper();
  List<Item> itemList;
  var count = 0;

  @override
  Widget build(BuildContext context) {
    if (itemList == null) {
      itemList = List<Item>();
    }
    return Scaffold(
        appBar: AppBar(
            title: Text('Data Barang'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
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
                        var item = await navigateToinputItem(context, null);
                        if (item != null) {
                          // 2 Panggil Fungsi untuk Insert ke DB
                          int result = await dbHelper.insert(item);
                          if (result > 0) {
                            updateListView();
                          }
                        }
                      })))
        ]));
  }

  Future<Item> navigateToinputItem(BuildContext context, Item item) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return inputItem(item);
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
              title: Text(itemList[index].nama),
              subtitle: Text(itemList[index].harga.toString() +
                  itemList[index].qty.toString()),
              trailing: GestureDetector(
                  child: Icon(Icons.delete),
                  onTap: () async {
                    //3 Panggil Fungsi untuk Delete dari DB berdasarkan Item
                    var result = await dbHelper.delete(itemList[index].id);
                    if (result > 0) {
                      updateListView();
                    }
                  }),
              onTap: () async {
                var item =
                    await navigateToinputItem(context, this.itemList[index]);
                //4 Panggil Fungsi untuk Edit data
                var result = await dbHelper.update(item);
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
      Future<List<Item>> itemListFuture = dbHelper.getItemList();
      itemListFuture.then((itemList) {
        setState(() {
          this.itemList = itemList;
          this.count = itemList.length;
        });
      });
    });
  }
}

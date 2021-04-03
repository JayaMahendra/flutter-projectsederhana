import 'package:flutter/material.dart';
import 'jual.dart';

class inputJual extends StatefulWidget {
  inputJual(Jual jual);
  @override
  _inputJualState createState() => _inputJualState();
}

class _inputJualState extends State<inputJual> {
  Jual _jual;
  DateTime _tgl = DateTime.now();
  TextEditingController tglController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Input Data Penjualan'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Padding(
          padding: EdgeInsets.all(20.0),
          child: ListView(children: <Widget>[
            Text("${selectedDate.toLocal()}".split(' ')[0]),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              onPressed: () => {
                _selectDate(context),
                print(selectedDate.day + selectedDate.month + selectedDate.year)
              },
              child: Text('Pilih Tanggal'),
            ),

            // Padding(
            //   padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            //   child: TextField(
            //     controller: tglController,
            //     keyboardType: TextInputType.datetime,
            //     decoration: InputDecoration(
            //       labelText: 'Tanggal',
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(5.0),
            //       ),
            //     ),
            //     onChanged: (value) {},
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: descController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {
                  //
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Row(
                children: <Widget>[
                  // tombol simpan
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Save',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        if (_jual == null) {
                          // tambah data
                          _jual = Jual(DateTime.parse(tglController.toString()),
                              descController.text);
                        } else {
                          // ubah data
                         _jual = Jual(DateTime.parse(tglController.toString()),
                              descController.text);
                        }
                        // kembali ke layar sebelumnya dengan membawa objek item
                        Navigator.pop(context, _jual);
                      },
                    ),
                  ),
                  Container(
                    width: 5.0,
                  ),
                  // tombol batal
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Cancel',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ])),
    );
  }

  DateTime selectedDate = DateTime.now();
// Initial SelectDate FLutter
  Future<Null> _selectDate(BuildContext context) async {
    // Initial DateTime FIinal Picked
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}

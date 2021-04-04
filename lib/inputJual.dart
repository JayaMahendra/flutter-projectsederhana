import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; //untuk format date picker
import 'jual.dart'; 

class inputJual extends StatefulWidget {
  inputJual(Jual jual);
  @override
  _inputJualState createState() => _inputJualState();
}

class _inputJualState extends State<inputJual> {
  Jual _jual;  //inisialisasi model
  TextEditingController tglController = TextEditingController(); //untuk tgl
  TextEditingController descController = TextEditingController(); //utk description

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Input Data Penjualan'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios), //tombol kembali 
              onPressed: () {
                Navigator.pop(context); //untuk kembali ke halaman sebelumnya
              },
            )),
        body: Padding(
            padding: EdgeInsets.all(20.0),
            child: ListView(children: <Widget>[
              Padding( //menginputkan time picker
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  focusNode: AlwaysDisabledFocusNode(),
                  decoration: InputDecoration(
                      labelText: 'Tanggal',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  controller: tglController,
                  onTap: () {
                    selectDate(context);  //memanggil fungsi selectdat yang ada dibawah
                  },
                  onChanged: (value) {},
                ),
              ),
              Padding(  //menginputkan desscription text field
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
                    // tombol untuk simpan
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
                              // menambah data
                              _jual = Jual(
                                  DateTime.tryParse(tglController.toString()),
                                  descController.text);
                            } else {
                              // mengubah data
                              _jual = Jual(
                                  // DateTime.parse(selectedDate.toString()),
                                  // _jual = Jual(DateTime.parse(tglController.toString()),
                                  DateTime.tryParse(tglController.toString()),
                                  descController.text);
                            }
                            // kembali ke layar sebelumnya dengan membawa objek jual
                            Navigator.pop(context, _jual);
                          }),
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
                          Navigator.pop(context); //kembali ke halaman sebelumnya
                        },
                      ),
                    ),
                  ],
                ),
              )
            ])));
  }

  DateTime selectedDate;
  // Initial SelectDate FLutter
  // Future<Null> _selectDate(BuildContext context) async {
  //   // Initial DateTime FIinal Picked
  //   final DateTime picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(2015, 8),
  //       lastDate: DateTime(2101));
  //   if (picked != null && picked != selectedDate)
  //     setState(() {
  //       selectedDate = picked;
  //     });
  // }

  selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate != null ? selectedDate : DateTime.now(),
        firstDate: DateTime(2000), //tanggal diawali pada tahun 2000
        lastDate: DateTime(2040),  //tanggal diakhir tahun 2040
        builder: (BuildContext context, Widget child) {
          return Theme(  //warna
            data: ThemeData.dark().copyWith( 
              colorScheme: ColorScheme.dark(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
                surface: Colors.blueGrey,
                onSurface: Colors.yellow,
              ),
              dialogBackgroundColor: Colors.blue[500],
            ),
            child: child,
          );
        });

    if (newSelectedDate != null) {  
      selectedDate = newSelectedDate;
      tglController
        ..text = DateFormat.yMMMMd().format(selectedDate)  //format tanggal
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: tglController.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

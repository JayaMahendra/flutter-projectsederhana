class Item {
  int _id;
  String _nama;
  int _harga;
  int _qty;

  int get id => _id;

  String get nama => this._nama;
  set nama(String value) => this._nama = value;

  get harga => this._harga;
  set harga(value) => this._harga = value;

  get qty => this._qty;
  set qty(value) => this._qty = value;

// konstruktor versi 1
  Item(this._nama, this._harga, this._qty);

  // konstruktor versi 2: konversi dari Map ke Item
  Item.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._nama = map['nama'];
    this._harga = map['harga'];
    this._qty = map['qty'];
  }
  // konversi dari Item ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['nama'] = nama;
    map['harga'] = harga;
    map['qty'] = qty;
    return map;
  }
}

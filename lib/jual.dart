class Jual {
  int _idj;
  DateTime _tgl;
  String _desc;

  int get idj => _idj;

  String get desc => this._desc;
  set desc(String value) => this._desc = value;

  DateTime get tgl => this._tgl;
  set tgl(DateTime value) => this._tgl = value;

// konstruktor versi 1
  Jual(this._tgl, this._desc);

  // konstruktor versi 2: konversi dari Map ke Item
  Jual.fromMap(Map<String, dynamic> map) {
    this._idj = map['idj'];
    this._tgl = map['tgl'];
    this._desc = map['desc'];
  }
  // konversi dari Item ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['idj'] = this._idj;
    map['tgl'] = tgl;
    map['desc'] = desc;
    return map;
  }
}

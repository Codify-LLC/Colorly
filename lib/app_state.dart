import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _shoppingCartActive =
        prefs.getBool('ff_shoppingCartActive') ?? _shoppingCartActive;
    _itemNumber = prefs.getInt('ff_itemNumber') ?? _itemNumber;
    _deliveryYes = prefs.getBool('ff_deliveryYes') ?? _deliveryYes;
    _monthlyFizzz = prefs.getInt('ff_monthlyFizzz') ?? _monthlyFizzz;
    _addNumberRef = prefs.getString('ff_addNumberRef')?.ref ?? _addNumberRef;
    _followed = prefs.getBool('ff_followed') ?? _followed;
    _indianapolisCenter =
        _latLngFromString(prefs.getString('ff_indianapolisCenter')) ??
            _indianapolisCenter;
    _outOfRangeInteger =
        prefs.getInt('ff_outOfRangeInteger') ?? _outOfRangeInteger;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _shoppingCartActive = false;
  bool get shoppingCartActive => _shoppingCartActive;
  set shoppingCartActive(bool _value) {
    _shoppingCartActive = _value;
    prefs.setBool('ff_shoppingCartActive', _value);
  }

  int _itemNumber = 0;
  int get itemNumber => _itemNumber;
  set itemNumber(int _value) {
    _itemNumber = _value;
    prefs.setInt('ff_itemNumber', _value);
  }

  bool _deliveryYes = false;
  bool get deliveryYes => _deliveryYes;
  set deliveryYes(bool _value) {
    _deliveryYes = _value;
    prefs.setBool('ff_deliveryYes', _value);
  }

  int _monthlyFizzz = 0;
  int get monthlyFizzz => _monthlyFizzz;
  set monthlyFizzz(int _value) {
    _monthlyFizzz = _value;
    prefs.setInt('ff_monthlyFizzz', _value);
  }

  DocumentReference? _addNumberRef =
      FirebaseFirestore.instance.doc('/addNumber/number');
  DocumentReference? get addNumberRef => _addNumberRef;
  set addNumberRef(DocumentReference? _value) {
    _addNumberRef = _value;
    _value != null
        ? prefs.setString('ff_addNumberRef', _value.path)
        : prefs.remove('ff_addNumberRef');
  }

  DateTime? _pickUpTime = DateTime.fromMillisecondsSinceEpoch(1649131200000);
  DateTime? get pickUpTime => _pickUpTime;
  set pickUpTime(DateTime? _value) {
    _pickUpTime = _value;
  }

  bool _followed = false;
  bool get followed => _followed;
  set followed(bool _value) {
    _followed = _value;
    prefs.setBool('ff_followed', _value);
  }

  String _SelectedMenu = '';
  String get SelectedMenu => _SelectedMenu;
  set SelectedMenu(String _value) {
    _SelectedMenu = _value;
  }

  List<String> _homeMenu = [];
  List<String> get homeMenu => _homeMenu;
  set homeMenu(List<String> _value) {
    _homeMenu = _value;
  }

  void addToHomeMenu(String _value) {
    _homeMenu.add(_value);
  }

  void removeFromHomeMenu(String _value) {
    _homeMenu.remove(_value);
  }

  void removeAtIndexFromHomeMenu(int _index) {
    _homeMenu.removeAt(_index);
  }

  LatLng? _indianapolisCenter = LatLng(39.768403, -86.158068);
  LatLng? get indianapolisCenter => _indianapolisCenter;
  set indianapolisCenter(LatLng? _value) {
    _indianapolisCenter = _value;
    _value != null
        ? prefs.setString('ff_indianapolisCenter', _value.serialize())
        : prefs.remove('ff_indianapolisCenter');
  }

  int _outOfRangeInteger = 1;
  int get outOfRangeInteger => _outOfRangeInteger;
  set outOfRangeInteger(int _value) {
    _outOfRangeInteger = _value;
    prefs.setInt('ff_outOfRangeInteger', _value);
  }

  List<double> _excellent = [5, 4.9, 4.8, 4.7, 4.6, 4.5];
  List<double> get excellent => _excellent;
  set excellent(List<double> _value) {
    _excellent = _value;
  }

  void addToExcellent(double _value) {
    _excellent.add(_value);
  }

  void removeFromExcellent(double _value) {
    _excellent.remove(_value);
  }

  void removeAtIndexFromExcellent(int _index) {
    _excellent.removeAt(_index);
  }

  List<double> _good = [4.4, 4.3, 4.2, 4.1, 4];
  List<double> get good => _good;
  set good(List<double> _value) {
    _good = _value;
  }

  void addToGood(double _value) {
    _good.add(_value);
  }

  void removeFromGood(double _value) {
    _good.remove(_value);
  }

  void removeAtIndexFromGood(int _index) {
    _good.removeAt(_index);
  }

  List<double> _average = [3.9, 3.8, 3.7, 3.6, 3.5, 3.4, 3.3, 3.2, 3.1, 3];
  List<double> get average => _average;
  set average(List<double> _value) {
    _average = _value;
  }

  void addToAverage(double _value) {
    _average.add(_value);
  }

  void removeFromAverage(double _value) {
    _average.remove(_value);
  }

  void removeAtIndexFromAverage(int _index) {
    _average.removeAt(_index);
  }

  List<double> _bad = [2.9, 2.8, 2.7, 2.6, 2.5, 2.4, 2.3, 2.2, 2.1, 2];
  List<double> get bad => _bad;
  set bad(List<double> _value) {
    _bad = _value;
  }

  void addToBad(double _value) {
    _bad.add(_value);
  }

  void removeFromBad(double _value) {
    _bad.remove(_value);
  }

  void removeAtIndexFromBad(int _index) {
    _bad.removeAt(_index);
  }

  List<double> _horrible = [1.9, 1.8, 1.7, 1.6, 1.5, 1.4, 1.3, 1.2, 1.1, 1];
  List<double> get horrible => _horrible;
  set horrible(List<double> _value) {
    _horrible = _value;
  }

  void addToHorrible(double _value) {
    _horrible.add(_value);
  }

  void removeFromHorrible(double _value) {
    _horrible.remove(_value);
  }

  void removeAtIndexFromHorrible(int _index) {
    _horrible.removeAt(_index);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

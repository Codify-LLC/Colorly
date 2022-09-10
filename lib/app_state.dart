import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
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
    if (_value == null) {
      return;
    }
    _addNumberRef = _value;
    prefs.setString('ff_addNumberRef', _value.path);
  }

  DateTime? pickUpTime = DateTime.fromMillisecondsSinceEpoch(1649131200000);

  bool _followed = false;
  bool get followed => _followed;
  set followed(bool _value) {
    _followed = _value;
    prefs.setBool('ff_followed', _value);
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

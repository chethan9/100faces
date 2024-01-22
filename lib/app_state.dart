import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _adminStatus = prefs.getString('ff_adminStatus') ?? _adminStatus;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _imagefromuser = '';
  String get imagefromuser => _imagefromuser;
  set imagefromuser(String value) {
    _imagefromuser = value;
  }

  dynamic _allResult;
  dynamic get allResult => _allResult;
  set allResult(dynamic value) {
    _allResult = value;
  }

  int _userWhatsAppIndex = 0;
  int get userWhatsAppIndex => _userWhatsAppIndex;
  set userWhatsAppIndex(int value) {
    _userWhatsAppIndex = value;
  }

  UserPredictionListStruct _particularUserPridict = UserPredictionListStruct();
  UserPredictionListStruct get particularUserPridict => _particularUserPridict;
  set particularUserPridict(UserPredictionListStruct value) {
    _particularUserPridict = value;
  }

  void updateParticularUserPridictStruct(
      Function(UserPredictionListStruct) updateFn) {
    updateFn(_particularUserPridict);
  }

  String _adminStatus = '';
  String get adminStatus => _adminStatus;
  set adminStatus(String value) {
    _adminStatus = value;
    prefs.setString('ff_adminStatus', value);
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

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

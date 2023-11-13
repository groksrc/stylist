import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

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
      _contactsPermisionRequested =
          prefs.getBool('ff_contactsPermisionRequested') ??
              _contactsPermisionRequested;
    });
    _safeInit(() {
      _contactsPermissionGranted =
          prefs.getBool('ff_contactsPermissionGranted') ??
              _contactsPermissionGranted;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _contactsPermisionRequested = false;
  bool get contactsPermisionRequested => _contactsPermisionRequested;
  set contactsPermisionRequested(bool _value) {
    _contactsPermisionRequested = _value;
    prefs.setBool('ff_contactsPermisionRequested', _value);
  }

  bool _contactsPermissionGranted = false;
  bool get contactsPermissionGranted => _contactsPermissionGranted;
  set contactsPermissionGranted(bool _value) {
    _contactsPermissionGranted = _value;
    prefs.setBool('ff_contactsPermissionGranted', _value);
  }

  DateTime? _dayViewSelectedDay;
  DateTime? get dayViewSelectedDay => _dayViewSelectedDay;
  set dayViewSelectedDay(DateTime? _value) {
    _dayViewSelectedDay = _value;
  }

  DateTime? _dayViewTappedDate;
  DateTime? get dayViewTappedDate => _dayViewTappedDate;
  set dayViewTappedDate(DateTime? _value) {
    _dayViewTappedDate = _value;
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

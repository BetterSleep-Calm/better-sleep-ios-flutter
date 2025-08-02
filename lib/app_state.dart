import 'package:flutter/material.dart';
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
      _sleepTimeList =
          prefs.getStringList('ff_sleepTimeList')?.map(int.parse).toList() ??
              _sleepTimeList;
    });
    _safeInit(() {
      _sleepDateList =
          prefs.getStringList('ff_sleepDateList') ?? _sleepDateList;
    });
    _safeInit(() {
      _audioIndex = prefs.getInt('ff_audioIndex') ?? _audioIndex;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<int> _sleepTimeList = [];
  List<int> get sleepTimeList => _sleepTimeList;
  set sleepTimeList(List<int> value) {
    _sleepTimeList = value;
    prefs.setStringList(
        'ff_sleepTimeList', value.map((x) => x.toString()).toList());
  }

  void addToSleepTimeList(int value) {
    sleepTimeList.add(value);
    prefs.setStringList(
        'ff_sleepTimeList', _sleepTimeList.map((x) => x.toString()).toList());
  }

  void removeFromSleepTimeList(int value) {
    sleepTimeList.remove(value);
    prefs.setStringList(
        'ff_sleepTimeList', _sleepTimeList.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromSleepTimeList(int index) {
    sleepTimeList.removeAt(index);
    prefs.setStringList(
        'ff_sleepTimeList', _sleepTimeList.map((x) => x.toString()).toList());
  }

  void updateSleepTimeListAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    sleepTimeList[index] = updateFn(_sleepTimeList[index]);
    prefs.setStringList(
        'ff_sleepTimeList', _sleepTimeList.map((x) => x.toString()).toList());
  }

  void insertAtIndexInSleepTimeList(int index, int value) {
    sleepTimeList.insert(index, value);
    prefs.setStringList(
        'ff_sleepTimeList', _sleepTimeList.map((x) => x.toString()).toList());
  }

  List<String> _sleepDateList = [];
  List<String> get sleepDateList => _sleepDateList;
  set sleepDateList(List<String> value) {
    _sleepDateList = value;
    prefs.setStringList('ff_sleepDateList', value);
  }

  void addToSleepDateList(String value) {
    sleepDateList.add(value);
    prefs.setStringList('ff_sleepDateList', _sleepDateList);
  }

  void removeFromSleepDateList(String value) {
    sleepDateList.remove(value);
    prefs.setStringList('ff_sleepDateList', _sleepDateList);
  }

  void removeAtIndexFromSleepDateList(int index) {
    sleepDateList.removeAt(index);
    prefs.setStringList('ff_sleepDateList', _sleepDateList);
  }

  void updateSleepDateListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    sleepDateList[index] = updateFn(_sleepDateList[index]);
    prefs.setStringList('ff_sleepDateList', _sleepDateList);
  }

  void insertAtIndexInSleepDateList(int index, String value) {
    sleepDateList.insert(index, value);
    prefs.setStringList('ff_sleepDateList', _sleepDateList);
  }

  int _audioIndex = 0;
  int get audioIndex => _audioIndex;
  set audioIndex(int value) {
    _audioIndex = value;
    prefs.setInt('ff_audioIndex', value);
  }

  bool _hasLifetimeAccess = false;
  bool get hasLifetimeAccess => _hasLifetimeAccess;
  set hasLifetimeAccess(bool value) {
    _hasLifetimeAccess = value;
  }
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

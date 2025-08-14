import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
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
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _sleepTimeList = (await secureStorage.getStringList('ff_sleepTimeList'))
              ?.map(int.parse)
              .toList() ??
          _sleepTimeList;
    });
    await _safeInitAsync(() async {
      _sleepDateList = await secureStorage.getStringList('ff_sleepDateList') ??
          _sleepDateList;
    });
    await _safeInitAsync(() async {
      _audioIndex = await secureStorage.getInt('ff_audioIndex') ?? _audioIndex;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<int> _sleepTimeList = [];
  List<int> get sleepTimeList => _sleepTimeList;
  set sleepTimeList(List<int> value) {
    _sleepTimeList = value;
    secureStorage.setStringList(
        'ff_sleepTimeList', value.map((x) => x.toString()).toList());
  }

  void deleteSleepTimeList() {
    secureStorage.delete(key: 'ff_sleepTimeList');
  }

  void addToSleepTimeList(int value) {
    sleepTimeList.add(value);
    secureStorage.setStringList(
        'ff_sleepTimeList', _sleepTimeList.map((x) => x.toString()).toList());
  }

  void removeFromSleepTimeList(int value) {
    sleepTimeList.remove(value);
    secureStorage.setStringList(
        'ff_sleepTimeList', _sleepTimeList.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromSleepTimeList(int index) {
    sleepTimeList.removeAt(index);
    secureStorage.setStringList(
        'ff_sleepTimeList', _sleepTimeList.map((x) => x.toString()).toList());
  }

  void updateSleepTimeListAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    sleepTimeList[index] = updateFn(_sleepTimeList[index]);
    secureStorage.setStringList(
        'ff_sleepTimeList', _sleepTimeList.map((x) => x.toString()).toList());
  }

  void insertAtIndexInSleepTimeList(int index, int value) {
    sleepTimeList.insert(index, value);
    secureStorage.setStringList(
        'ff_sleepTimeList', _sleepTimeList.map((x) => x.toString()).toList());
  }

  List<String> _sleepDateList = [];
  List<String> get sleepDateList => _sleepDateList;
  set sleepDateList(List<String> value) {
    _sleepDateList = value;
    secureStorage.setStringList('ff_sleepDateList', value);
  }

  void deleteSleepDateList() {
    secureStorage.delete(key: 'ff_sleepDateList');
  }

  void addToSleepDateList(String value) {
    sleepDateList.add(value);
    secureStorage.setStringList('ff_sleepDateList', _sleepDateList);
  }

  void removeFromSleepDateList(String value) {
    sleepDateList.remove(value);
    secureStorage.setStringList('ff_sleepDateList', _sleepDateList);
  }

  void removeAtIndexFromSleepDateList(int index) {
    sleepDateList.removeAt(index);
    secureStorage.setStringList('ff_sleepDateList', _sleepDateList);
  }

  void updateSleepDateListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    sleepDateList[index] = updateFn(_sleepDateList[index]);
    secureStorage.setStringList('ff_sleepDateList', _sleepDateList);
  }

  void insertAtIndexInSleepDateList(int index, String value) {
    sleepDateList.insert(index, value);
    secureStorage.setStringList('ff_sleepDateList', _sleepDateList);
  }

  int _audioIndex = 0;
  int get audioIndex => _audioIndex;
  set audioIndex(int value) {
    _audioIndex = value;
    secureStorage.setInt('ff_audioIndex', value);
  }

  void deleteAudioIndex() {
    secureStorage.delete(key: 'ff_audioIndex');
  }

  bool _hasLifetimeAccess2 = false;
  bool get hasLifetimeAccess2 => _hasLifetimeAccess2;
  set hasLifetimeAccess2(bool value) {
    _hasLifetimeAccess2 = value;
  }

  String _localUserID = '';
  String get localUserID => _localUserID;
  set localUserID(String value) {
    _localUserID = value;
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}

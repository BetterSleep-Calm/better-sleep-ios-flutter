import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SleepLogsRecord extends FirestoreRecord {
  SleepLogsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "minutes" field.
  int? _minutes;
  int get minutes => _minutes ?? 0;
  bool hasMinutes() => _minutes != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _age = castToType<int>(snapshotData['age']);
    _minutes = castToType<int>(snapshotData['minutes']);
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: '(default)')
      .collection('sleepLogs');

  static Stream<SleepLogsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SleepLogsRecord.fromSnapshot(s));

  static Future<SleepLogsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SleepLogsRecord.fromSnapshot(s));

  static SleepLogsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SleepLogsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SleepLogsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SleepLogsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SleepLogsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SleepLogsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSleepLogsRecordData({
  int? age,
  int? minutes,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'age': age,
      'minutes': minutes,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class SleepLogsRecordDocumentEquality implements Equality<SleepLogsRecord> {
  const SleepLogsRecordDocumentEquality();

  @override
  bool equals(SleepLogsRecord? e1, SleepLogsRecord? e2) {
    return e1?.age == e2?.age &&
        e1?.minutes == e2?.minutes &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(SleepLogsRecord? e) =>
      const ListEquality().hash([e?.age, e?.minutes, e?.timestamp]);

  @override
  bool isValidKey(Object? o) => o is SleepLogsRecord;
}

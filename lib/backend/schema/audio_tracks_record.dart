import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AudioTracksRecord extends FirestoreRecord {
  AudioTracksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  bool hasIndex() => _index != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  void _initializeFields() {
    _index = castToType<int>(snapshotData['index']);
    _url = snapshotData['url'] as String?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: '(default)')
      .collection('audioTracks');

  static Stream<AudioTracksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AudioTracksRecord.fromSnapshot(s));

  static Future<AudioTracksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AudioTracksRecord.fromSnapshot(s));

  static AudioTracksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AudioTracksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AudioTracksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AudioTracksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AudioTracksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AudioTracksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAudioTracksRecordData({
  int? index,
  String? url,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'index': index,
      'url': url,
    }.withoutNulls,
  );

  return firestoreData;
}

class AudioTracksRecordDocumentEquality implements Equality<AudioTracksRecord> {
  const AudioTracksRecordDocumentEquality();

  @override
  bool equals(AudioTracksRecord? e1, AudioTracksRecord? e2) {
    return e1?.index == e2?.index && e1?.url == e2?.url;
  }

  @override
  int hash(AudioTracksRecord? e) =>
      const ListEquality().hash([e?.index, e?.url]);

  @override
  bool isValidKey(Object? o) => o is AudioTracksRecord;
}

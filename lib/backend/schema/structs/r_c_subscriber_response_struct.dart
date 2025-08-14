// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class RCSubscriberResponseStruct extends FFFirebaseStruct {
  RCSubscriberResponseStruct({
    /// From subscriber.entitlements.lifetime_access.purchase_date
    String? purchaseDate,

    /// From subscriber.entitlements.lifetime_access.product_identifier
    String? productID,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _purchaseDate = purchaseDate,
        _productID = productID,
        super(firestoreUtilData);

  // "purchaseDate" field.
  String? _purchaseDate;
  String get purchaseDate => _purchaseDate ?? '';
  set purchaseDate(String? val) => _purchaseDate = val;

  bool hasPurchaseDate() => _purchaseDate != null;

  // "productID" field.
  String? _productID;
  String get productID => _productID ?? '';
  set productID(String? val) => _productID = val;

  bool hasProductID() => _productID != null;

  static RCSubscriberResponseStruct fromMap(Map<String, dynamic> data) =>
      RCSubscriberResponseStruct(
        purchaseDate: data['purchaseDate'] as String?,
        productID: data['productID'] as String?,
      );

  static RCSubscriberResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? RCSubscriberResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'purchaseDate': _purchaseDate,
        'productID': _productID,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'purchaseDate': serializeParam(
          _purchaseDate,
          ParamType.String,
        ),
        'productID': serializeParam(
          _productID,
          ParamType.String,
        ),
      }.withoutNulls;

  static RCSubscriberResponseStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RCSubscriberResponseStruct(
        purchaseDate: deserializeParam(
          data['purchaseDate'],
          ParamType.String,
          false,
        ),
        productID: deserializeParam(
          data['productID'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RCSubscriberResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RCSubscriberResponseStruct &&
        purchaseDate == other.purchaseDate &&
        productID == other.productID;
  }

  @override
  int get hashCode => const ListEquality().hash([purchaseDate, productID]);
}

RCSubscriberResponseStruct createRCSubscriberResponseStruct({
  String? purchaseDate,
  String? productID,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RCSubscriberResponseStruct(
      purchaseDate: purchaseDate,
      productID: productID,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RCSubscriberResponseStruct? updateRCSubscriberResponseStruct(
  RCSubscriberResponseStruct? rCSubscriberResponse, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    rCSubscriberResponse
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRCSubscriberResponseStructData(
  Map<String, dynamic> firestoreData,
  RCSubscriberResponseStruct? rCSubscriberResponse,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (rCSubscriberResponse == null) {
    return;
  }
  if (rCSubscriberResponse.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && rCSubscriberResponse.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final rCSubscriberResponseData =
      getRCSubscriberResponseFirestoreData(rCSubscriberResponse, forFieldValue);
  final nestedData =
      rCSubscriberResponseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      rCSubscriberResponse.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRCSubscriberResponseFirestoreData(
  RCSubscriberResponseStruct? rCSubscriberResponse, [
  bool forFieldValue = false,
]) {
  if (rCSubscriberResponse == null) {
    return {};
  }
  final firestoreData = mapToFirestore(rCSubscriberResponse.toMap());

  // Add any Firestore field values
  rCSubscriberResponse.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRCSubscriberResponseListFirestoreData(
  List<RCSubscriberResponseStruct>? rCSubscriberResponses,
) =>
    rCSubscriberResponses
        ?.map((e) => getRCSubscriberResponseFirestoreData(e, true))
        .toList() ??
    [];

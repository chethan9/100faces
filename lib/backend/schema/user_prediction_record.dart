import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class UserPredictionRecord extends FirestoreRecord {
  UserPredictionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user_reference" field.
  DocumentReference? _userReference;
  DocumentReference? get userReference => _userReference;
  bool hasUserReference() => _userReference != null;

  // "user_prediction_list" field.
  List<UserPredictionListStruct>? _userPredictionList;
  List<UserPredictionListStruct> get userPredictionList =>
      _userPredictionList ?? const [];
  bool hasUserPredictionList() => _userPredictionList != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _userReference = snapshotData['user_reference'] as DocumentReference?;
    _userPredictionList = getStructList(
      snapshotData['user_prediction_list'],
      UserPredictionListStruct.fromMap,
    );
    _name = snapshotData['name'] as String?;
    _phone = snapshotData['phone'] as String?;
    _email = snapshotData['email'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_prediction');

  static Stream<UserPredictionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserPredictionRecord.fromSnapshot(s));

  static Future<UserPredictionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserPredictionRecord.fromSnapshot(s));

  static UserPredictionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserPredictionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserPredictionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserPredictionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserPredictionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserPredictionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserPredictionRecordData({
  DocumentReference? userReference,
  String? name,
  String? phone,
  String? email,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_reference': userReference,
      'name': name,
      'phone': phone,
      'email': email,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserPredictionRecordDocumentEquality
    implements Equality<UserPredictionRecord> {
  const UserPredictionRecordDocumentEquality();

  @override
  bool equals(UserPredictionRecord? e1, UserPredictionRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userReference == e2?.userReference &&
        listEquality.equals(e1?.userPredictionList, e2?.userPredictionList) &&
        e1?.name == e2?.name &&
        e1?.phone == e2?.phone &&
        e1?.email == e2?.email &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(UserPredictionRecord? e) => const ListEquality().hash([
        e?.userReference,
        e?.userPredictionList,
        e?.name,
        e?.phone,
        e?.email,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is UserPredictionRecord;
}

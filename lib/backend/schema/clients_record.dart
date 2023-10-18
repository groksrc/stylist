import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClientsRecord extends FirestoreRecord {
  ClientsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

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

  // "archived" field.
  bool? _archived;
  bool get archived => _archived ?? false;
  bool hasArchived() => _archived != null;

  // "birth_month" field.
  int? _birthMonth;
  int get birthMonth => _birthMonth ?? 0;
  bool hasBirthMonth() => _birthMonth != null;

  // "birth_year" field.
  int? _birthYear;
  int get birthYear => _birthYear ?? 0;
  bool hasBirthYear() => _birthYear != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "modified_at" field.
  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _modifiedAt;
  bool hasModifiedAt() => _modifiedAt != null;

  // "contact_identifier" field.
  String? _contactIdentifier;
  String get contactIdentifier => _contactIdentifier ?? '';
  bool hasContactIdentifier() => _contactIdentifier != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _name = snapshotData['name'] as String?;
    _phone = snapshotData['phone'] as String?;
    _email = snapshotData['email'] as String?;
    _archived = snapshotData['archived'] as bool?;
    _birthMonth = castToType<int>(snapshotData['birth_month']);
    _birthYear = castToType<int>(snapshotData['birth_year']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _modifiedAt = snapshotData['modified_at'] as DateTime?;
    _contactIdentifier = snapshotData['contact_identifier'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('clients');

  static Stream<ClientsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClientsRecord.fromSnapshot(s));

  static Future<ClientsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClientsRecord.fromSnapshot(s));

  static ClientsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClientsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClientsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClientsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClientsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClientsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClientsRecordData({
  String? uid,
  String? name,
  String? phone,
  String? email,
  bool? archived,
  int? birthMonth,
  int? birthYear,
  DateTime? createdAt,
  DateTime? modifiedAt,
  String? contactIdentifier,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'name': name,
      'phone': phone,
      'email': email,
      'archived': archived,
      'birth_month': birthMonth,
      'birth_year': birthYear,
      'created_at': createdAt,
      'modified_at': modifiedAt,
      'contact_identifier': contactIdentifier,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClientsRecordDocumentEquality implements Equality<ClientsRecord> {
  const ClientsRecordDocumentEquality();

  @override
  bool equals(ClientsRecord? e1, ClientsRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.name == e2?.name &&
        e1?.phone == e2?.phone &&
        e1?.email == e2?.email &&
        e1?.archived == e2?.archived &&
        e1?.birthMonth == e2?.birthMonth &&
        e1?.birthYear == e2?.birthYear &&
        e1?.createdAt == e2?.createdAt &&
        e1?.modifiedAt == e2?.modifiedAt &&
        e1?.contactIdentifier == e2?.contactIdentifier;
  }

  @override
  int hash(ClientsRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.name,
        e?.phone,
        e?.email,
        e?.archived,
        e?.birthMonth,
        e?.birthYear,
        e?.createdAt,
        e?.modifiedAt,
        e?.contactIdentifier
      ]);

  @override
  bool isValidKey(Object? o) => o is ClientsRecord;
}

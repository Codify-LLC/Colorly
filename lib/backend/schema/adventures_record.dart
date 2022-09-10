import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'adventures_record.g.dart';

abstract class AdventuresRecord
    implements Built<AdventuresRecord, AdventuresRecordBuilder> {
  static Serializer<AdventuresRecord> get serializer =>
      _$adventuresRecordSerializer;

  DateTime? get createdTime;

  String? get adventureName;

  DocumentReference? get slot1;

  DocumentReference? get slot2;

  DocumentReference? get slot3;

  DateTime? get expireTime;

  bool? get has1;

  bool? get has2;

  bool? get has3;

  bool? get featured;

  DocumentReference? get user;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AdventuresRecordBuilder builder) => builder
    ..adventureName = ''
    ..has1 = false
    ..has2 = false
    ..has3 = false
    ..featured = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('adventures');

  static Stream<AdventuresRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AdventuresRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AdventuresRecord._();
  factory AdventuresRecord([void Function(AdventuresRecordBuilder) updates]) =
      _$AdventuresRecord;

  static AdventuresRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAdventuresRecordData({
  DateTime? createdTime,
  String? adventureName,
  DocumentReference? slot1,
  DocumentReference? slot2,
  DocumentReference? slot3,
  DateTime? expireTime,
  bool? has1,
  bool? has2,
  bool? has3,
  bool? featured,
  DocumentReference? user,
}) {
  final firestoreData = serializers.toFirestore(
    AdventuresRecord.serializer,
    AdventuresRecord(
      (a) => a
        ..createdTime = createdTime
        ..adventureName = adventureName
        ..slot1 = slot1
        ..slot2 = slot2
        ..slot3 = slot3
        ..expireTime = expireTime
        ..has1 = has1
        ..has2 = has2
        ..has3 = has3
        ..featured = featured
        ..user = user,
    ),
  );

  return firestoreData;
}

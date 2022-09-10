import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'curated_lists_record.g.dart';

abstract class CuratedListsRecord
    implements Built<CuratedListsRecord, CuratedListsRecordBuilder> {
  static Serializer<CuratedListsRecord> get serializer =>
      _$curatedListsRecordSerializer;

  String? get title;

  String? get image;

  BuiltList<DocumentReference>? get restaurants;

  String? get range;

  BuiltList<DocumentReference>? get followers;

  String? get description;

  bool? get isFeatured;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CuratedListsRecordBuilder builder) => builder
    ..title = ''
    ..image = ''
    ..restaurants = ListBuilder()
    ..range = ''
    ..followers = ListBuilder()
    ..description = ''
    ..isFeatured = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('curatedLists');

  static Stream<CuratedListsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CuratedListsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CuratedListsRecord._();
  factory CuratedListsRecord(
          [void Function(CuratedListsRecordBuilder) updates]) =
      _$CuratedListsRecord;

  static CuratedListsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCuratedListsRecordData({
  String? title,
  String? image,
  String? range,
  String? description,
  bool? isFeatured,
}) {
  final firestoreData = serializers.toFirestore(
    CuratedListsRecord.serializer,
    CuratedListsRecord(
      (c) => c
        ..title = title
        ..image = image
        ..restaurants = null
        ..range = range
        ..followers = null
        ..description = description
        ..isFeatured = isFeatured,
    ),
  );

  return firestoreData;
}

import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'personal_lists_record.g.dart';

abstract class PersonalListsRecord
    implements Built<PersonalListsRecord, PersonalListsRecordBuilder> {
  static Serializer<PersonalListsRecord> get serializer =>
      _$personalListsRecordSerializer;

  DocumentReference? get userRef;

  BuiltList<DocumentReference>? get likes;

  String? get description;

  BuiltList<DocumentReference>? get restaurants;

  String? get title;

  DateTime? get updatedTime;

  String? get featuredImage;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(PersonalListsRecordBuilder builder) => builder
    ..likes = ListBuilder()
    ..description = ''
    ..restaurants = ListBuilder()
    ..title = ''
    ..featuredImage = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('personalLists')
          : FirebaseFirestore.instance.collectionGroup('personalLists');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('personalLists').doc();

  static Stream<PersonalListsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PersonalListsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PersonalListsRecord._();
  factory PersonalListsRecord(
          [void Function(PersonalListsRecordBuilder) updates]) =
      _$PersonalListsRecord;

  static PersonalListsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPersonalListsRecordData({
  DocumentReference? userRef,
  String? description,
  String? title,
  DateTime? updatedTime,
  String? featuredImage,
}) {
  final firestoreData = serializers.toFirestore(
    PersonalListsRecord.serializer,
    PersonalListsRecord(
      (p) => p
        ..userRef = userRef
        ..likes = null
        ..description = description
        ..restaurants = null
        ..title = title
        ..updatedTime = updatedTime
        ..featuredImage = featuredImage,
    ),
  );

  return firestoreData;
}

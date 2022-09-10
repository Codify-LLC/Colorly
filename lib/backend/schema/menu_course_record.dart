import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'menu_course_record.g.dart';

abstract class MenuCourseRecord
    implements Built<MenuCourseRecord, MenuCourseRecordBuilder> {
  static Serializer<MenuCourseRecord> get serializer =>
      _$menuCourseRecordSerializer;

  DocumentReference? get restRef;

  BuiltList<DocumentReference>? get menuItems;

  DateTime? get createdAt;

  String? get courseName;

  BuiltList<String>? get courseNames;

  String? get courseDescription;

  String? get courseImage;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MenuCourseRecordBuilder builder) => builder
    ..menuItems = ListBuilder()
    ..courseName = ''
    ..courseNames = ListBuilder()
    ..courseDescription = ''
    ..courseImage = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('menuCourse');

  static Stream<MenuCourseRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MenuCourseRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MenuCourseRecord._();
  factory MenuCourseRecord([void Function(MenuCourseRecordBuilder) updates]) =
      _$MenuCourseRecord;

  static MenuCourseRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMenuCourseRecordData({
  DocumentReference? restRef,
  DateTime? createdAt,
  String? courseName,
  String? courseDescription,
  String? courseImage,
}) {
  final firestoreData = serializers.toFirestore(
    MenuCourseRecord.serializer,
    MenuCourseRecord(
      (m) => m
        ..restRef = restRef
        ..menuItems = null
        ..createdAt = createdAt
        ..courseName = courseName
        ..courseNames = null
        ..courseDescription = courseDescription
        ..courseImage = courseImage,
    ),
  );

  return firestoreData;
}

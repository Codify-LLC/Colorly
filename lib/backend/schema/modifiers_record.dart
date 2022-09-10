import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'modifiers_record.g.dart';

abstract class ModifiersRecord
    implements Built<ModifiersRecord, ModifiersRecordBuilder> {
  static Serializer<ModifiersRecord> get serializer =>
      _$modifiersRecordSerializer;

  String? get modName;

  DocumentReference? get modItem;

  BuiltList<DocumentReference>? get modOptions;

  BuiltList<DocumentReference>? get modItems;

  BuiltList<String>? get modNames;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ModifiersRecordBuilder builder) => builder
    ..modName = ''
    ..modOptions = ListBuilder()
    ..modItems = ListBuilder()
    ..modNames = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('modifiers');

  static Stream<ModifiersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ModifiersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ModifiersRecord._();
  factory ModifiersRecord([void Function(ModifiersRecordBuilder) updates]) =
      _$ModifiersRecord;

  static ModifiersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createModifiersRecordData({
  String? modName,
  DocumentReference? modItem,
}) {
  final firestoreData = serializers.toFirestore(
    ModifiersRecord.serializer,
    ModifiersRecord(
      (m) => m
        ..modName = modName
        ..modItem = modItem
        ..modOptions = null
        ..modItems = null
        ..modNames = null,
    ),
  );

  return firestoreData;
}

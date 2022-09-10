import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'options_record.g.dart';

abstract class OptionsRecord
    implements Built<OptionsRecord, OptionsRecordBuilder> {
  static Serializer<OptionsRecord> get serializer => _$optionsRecordSerializer;

  String? get optionName;

  double? get optionPrice;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(OptionsRecordBuilder builder) => builder
    ..optionName = ''
    ..optionPrice = 0.0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('options')
          : FirebaseFirestore.instance.collectionGroup('options');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('options').doc();

  static Stream<OptionsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<OptionsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  OptionsRecord._();
  factory OptionsRecord([void Function(OptionsRecordBuilder) updates]) =
      _$OptionsRecord;

  static OptionsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createOptionsRecordData({
  String? optionName,
  double? optionPrice,
}) {
  final firestoreData = serializers.toFirestore(
    OptionsRecord.serializer,
    OptionsRecord(
      (o) => o
        ..optionName = optionName
        ..optionPrice = optionPrice,
    ),
  );

  return firestoreData;
}

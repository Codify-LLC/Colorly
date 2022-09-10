import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'add_number_record.g.dart';

abstract class AddNumberRecord
    implements Built<AddNumberRecord, AddNumberRecordBuilder> {
  static Serializer<AddNumberRecord> get serializer =>
      _$addNumberRecordSerializer;

  int? get count;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AddNumberRecordBuilder builder) =>
      builder..count = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('addNumber');

  static Stream<AddNumberRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AddNumberRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AddNumberRecord._();
  factory AddNumberRecord([void Function(AddNumberRecordBuilder) updates]) =
      _$AddNumberRecord;

  static AddNumberRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAddNumberRecordData({
  int? count,
}) {
  final firestoreData = serializers.toFirestore(
    AddNumberRecord.serializer,
    AddNumberRecord(
      (a) => a..count = count,
    ),
  );

  return firestoreData;
}

import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'options_for_i_c_i_record.g.dart';

abstract class OptionsForICIRecord
    implements Built<OptionsForICIRecord, OptionsForICIRecordBuilder> {
  static Serializer<OptionsForICIRecord> get serializer =>
      _$optionsForICIRecordSerializer;

  BuiltList<String>? get optionsNames;

  DocumentReference? get inCartItem;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(OptionsForICIRecordBuilder builder) =>
      builder..optionsNames = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('optionsForICI');

  static Stream<OptionsForICIRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<OptionsForICIRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  OptionsForICIRecord._();
  factory OptionsForICIRecord(
          [void Function(OptionsForICIRecordBuilder) updates]) =
      _$OptionsForICIRecord;

  static OptionsForICIRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createOptionsForICIRecordData({
  DocumentReference? inCartItem,
}) {
  final firestoreData = serializers.toFirestore(
    OptionsForICIRecord.serializer,
    OptionsForICIRecord(
      (o) => o
        ..optionsNames = null
        ..inCartItem = inCartItem,
    ),
  );

  return firestoreData;
}

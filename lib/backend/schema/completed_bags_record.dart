import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'completed_bags_record.g.dart';

abstract class CompletedBagsRecord
    implements Built<CompletedBagsRecord, CompletedBagsRecordBuilder> {
  static Serializer<CompletedBagsRecord> get serializer =>
      _$completedBagsRecordSerializer;

  BuiltList<DocumentReference>? get orderItems;

  String? get bagNumber;

  bool? get complete;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CompletedBagsRecordBuilder builder) => builder
    ..orderItems = ListBuilder()
    ..bagNumber = ''
    ..complete = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('completedBags');

  static Stream<CompletedBagsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CompletedBagsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CompletedBagsRecord._();
  factory CompletedBagsRecord(
          [void Function(CompletedBagsRecordBuilder) updates]) =
      _$CompletedBagsRecord;

  static CompletedBagsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCompletedBagsRecordData({
  String? bagNumber,
  bool? complete,
}) {
  final firestoreData = serializers.toFirestore(
    CompletedBagsRecord.serializer,
    CompletedBagsRecord(
      (c) => c
        ..orderItems = null
        ..bagNumber = bagNumber
        ..complete = complete,
    ),
  );

  return firestoreData;
}

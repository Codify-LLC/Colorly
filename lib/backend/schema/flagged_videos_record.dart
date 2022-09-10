import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'flagged_videos_record.g.dart';

abstract class FlaggedVideosRecord
    implements Built<FlaggedVideosRecord, FlaggedVideosRecordBuilder> {
  static Serializer<FlaggedVideosRecord> get serializer =>
      _$flaggedVideosRecordSerializer;

  DocumentReference? get userRef;

  BuiltList<DocumentReference>? get postRef;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FlaggedVideosRecordBuilder builder) =>
      builder..postRef = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('flaggedVideos');

  static Stream<FlaggedVideosRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FlaggedVideosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FlaggedVideosRecord._();
  factory FlaggedVideosRecord(
          [void Function(FlaggedVideosRecordBuilder) updates]) =
      _$FlaggedVideosRecord;

  static FlaggedVideosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFlaggedVideosRecordData({
  DocumentReference? userRef,
}) {
  final firestoreData = serializers.toFirestore(
    FlaggedVideosRecord.serializer,
    FlaggedVideosRecord(
      (f) => f
        ..userRef = userRef
        ..postRef = null,
    ),
  );

  return firestoreData;
}

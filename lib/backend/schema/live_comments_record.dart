import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'live_comments_record.g.dart';

abstract class LiveCommentsRecord
    implements Built<LiveCommentsRecord, LiveCommentsRecordBuilder> {
  static Serializer<LiveCommentsRecord> get serializer =>
      _$liveCommentsRecordSerializer;

  DateTime? get timestamp;

  String? get comment;

  DocumentReference? get stream;

  DocumentReference? get user;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(LiveCommentsRecordBuilder builder) =>
      builder..comment = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('liveComments');

  static Stream<LiveCommentsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<LiveCommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  LiveCommentsRecord._();
  factory LiveCommentsRecord(
          [void Function(LiveCommentsRecordBuilder) updates]) =
      _$LiveCommentsRecord;

  static LiveCommentsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createLiveCommentsRecordData({
  DateTime? timestamp,
  String? comment,
  DocumentReference? stream,
  DocumentReference? user,
}) {
  final firestoreData = serializers.toFirestore(
    LiveCommentsRecord.serializer,
    LiveCommentsRecord(
      (l) => l
        ..timestamp = timestamp
        ..comment = comment
        ..stream = stream
        ..user = user,
    ),
  );

  return firestoreData;
}

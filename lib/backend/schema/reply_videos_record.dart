import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'reply_videos_record.g.dart';

abstract class ReplyVideosRecord
    implements Built<ReplyVideosRecord, ReplyVideosRecordBuilder> {
  static Serializer<ReplyVideosRecord> get serializer =>
      _$replyVideosRecordSerializer;

  DocumentReference? get user;

  DocumentReference? get post;

  String? get video;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ReplyVideosRecordBuilder builder) =>
      builder..video = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('replyVideos');

  static Stream<ReplyVideosRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ReplyVideosRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ReplyVideosRecord._();
  factory ReplyVideosRecord([void Function(ReplyVideosRecordBuilder) updates]) =
      _$ReplyVideosRecord;

  static ReplyVideosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createReplyVideosRecordData({
  DocumentReference? user,
  DocumentReference? post,
  String? video,
}) {
  final firestoreData = serializers.toFirestore(
    ReplyVideosRecord.serializer,
    ReplyVideosRecord(
      (r) => r
        ..user = user
        ..post = post
        ..video = video,
    ),
  );

  return firestoreData;
}

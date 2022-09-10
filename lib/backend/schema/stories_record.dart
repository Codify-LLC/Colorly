import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'stories_record.g.dart';

abstract class StoriesRecord
    implements Built<StoriesRecord, StoriesRecordBuilder> {
  static Serializer<StoriesRecord> get serializer => _$storiesRecordSerializer;

  @BuiltValueField(wireName: 'video_url')
  String? get videoUrl;

  @BuiltValueField(wireName: 'rest_ref')
  DocumentReference? get restRef;

  String? get comment;

  String? get storyName;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  int? get numComments;

  bool? get isOwner;

  String? get campaignName;

  @BuiltValueField(wireName: 'user_ref')
  DocumentReference? get userRef;

  String? get linkLearnMore;

  bool? get isFlagged;

  String? get city;

  bool? get hasDeal;

  DocumentReference? get dealRef;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(StoriesRecordBuilder builder) => builder
    ..videoUrl = ''
    ..comment = ''
    ..storyName = ''
    ..numComments = 0
    ..isOwner = false
    ..campaignName = ''
    ..linkLearnMore = ''
    ..isFlagged = false
    ..city = ''
    ..hasDeal = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stories');

  static Stream<StoriesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<StoriesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  StoriesRecord._();
  factory StoriesRecord([void Function(StoriesRecordBuilder) updates]) =
      _$StoriesRecord;

  static StoriesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createStoriesRecordData({
  String? videoUrl,
  DocumentReference? restRef,
  String? comment,
  String? storyName,
  DateTime? createdTime,
  int? numComments,
  bool? isOwner,
  String? campaignName,
  DocumentReference? userRef,
  String? linkLearnMore,
  bool? isFlagged,
  String? city,
  bool? hasDeal,
  DocumentReference? dealRef,
}) {
  final firestoreData = serializers.toFirestore(
    StoriesRecord.serializer,
    StoriesRecord(
      (s) => s
        ..videoUrl = videoUrl
        ..restRef = restRef
        ..comment = comment
        ..storyName = storyName
        ..createdTime = createdTime
        ..numComments = numComments
        ..isOwner = isOwner
        ..campaignName = campaignName
        ..userRef = userRef
        ..linkLearnMore = linkLearnMore
        ..isFlagged = isFlagged
        ..city = city
        ..hasDeal = hasDeal
        ..dealRef = dealRef,
    ),
  );

  return firestoreData;
}

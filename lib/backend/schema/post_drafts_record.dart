import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'post_drafts_record.g.dart';

abstract class PostDraftsRecord
    implements Built<PostDraftsRecord, PostDraftsRecordBuilder> {
  static Serializer<PostDraftsRecord> get serializer =>
      _$postDraftsRecordSerializer;

  @BuiltValueField(wireName: 'video_url')
  String? get videoUrl;

  @BuiltValueField(wireName: 'restaurant_name')
  String? get restaurantName;

  @BuiltValueField(wireName: 'user_rating')
  double? get userRating;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  String? get description;

  DocumentReference? get user;

  String? get username;

  @BuiltValueField(wireName: 'rest_ref')
  DocumentReference? get restRef;

  BuiltList<DocumentReference>? get likes;

  @BuiltValueField(wireName: 'video_thumbnail')
  String? get videoThumbnail;

  bool? get postOwner;

  @BuiltValueField(wireName: 'num_likes')
  int? get numLikes;

  @BuiltValueField(wireName: 'num_comments')
  int? get numComments;

  @BuiltValueField(wireName: 'num_shares')
  int? get numShares;

  int? get wacthed;

  bool? get isFlagged;

  LatLng? get userLocation;

  BuiltList<DocumentReference>? get userFlagged;

  BuiltList<bool>? get flagged;

  DocumentReference? get flaggedVideoRef;

  DocumentReference? get userThatFlagged;

  LatLng? get postLocation;

  String? get attribute1;

  String? get attribute2;

  BuiltList<DocumentReference>? get menuItems;

  String? get attribute3;

  DocumentReference? get replyVideo;

  bool? get hasReply;

  String? get videoReplyURL;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PostDraftsRecordBuilder builder) => builder
    ..videoUrl = ''
    ..restaurantName = ''
    ..userRating = 0.0
    ..description = ''
    ..username = ''
    ..likes = ListBuilder()
    ..videoThumbnail = ''
    ..postOwner = false
    ..numLikes = 0
    ..numComments = 0
    ..numShares = 0
    ..wacthed = 0
    ..isFlagged = false
    ..userFlagged = ListBuilder()
    ..flagged = ListBuilder()
    ..attribute1 = ''
    ..attribute2 = ''
    ..menuItems = ListBuilder()
    ..attribute3 = ''
    ..hasReply = false
    ..videoReplyURL = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('postDrafts');

  static Stream<PostDraftsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PostDraftsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PostDraftsRecord._();
  factory PostDraftsRecord([void Function(PostDraftsRecordBuilder) updates]) =
      _$PostDraftsRecord;

  static PostDraftsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPostDraftsRecordData({
  String? videoUrl,
  String? restaurantName,
  double? userRating,
  DateTime? createdAt,
  String? description,
  DocumentReference? user,
  String? username,
  DocumentReference? restRef,
  String? videoThumbnail,
  bool? postOwner,
  int? numLikes,
  int? numComments,
  int? numShares,
  int? wacthed,
  bool? isFlagged,
  LatLng? userLocation,
  DocumentReference? flaggedVideoRef,
  DocumentReference? userThatFlagged,
  LatLng? postLocation,
  String? attribute1,
  String? attribute2,
  String? attribute3,
  DocumentReference? replyVideo,
  bool? hasReply,
  String? videoReplyURL,
}) {
  final firestoreData = serializers.toFirestore(
    PostDraftsRecord.serializer,
    PostDraftsRecord(
      (p) => p
        ..videoUrl = videoUrl
        ..restaurantName = restaurantName
        ..userRating = userRating
        ..createdAt = createdAt
        ..description = description
        ..user = user
        ..username = username
        ..restRef = restRef
        ..likes = null
        ..videoThumbnail = videoThumbnail
        ..postOwner = postOwner
        ..numLikes = numLikes
        ..numComments = numComments
        ..numShares = numShares
        ..wacthed = wacthed
        ..isFlagged = isFlagged
        ..userLocation = userLocation
        ..userFlagged = null
        ..flagged = null
        ..flaggedVideoRef = flaggedVideoRef
        ..userThatFlagged = userThatFlagged
        ..postLocation = postLocation
        ..attribute1 = attribute1
        ..attribute2 = attribute2
        ..menuItems = null
        ..attribute3 = attribute3
        ..replyVideo = replyVideo
        ..hasReply = hasReply
        ..videoReplyURL = videoReplyURL,
    ),
  );

  return firestoreData;
}

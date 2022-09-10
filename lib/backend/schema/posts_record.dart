import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'posts_record.g.dart';

abstract class PostsRecord implements Built<PostsRecord, PostsRecordBuilder> {
  static Serializer<PostsRecord> get serializer => _$postsRecordSerializer;

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

  double? get food;

  double? get service;

  double? get cleanliness;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PostsRecordBuilder builder) => builder
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
    ..videoReplyURL = ''
    ..food = 0.0
    ..service = 0.0
    ..cleanliness = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static PostsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => PostsRecord(
        (c) => c
          ..videoUrl = snapshot.data['video_url']
          ..restaurantName = snapshot.data['restaurant_name']
          ..userRating = snapshot.data['user_rating']?.toDouble()
          ..createdAt = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['created_at']))
          ..description = snapshot.data['description']
          ..user = safeGet(() => toRef(snapshot.data['user']))
          ..username = snapshot.data['username']
          ..restRef = safeGet(() => toRef(snapshot.data['rest_ref']))
          ..likes = safeGet(
              () => ListBuilder(snapshot.data['likes'].map((s) => toRef(s))))
          ..videoThumbnail = snapshot.data['video_thumbnail']
          ..postOwner = snapshot.data['postOwner']
          ..numLikes = snapshot.data['num_likes']?.round()
          ..numComments = snapshot.data['num_comments']?.round()
          ..numShares = snapshot.data['num_shares']?.round()
          ..wacthed = snapshot.data['wacthed']?.round()
          ..isFlagged = snapshot.data['isFlagged']
          ..userLocation = safeGet(() => LatLng(
                snapshot.data['_geoloc']['lat'],
                snapshot.data['_geoloc']['lng'],
              ))
          ..userFlagged = safeGet(() =>
              ListBuilder(snapshot.data['userFlagged'].map((s) => toRef(s))))
          ..flagged = safeGet(() => ListBuilder(snapshot.data['flagged']))
          ..flaggedVideoRef =
              safeGet(() => toRef(snapshot.data['flaggedVideoRef']))
          ..userThatFlagged =
              safeGet(() => toRef(snapshot.data['userThatFlagged']))
          ..postLocation = safeGet(() => LatLng(
                snapshot.data['_geoloc']['lat'],
                snapshot.data['_geoloc']['lng'],
              ))
          ..attribute1 = snapshot.data['attribute1']
          ..attribute2 = snapshot.data['attribute2']
          ..menuItems = safeGet(() =>
              ListBuilder(snapshot.data['menuItems'].map((s) => toRef(s))))
          ..attribute3 = snapshot.data['attribute3']
          ..replyVideo = safeGet(() => toRef(snapshot.data['replyVideo']))
          ..hasReply = snapshot.data['hasReply']
          ..videoReplyURL = snapshot.data['videoReplyURL']
          ..food = snapshot.data['food']?.toDouble()
          ..service = snapshot.data['service']?.toDouble()
          ..cleanliness = snapshot.data['cleanliness']?.toDouble()
          ..ffRef = PostsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<PostsRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'posts',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  PostsRecord._();
  factory PostsRecord([void Function(PostsRecordBuilder) updates]) =
      _$PostsRecord;

  static PostsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPostsRecordData({
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
  double? food,
  double? service,
  double? cleanliness,
}) {
  final firestoreData = serializers.toFirestore(
    PostsRecord.serializer,
    PostsRecord(
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
        ..videoReplyURL = videoReplyURL
        ..food = food
        ..service = service
        ..cleanliness = cleanliness,
    ),
  );

  return firestoreData;
}

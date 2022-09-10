// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_drafts_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PostDraftsRecord> _$postDraftsRecordSerializer =
    new _$PostDraftsRecordSerializer();

class _$PostDraftsRecordSerializer
    implements StructuredSerializer<PostDraftsRecord> {
  @override
  final Iterable<Type> types = const [PostDraftsRecord, _$PostDraftsRecord];
  @override
  final String wireName = 'PostDraftsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PostDraftsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.videoUrl;
    if (value != null) {
      result
        ..add('video_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.restaurantName;
    if (value != null) {
      result
        ..add('restaurant_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userRating;
    if (value != null) {
      result
        ..add('user_rating')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.username;
    if (value != null) {
      result
        ..add('username')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.restRef;
    if (value != null) {
      result
        ..add('rest_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.likes;
    if (value != null) {
      result
        ..add('likes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.videoThumbnail;
    if (value != null) {
      result
        ..add('video_thumbnail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postOwner;
    if (value != null) {
      result
        ..add('postOwner')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.numLikes;
    if (value != null) {
      result
        ..add('num_likes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.numComments;
    if (value != null) {
      result
        ..add('num_comments')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.numShares;
    if (value != null) {
      result
        ..add('num_shares')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.wacthed;
    if (value != null) {
      result
        ..add('wacthed')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.isFlagged;
    if (value != null) {
      result
        ..add('isFlagged')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.userLocation;
    if (value != null) {
      result
        ..add('userLocation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.userFlagged;
    if (value != null) {
      result
        ..add('userFlagged')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.flagged;
    if (value != null) {
      result
        ..add('flagged')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(bool)])));
    }
    value = object.flaggedVideoRef;
    if (value != null) {
      result
        ..add('flaggedVideoRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.userThatFlagged;
    if (value != null) {
      result
        ..add('userThatFlagged')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.postLocation;
    if (value != null) {
      result
        ..add('postLocation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.attribute1;
    if (value != null) {
      result
        ..add('attribute1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.attribute2;
    if (value != null) {
      result
        ..add('attribute2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.menuItems;
    if (value != null) {
      result
        ..add('menuItems')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.attribute3;
    if (value != null) {
      result
        ..add('attribute3')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.replyVideo;
    if (value != null) {
      result
        ..add('replyVideo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.hasReply;
    if (value != null) {
      result
        ..add('hasReply')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.videoReplyURL;
    if (value != null) {
      result
        ..add('videoReplyURL')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  PostDraftsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostDraftsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'video_url':
          result.videoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'restaurant_name':
          result.restaurantName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_rating':
          result.userRating = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rest_ref':
          result.restRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'likes':
          result.likes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'video_thumbnail':
          result.videoThumbnail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'postOwner':
          result.postOwner = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'num_likes':
          result.numLikes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'num_comments':
          result.numComments = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'num_shares':
          result.numShares = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'wacthed':
          result.wacthed = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'isFlagged':
          result.isFlagged = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'userLocation':
          result.userLocation = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'userFlagged':
          result.userFlagged.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'flagged':
          result.flagged.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(bool)]))!
              as BuiltList<Object?>);
          break;
        case 'flaggedVideoRef':
          result.flaggedVideoRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'userThatFlagged':
          result.userThatFlagged = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'postLocation':
          result.postLocation = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'attribute1':
          result.attribute1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'attribute2':
          result.attribute2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'menuItems':
          result.menuItems.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'attribute3':
          result.attribute3 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'replyVideo':
          result.replyVideo = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'hasReply':
          result.hasReply = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'videoReplyURL':
          result.videoReplyURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$PostDraftsRecord extends PostDraftsRecord {
  @override
  final String? videoUrl;
  @override
  final String? restaurantName;
  @override
  final double? userRating;
  @override
  final DateTime? createdAt;
  @override
  final String? description;
  @override
  final DocumentReference<Object?>? user;
  @override
  final String? username;
  @override
  final DocumentReference<Object?>? restRef;
  @override
  final BuiltList<DocumentReference<Object?>>? likes;
  @override
  final String? videoThumbnail;
  @override
  final bool? postOwner;
  @override
  final int? numLikes;
  @override
  final int? numComments;
  @override
  final int? numShares;
  @override
  final int? wacthed;
  @override
  final bool? isFlagged;
  @override
  final LatLng? userLocation;
  @override
  final BuiltList<DocumentReference<Object?>>? userFlagged;
  @override
  final BuiltList<bool>? flagged;
  @override
  final DocumentReference<Object?>? flaggedVideoRef;
  @override
  final DocumentReference<Object?>? userThatFlagged;
  @override
  final LatLng? postLocation;
  @override
  final String? attribute1;
  @override
  final String? attribute2;
  @override
  final BuiltList<DocumentReference<Object?>>? menuItems;
  @override
  final String? attribute3;
  @override
  final DocumentReference<Object?>? replyVideo;
  @override
  final bool? hasReply;
  @override
  final String? videoReplyURL;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PostDraftsRecord(
          [void Function(PostDraftsRecordBuilder)? updates]) =>
      (new PostDraftsRecordBuilder()..update(updates))._build();

  _$PostDraftsRecord._(
      {this.videoUrl,
      this.restaurantName,
      this.userRating,
      this.createdAt,
      this.description,
      this.user,
      this.username,
      this.restRef,
      this.likes,
      this.videoThumbnail,
      this.postOwner,
      this.numLikes,
      this.numComments,
      this.numShares,
      this.wacthed,
      this.isFlagged,
      this.userLocation,
      this.userFlagged,
      this.flagged,
      this.flaggedVideoRef,
      this.userThatFlagged,
      this.postLocation,
      this.attribute1,
      this.attribute2,
      this.menuItems,
      this.attribute3,
      this.replyVideo,
      this.hasReply,
      this.videoReplyURL,
      this.ffRef})
      : super._();

  @override
  PostDraftsRecord rebuild(void Function(PostDraftsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostDraftsRecordBuilder toBuilder() =>
      new PostDraftsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostDraftsRecord &&
        videoUrl == other.videoUrl &&
        restaurantName == other.restaurantName &&
        userRating == other.userRating &&
        createdAt == other.createdAt &&
        description == other.description &&
        user == other.user &&
        username == other.username &&
        restRef == other.restRef &&
        likes == other.likes &&
        videoThumbnail == other.videoThumbnail &&
        postOwner == other.postOwner &&
        numLikes == other.numLikes &&
        numComments == other.numComments &&
        numShares == other.numShares &&
        wacthed == other.wacthed &&
        isFlagged == other.isFlagged &&
        userLocation == other.userLocation &&
        userFlagged == other.userFlagged &&
        flagged == other.flagged &&
        flaggedVideoRef == other.flaggedVideoRef &&
        userThatFlagged == other.userThatFlagged &&
        postLocation == other.postLocation &&
        attribute1 == other.attribute1 &&
        attribute2 == other.attribute2 &&
        menuItems == other.menuItems &&
        attribute3 == other.attribute3 &&
        replyVideo == other.replyVideo &&
        hasReply == other.hasReply &&
        videoReplyURL == other.videoReplyURL &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, videoUrl.hashCode), restaurantName.hashCode), userRating.hashCode), createdAt.hashCode), description.hashCode), user.hashCode), username.hashCode), restRef.hashCode), likes.hashCode), videoThumbnail.hashCode), postOwner.hashCode),
                                                                                numLikes.hashCode),
                                                                            numComments.hashCode),
                                                                        numShares.hashCode),
                                                                    wacthed.hashCode),
                                                                isFlagged.hashCode),
                                                            userLocation.hashCode),
                                                        userFlagged.hashCode),
                                                    flagged.hashCode),
                                                flaggedVideoRef.hashCode),
                                            userThatFlagged.hashCode),
                                        postLocation.hashCode),
                                    attribute1.hashCode),
                                attribute2.hashCode),
                            menuItems.hashCode),
                        attribute3.hashCode),
                    replyVideo.hashCode),
                hasReply.hashCode),
            videoReplyURL.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostDraftsRecord')
          ..add('videoUrl', videoUrl)
          ..add('restaurantName', restaurantName)
          ..add('userRating', userRating)
          ..add('createdAt', createdAt)
          ..add('description', description)
          ..add('user', user)
          ..add('username', username)
          ..add('restRef', restRef)
          ..add('likes', likes)
          ..add('videoThumbnail', videoThumbnail)
          ..add('postOwner', postOwner)
          ..add('numLikes', numLikes)
          ..add('numComments', numComments)
          ..add('numShares', numShares)
          ..add('wacthed', wacthed)
          ..add('isFlagged', isFlagged)
          ..add('userLocation', userLocation)
          ..add('userFlagged', userFlagged)
          ..add('flagged', flagged)
          ..add('flaggedVideoRef', flaggedVideoRef)
          ..add('userThatFlagged', userThatFlagged)
          ..add('postLocation', postLocation)
          ..add('attribute1', attribute1)
          ..add('attribute2', attribute2)
          ..add('menuItems', menuItems)
          ..add('attribute3', attribute3)
          ..add('replyVideo', replyVideo)
          ..add('hasReply', hasReply)
          ..add('videoReplyURL', videoReplyURL)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PostDraftsRecordBuilder
    implements Builder<PostDraftsRecord, PostDraftsRecordBuilder> {
  _$PostDraftsRecord? _$v;

  String? _videoUrl;
  String? get videoUrl => _$this._videoUrl;
  set videoUrl(String? videoUrl) => _$this._videoUrl = videoUrl;

  String? _restaurantName;
  String? get restaurantName => _$this._restaurantName;
  set restaurantName(String? restaurantName) =>
      _$this._restaurantName = restaurantName;

  double? _userRating;
  double? get userRating => _$this._userRating;
  set userRating(double? userRating) => _$this._userRating = userRating;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  DocumentReference<Object?>? _restRef;
  DocumentReference<Object?>? get restRef => _$this._restRef;
  set restRef(DocumentReference<Object?>? restRef) => _$this._restRef = restRef;

  ListBuilder<DocumentReference<Object?>>? _likes;
  ListBuilder<DocumentReference<Object?>> get likes =>
      _$this._likes ??= new ListBuilder<DocumentReference<Object?>>();
  set likes(ListBuilder<DocumentReference<Object?>>? likes) =>
      _$this._likes = likes;

  String? _videoThumbnail;
  String? get videoThumbnail => _$this._videoThumbnail;
  set videoThumbnail(String? videoThumbnail) =>
      _$this._videoThumbnail = videoThumbnail;

  bool? _postOwner;
  bool? get postOwner => _$this._postOwner;
  set postOwner(bool? postOwner) => _$this._postOwner = postOwner;

  int? _numLikes;
  int? get numLikes => _$this._numLikes;
  set numLikes(int? numLikes) => _$this._numLikes = numLikes;

  int? _numComments;
  int? get numComments => _$this._numComments;
  set numComments(int? numComments) => _$this._numComments = numComments;

  int? _numShares;
  int? get numShares => _$this._numShares;
  set numShares(int? numShares) => _$this._numShares = numShares;

  int? _wacthed;
  int? get wacthed => _$this._wacthed;
  set wacthed(int? wacthed) => _$this._wacthed = wacthed;

  bool? _isFlagged;
  bool? get isFlagged => _$this._isFlagged;
  set isFlagged(bool? isFlagged) => _$this._isFlagged = isFlagged;

  LatLng? _userLocation;
  LatLng? get userLocation => _$this._userLocation;
  set userLocation(LatLng? userLocation) => _$this._userLocation = userLocation;

  ListBuilder<DocumentReference<Object?>>? _userFlagged;
  ListBuilder<DocumentReference<Object?>> get userFlagged =>
      _$this._userFlagged ??= new ListBuilder<DocumentReference<Object?>>();
  set userFlagged(ListBuilder<DocumentReference<Object?>>? userFlagged) =>
      _$this._userFlagged = userFlagged;

  ListBuilder<bool>? _flagged;
  ListBuilder<bool> get flagged => _$this._flagged ??= new ListBuilder<bool>();
  set flagged(ListBuilder<bool>? flagged) => _$this._flagged = flagged;

  DocumentReference<Object?>? _flaggedVideoRef;
  DocumentReference<Object?>? get flaggedVideoRef => _$this._flaggedVideoRef;
  set flaggedVideoRef(DocumentReference<Object?>? flaggedVideoRef) =>
      _$this._flaggedVideoRef = flaggedVideoRef;

  DocumentReference<Object?>? _userThatFlagged;
  DocumentReference<Object?>? get userThatFlagged => _$this._userThatFlagged;
  set userThatFlagged(DocumentReference<Object?>? userThatFlagged) =>
      _$this._userThatFlagged = userThatFlagged;

  LatLng? _postLocation;
  LatLng? get postLocation => _$this._postLocation;
  set postLocation(LatLng? postLocation) => _$this._postLocation = postLocation;

  String? _attribute1;
  String? get attribute1 => _$this._attribute1;
  set attribute1(String? attribute1) => _$this._attribute1 = attribute1;

  String? _attribute2;
  String? get attribute2 => _$this._attribute2;
  set attribute2(String? attribute2) => _$this._attribute2 = attribute2;

  ListBuilder<DocumentReference<Object?>>? _menuItems;
  ListBuilder<DocumentReference<Object?>> get menuItems =>
      _$this._menuItems ??= new ListBuilder<DocumentReference<Object?>>();
  set menuItems(ListBuilder<DocumentReference<Object?>>? menuItems) =>
      _$this._menuItems = menuItems;

  String? _attribute3;
  String? get attribute3 => _$this._attribute3;
  set attribute3(String? attribute3) => _$this._attribute3 = attribute3;

  DocumentReference<Object?>? _replyVideo;
  DocumentReference<Object?>? get replyVideo => _$this._replyVideo;
  set replyVideo(DocumentReference<Object?>? replyVideo) =>
      _$this._replyVideo = replyVideo;

  bool? _hasReply;
  bool? get hasReply => _$this._hasReply;
  set hasReply(bool? hasReply) => _$this._hasReply = hasReply;

  String? _videoReplyURL;
  String? get videoReplyURL => _$this._videoReplyURL;
  set videoReplyURL(String? videoReplyURL) =>
      _$this._videoReplyURL = videoReplyURL;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PostDraftsRecordBuilder() {
    PostDraftsRecord._initializeBuilder(this);
  }

  PostDraftsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _videoUrl = $v.videoUrl;
      _restaurantName = $v.restaurantName;
      _userRating = $v.userRating;
      _createdAt = $v.createdAt;
      _description = $v.description;
      _user = $v.user;
      _username = $v.username;
      _restRef = $v.restRef;
      _likes = $v.likes?.toBuilder();
      _videoThumbnail = $v.videoThumbnail;
      _postOwner = $v.postOwner;
      _numLikes = $v.numLikes;
      _numComments = $v.numComments;
      _numShares = $v.numShares;
      _wacthed = $v.wacthed;
      _isFlagged = $v.isFlagged;
      _userLocation = $v.userLocation;
      _userFlagged = $v.userFlagged?.toBuilder();
      _flagged = $v.flagged?.toBuilder();
      _flaggedVideoRef = $v.flaggedVideoRef;
      _userThatFlagged = $v.userThatFlagged;
      _postLocation = $v.postLocation;
      _attribute1 = $v.attribute1;
      _attribute2 = $v.attribute2;
      _menuItems = $v.menuItems?.toBuilder();
      _attribute3 = $v.attribute3;
      _replyVideo = $v.replyVideo;
      _hasReply = $v.hasReply;
      _videoReplyURL = $v.videoReplyURL;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostDraftsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostDraftsRecord;
  }

  @override
  void update(void Function(PostDraftsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostDraftsRecord build() => _build();

  _$PostDraftsRecord _build() {
    _$PostDraftsRecord _$result;
    try {
      _$result = _$v ??
          new _$PostDraftsRecord._(
              videoUrl: videoUrl,
              restaurantName: restaurantName,
              userRating: userRating,
              createdAt: createdAt,
              description: description,
              user: user,
              username: username,
              restRef: restRef,
              likes: _likes?.build(),
              videoThumbnail: videoThumbnail,
              postOwner: postOwner,
              numLikes: numLikes,
              numComments: numComments,
              numShares: numShares,
              wacthed: wacthed,
              isFlagged: isFlagged,
              userLocation: userLocation,
              userFlagged: _userFlagged?.build(),
              flagged: _flagged?.build(),
              flaggedVideoRef: flaggedVideoRef,
              userThatFlagged: userThatFlagged,
              postLocation: postLocation,
              attribute1: attribute1,
              attribute2: attribute2,
              menuItems: _menuItems?.build(),
              attribute3: attribute3,
              replyVideo: replyVideo,
              hasReply: hasReply,
              videoReplyURL: videoReplyURL,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'likes';
        _likes?.build();

        _$failedField = 'userFlagged';
        _userFlagged?.build();
        _$failedField = 'flagged';
        _flagged?.build();

        _$failedField = 'menuItems';
        _menuItems?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PostDraftsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

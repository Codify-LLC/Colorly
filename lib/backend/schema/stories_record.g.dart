// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StoriesRecord> _$storiesRecordSerializer =
    new _$StoriesRecordSerializer();

class _$StoriesRecordSerializer implements StructuredSerializer<StoriesRecord> {
  @override
  final Iterable<Type> types = const [StoriesRecord, _$StoriesRecord];
  @override
  final String wireName = 'StoriesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, StoriesRecord object,
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
    value = object.restRef;
    if (value != null) {
      result
        ..add('rest_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.comment;
    if (value != null) {
      result
        ..add('comment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.storyName;
    if (value != null) {
      result
        ..add('storyName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.numComments;
    if (value != null) {
      result
        ..add('numComments')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.isOwner;
    if (value != null) {
      result
        ..add('isOwner')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.campaignName;
    if (value != null) {
      result
        ..add('campaignName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('user_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.linkLearnMore;
    if (value != null) {
      result
        ..add('linkLearnMore')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isFlagged;
    if (value != null) {
      result
        ..add('isFlagged')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.city;
    if (value != null) {
      result
        ..add('city')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.hasDeal;
    if (value != null) {
      result
        ..add('hasDeal')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.dealRef;
    if (value != null) {
      result
        ..add('dealRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  StoriesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StoriesRecordBuilder();

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
        case 'rest_ref':
          result.restRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'comment':
          result.comment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'storyName':
          result.storyName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'numComments':
          result.numComments = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'isOwner':
          result.isOwner = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'campaignName':
          result.campaignName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_ref':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'linkLearnMore':
          result.linkLearnMore = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isFlagged':
          result.isFlagged = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'hasDeal':
          result.hasDeal = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'dealRef':
          result.dealRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$StoriesRecord extends StoriesRecord {
  @override
  final String? videoUrl;
  @override
  final DocumentReference<Object?>? restRef;
  @override
  final String? comment;
  @override
  final String? storyName;
  @override
  final DateTime? createdTime;
  @override
  final int? numComments;
  @override
  final bool? isOwner;
  @override
  final String? campaignName;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final String? linkLearnMore;
  @override
  final bool? isFlagged;
  @override
  final String? city;
  @override
  final bool? hasDeal;
  @override
  final DocumentReference<Object?>? dealRef;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$StoriesRecord([void Function(StoriesRecordBuilder)? updates]) =>
      (new StoriesRecordBuilder()..update(updates))._build();

  _$StoriesRecord._(
      {this.videoUrl,
      this.restRef,
      this.comment,
      this.storyName,
      this.createdTime,
      this.numComments,
      this.isOwner,
      this.campaignName,
      this.userRef,
      this.linkLearnMore,
      this.isFlagged,
      this.city,
      this.hasDeal,
      this.dealRef,
      this.ffRef})
      : super._();

  @override
  StoriesRecord rebuild(void Function(StoriesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StoriesRecordBuilder toBuilder() => new StoriesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StoriesRecord &&
        videoUrl == other.videoUrl &&
        restRef == other.restRef &&
        comment == other.comment &&
        storyName == other.storyName &&
        createdTime == other.createdTime &&
        numComments == other.numComments &&
        isOwner == other.isOwner &&
        campaignName == other.campaignName &&
        userRef == other.userRef &&
        linkLearnMore == other.linkLearnMore &&
        isFlagged == other.isFlagged &&
        city == other.city &&
        hasDeal == other.hasDeal &&
        dealRef == other.dealRef &&
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
                                                                0,
                                                                videoUrl
                                                                    .hashCode),
                                                            restRef.hashCode),
                                                        comment.hashCode),
                                                    storyName.hashCode),
                                                createdTime.hashCode),
                                            numComments.hashCode),
                                        isOwner.hashCode),
                                    campaignName.hashCode),
                                userRef.hashCode),
                            linkLearnMore.hashCode),
                        isFlagged.hashCode),
                    city.hashCode),
                hasDeal.hashCode),
            dealRef.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StoriesRecord')
          ..add('videoUrl', videoUrl)
          ..add('restRef', restRef)
          ..add('comment', comment)
          ..add('storyName', storyName)
          ..add('createdTime', createdTime)
          ..add('numComments', numComments)
          ..add('isOwner', isOwner)
          ..add('campaignName', campaignName)
          ..add('userRef', userRef)
          ..add('linkLearnMore', linkLearnMore)
          ..add('isFlagged', isFlagged)
          ..add('city', city)
          ..add('hasDeal', hasDeal)
          ..add('dealRef', dealRef)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class StoriesRecordBuilder
    implements Builder<StoriesRecord, StoriesRecordBuilder> {
  _$StoriesRecord? _$v;

  String? _videoUrl;
  String? get videoUrl => _$this._videoUrl;
  set videoUrl(String? videoUrl) => _$this._videoUrl = videoUrl;

  DocumentReference<Object?>? _restRef;
  DocumentReference<Object?>? get restRef => _$this._restRef;
  set restRef(DocumentReference<Object?>? restRef) => _$this._restRef = restRef;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  String? _storyName;
  String? get storyName => _$this._storyName;
  set storyName(String? storyName) => _$this._storyName = storyName;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  int? _numComments;
  int? get numComments => _$this._numComments;
  set numComments(int? numComments) => _$this._numComments = numComments;

  bool? _isOwner;
  bool? get isOwner => _$this._isOwner;
  set isOwner(bool? isOwner) => _$this._isOwner = isOwner;

  String? _campaignName;
  String? get campaignName => _$this._campaignName;
  set campaignName(String? campaignName) => _$this._campaignName = campaignName;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  String? _linkLearnMore;
  String? get linkLearnMore => _$this._linkLearnMore;
  set linkLearnMore(String? linkLearnMore) =>
      _$this._linkLearnMore = linkLearnMore;

  bool? _isFlagged;
  bool? get isFlagged => _$this._isFlagged;
  set isFlagged(bool? isFlagged) => _$this._isFlagged = isFlagged;

  String? _city;
  String? get city => _$this._city;
  set city(String? city) => _$this._city = city;

  bool? _hasDeal;
  bool? get hasDeal => _$this._hasDeal;
  set hasDeal(bool? hasDeal) => _$this._hasDeal = hasDeal;

  DocumentReference<Object?>? _dealRef;
  DocumentReference<Object?>? get dealRef => _$this._dealRef;
  set dealRef(DocumentReference<Object?>? dealRef) => _$this._dealRef = dealRef;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  StoriesRecordBuilder() {
    StoriesRecord._initializeBuilder(this);
  }

  StoriesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _videoUrl = $v.videoUrl;
      _restRef = $v.restRef;
      _comment = $v.comment;
      _storyName = $v.storyName;
      _createdTime = $v.createdTime;
      _numComments = $v.numComments;
      _isOwner = $v.isOwner;
      _campaignName = $v.campaignName;
      _userRef = $v.userRef;
      _linkLearnMore = $v.linkLearnMore;
      _isFlagged = $v.isFlagged;
      _city = $v.city;
      _hasDeal = $v.hasDeal;
      _dealRef = $v.dealRef;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StoriesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StoriesRecord;
  }

  @override
  void update(void Function(StoriesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StoriesRecord build() => _build();

  _$StoriesRecord _build() {
    final _$result = _$v ??
        new _$StoriesRecord._(
            videoUrl: videoUrl,
            restRef: restRef,
            comment: comment,
            storyName: storyName,
            createdTime: createdTime,
            numComments: numComments,
            isOwner: isOwner,
            campaignName: campaignName,
            userRef: userRef,
            linkLearnMore: linkLearnMore,
            isFlagged: isFlagged,
            city: city,
            hasDeal: hasDeal,
            dealRef: dealRef,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

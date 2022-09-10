// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reply_videos_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ReplyVideosRecord> _$replyVideosRecordSerializer =
    new _$ReplyVideosRecordSerializer();

class _$ReplyVideosRecordSerializer
    implements StructuredSerializer<ReplyVideosRecord> {
  @override
  final Iterable<Type> types = const [ReplyVideosRecord, _$ReplyVideosRecord];
  @override
  final String wireName = 'ReplyVideosRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ReplyVideosRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.post;
    if (value != null) {
      result
        ..add('post')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.video;
    if (value != null) {
      result
        ..add('video')
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
  ReplyVideosRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReplyVideosRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'post':
          result.post = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'video':
          result.video = serializers.deserialize(value,
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

class _$ReplyVideosRecord extends ReplyVideosRecord {
  @override
  final DocumentReference<Object?>? user;
  @override
  final DocumentReference<Object?>? post;
  @override
  final String? video;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ReplyVideosRecord(
          [void Function(ReplyVideosRecordBuilder)? updates]) =>
      (new ReplyVideosRecordBuilder()..update(updates))._build();

  _$ReplyVideosRecord._({this.user, this.post, this.video, this.ffRef})
      : super._();

  @override
  ReplyVideosRecord rebuild(void Function(ReplyVideosRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReplyVideosRecordBuilder toBuilder() =>
      new ReplyVideosRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReplyVideosRecord &&
        user == other.user &&
        post == other.post &&
        video == other.video &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, user.hashCode), post.hashCode), video.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReplyVideosRecord')
          ..add('user', user)
          ..add('post', post)
          ..add('video', video)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ReplyVideosRecordBuilder
    implements Builder<ReplyVideosRecord, ReplyVideosRecordBuilder> {
  _$ReplyVideosRecord? _$v;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  DocumentReference<Object?>? _post;
  DocumentReference<Object?>? get post => _$this._post;
  set post(DocumentReference<Object?>? post) => _$this._post = post;

  String? _video;
  String? get video => _$this._video;
  set video(String? video) => _$this._video = video;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ReplyVideosRecordBuilder() {
    ReplyVideosRecord._initializeBuilder(this);
  }

  ReplyVideosRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user;
      _post = $v.post;
      _video = $v.video;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReplyVideosRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReplyVideosRecord;
  }

  @override
  void update(void Function(ReplyVideosRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReplyVideosRecord build() => _build();

  _$ReplyVideosRecord _build() {
    final _$result = _$v ??
        new _$ReplyVideosRecord._(
            user: user, post: post, video: video, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

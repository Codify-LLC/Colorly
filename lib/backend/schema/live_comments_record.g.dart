// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_comments_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LiveCommentsRecord> _$liveCommentsRecordSerializer =
    new _$LiveCommentsRecordSerializer();

class _$LiveCommentsRecordSerializer
    implements StructuredSerializer<LiveCommentsRecord> {
  @override
  final Iterable<Type> types = const [LiveCommentsRecord, _$LiveCommentsRecord];
  @override
  final String wireName = 'LiveCommentsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, LiveCommentsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.timestamp;
    if (value != null) {
      result
        ..add('timestamp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.comment;
    if (value != null) {
      result
        ..add('comment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.stream;
    if (value != null) {
      result
        ..add('stream')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
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
  LiveCommentsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LiveCommentsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'comment':
          result.comment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'stream':
          result.stream = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
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

class _$LiveCommentsRecord extends LiveCommentsRecord {
  @override
  final DateTime? timestamp;
  @override
  final String? comment;
  @override
  final DocumentReference<Object?>? stream;
  @override
  final DocumentReference<Object?>? user;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$LiveCommentsRecord(
          [void Function(LiveCommentsRecordBuilder)? updates]) =>
      (new LiveCommentsRecordBuilder()..update(updates))._build();

  _$LiveCommentsRecord._(
      {this.timestamp, this.comment, this.stream, this.user, this.ffRef})
      : super._();

  @override
  LiveCommentsRecord rebuild(
          void Function(LiveCommentsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LiveCommentsRecordBuilder toBuilder() =>
      new LiveCommentsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LiveCommentsRecord &&
        timestamp == other.timestamp &&
        comment == other.comment &&
        stream == other.stream &&
        user == other.user &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, timestamp.hashCode), comment.hashCode),
                stream.hashCode),
            user.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LiveCommentsRecord')
          ..add('timestamp', timestamp)
          ..add('comment', comment)
          ..add('stream', stream)
          ..add('user', user)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class LiveCommentsRecordBuilder
    implements Builder<LiveCommentsRecord, LiveCommentsRecordBuilder> {
  _$LiveCommentsRecord? _$v;

  DateTime? _timestamp;
  DateTime? get timestamp => _$this._timestamp;
  set timestamp(DateTime? timestamp) => _$this._timestamp = timestamp;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  DocumentReference<Object?>? _stream;
  DocumentReference<Object?>? get stream => _$this._stream;
  set stream(DocumentReference<Object?>? stream) => _$this._stream = stream;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  LiveCommentsRecordBuilder() {
    LiveCommentsRecord._initializeBuilder(this);
  }

  LiveCommentsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _timestamp = $v.timestamp;
      _comment = $v.comment;
      _stream = $v.stream;
      _user = $v.user;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LiveCommentsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LiveCommentsRecord;
  }

  @override
  void update(void Function(LiveCommentsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LiveCommentsRecord build() => _build();

  _$LiveCommentsRecord _build() {
    final _$result = _$v ??
        new _$LiveCommentsRecord._(
            timestamp: timestamp,
            comment: comment,
            stream: stream,
            user: user,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

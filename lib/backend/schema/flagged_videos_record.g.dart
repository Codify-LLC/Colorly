// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flagged_videos_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FlaggedVideosRecord> _$flaggedVideosRecordSerializer =
    new _$FlaggedVideosRecordSerializer();

class _$FlaggedVideosRecordSerializer
    implements StructuredSerializer<FlaggedVideosRecord> {
  @override
  final Iterable<Type> types = const [
    FlaggedVideosRecord,
    _$FlaggedVideosRecord
  ];
  @override
  final String wireName = 'FlaggedVideosRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, FlaggedVideosRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.userRef;
    if (value != null) {
      result
        ..add('userRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.postRef;
    if (value != null) {
      result
        ..add('postRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
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
  FlaggedVideosRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FlaggedVideosRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userRef':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'postRef':
          result.postRef.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
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

class _$FlaggedVideosRecord extends FlaggedVideosRecord {
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final BuiltList<DocumentReference<Object?>>? postRef;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FlaggedVideosRecord(
          [void Function(FlaggedVideosRecordBuilder)? updates]) =>
      (new FlaggedVideosRecordBuilder()..update(updates))._build();

  _$FlaggedVideosRecord._({this.userRef, this.postRef, this.ffRef}) : super._();

  @override
  FlaggedVideosRecord rebuild(
          void Function(FlaggedVideosRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FlaggedVideosRecordBuilder toBuilder() =>
      new FlaggedVideosRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FlaggedVideosRecord &&
        userRef == other.userRef &&
        postRef == other.postRef &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, userRef.hashCode), postRef.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FlaggedVideosRecord')
          ..add('userRef', userRef)
          ..add('postRef', postRef)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FlaggedVideosRecordBuilder
    implements Builder<FlaggedVideosRecord, FlaggedVideosRecordBuilder> {
  _$FlaggedVideosRecord? _$v;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  ListBuilder<DocumentReference<Object?>>? _postRef;
  ListBuilder<DocumentReference<Object?>> get postRef =>
      _$this._postRef ??= new ListBuilder<DocumentReference<Object?>>();
  set postRef(ListBuilder<DocumentReference<Object?>>? postRef) =>
      _$this._postRef = postRef;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FlaggedVideosRecordBuilder() {
    FlaggedVideosRecord._initializeBuilder(this);
  }

  FlaggedVideosRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userRef = $v.userRef;
      _postRef = $v.postRef?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FlaggedVideosRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FlaggedVideosRecord;
  }

  @override
  void update(void Function(FlaggedVideosRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FlaggedVideosRecord build() => _build();

  _$FlaggedVideosRecord _build() {
    _$FlaggedVideosRecord _$result;
    try {
      _$result = _$v ??
          new _$FlaggedVideosRecord._(
              userRef: userRef, postRef: _postRef?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'postRef';
        _postRef?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'FlaggedVideosRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

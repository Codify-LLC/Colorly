// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'likes_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LikesRecord> _$likesRecordSerializer = new _$LikesRecordSerializer();

class _$LikesRecordSerializer implements StructuredSerializer<LikesRecord> {
  @override
  final Iterable<Type> types = const [LikesRecord, _$LikesRecord];
  @override
  final String wireName = 'LikesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, LikesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.whoLikedReference;
    if (value != null) {
      result
        ..add('whoLikedReference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.postReference;
    if (value != null) {
      result
        ..add('postReference')
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
  LikesRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LikesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'whoLikedReference':
          result.whoLikedReference.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'postReference':
          result.postReference = serializers.deserialize(value,
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

class _$LikesRecord extends LikesRecord {
  @override
  final BuiltList<DocumentReference<Object?>>? whoLikedReference;
  @override
  final DocumentReference<Object?>? postReference;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$LikesRecord([void Function(LikesRecordBuilder)? updates]) =>
      (new LikesRecordBuilder()..update(updates))._build();

  _$LikesRecord._({this.whoLikedReference, this.postReference, this.ffRef})
      : super._();

  @override
  LikesRecord rebuild(void Function(LikesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LikesRecordBuilder toBuilder() => new LikesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LikesRecord &&
        whoLikedReference == other.whoLikedReference &&
        postReference == other.postReference &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, whoLikedReference.hashCode), postReference.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LikesRecord')
          ..add('whoLikedReference', whoLikedReference)
          ..add('postReference', postReference)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class LikesRecordBuilder implements Builder<LikesRecord, LikesRecordBuilder> {
  _$LikesRecord? _$v;

  ListBuilder<DocumentReference<Object?>>? _whoLikedReference;
  ListBuilder<DocumentReference<Object?>> get whoLikedReference =>
      _$this._whoLikedReference ??=
          new ListBuilder<DocumentReference<Object?>>();
  set whoLikedReference(
          ListBuilder<DocumentReference<Object?>>? whoLikedReference) =>
      _$this._whoLikedReference = whoLikedReference;

  DocumentReference<Object?>? _postReference;
  DocumentReference<Object?>? get postReference => _$this._postReference;
  set postReference(DocumentReference<Object?>? postReference) =>
      _$this._postReference = postReference;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  LikesRecordBuilder() {
    LikesRecord._initializeBuilder(this);
  }

  LikesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _whoLikedReference = $v.whoLikedReference?.toBuilder();
      _postReference = $v.postReference;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LikesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LikesRecord;
  }

  @override
  void update(void Function(LikesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LikesRecord build() => _build();

  _$LikesRecord _build() {
    _$LikesRecord _$result;
    try {
      _$result = _$v ??
          new _$LikesRecord._(
              whoLikedReference: _whoLikedReference?.build(),
              postReference: postReference,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'whoLikedReference';
        _whoLikedReference?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'LikesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

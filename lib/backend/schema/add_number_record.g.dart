// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_number_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AddNumberRecord> _$addNumberRecordSerializer =
    new _$AddNumberRecordSerializer();

class _$AddNumberRecordSerializer
    implements StructuredSerializer<AddNumberRecord> {
  @override
  final Iterable<Type> types = const [AddNumberRecord, _$AddNumberRecord];
  @override
  final String wireName = 'AddNumberRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AddNumberRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.count;
    if (value != null) {
      result
        ..add('count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  AddNumberRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AddNumberRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$AddNumberRecord extends AddNumberRecord {
  @override
  final int? count;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AddNumberRecord([void Function(AddNumberRecordBuilder)? updates]) =>
      (new AddNumberRecordBuilder()..update(updates))._build();

  _$AddNumberRecord._({this.count, this.ffRef}) : super._();

  @override
  AddNumberRecord rebuild(void Function(AddNumberRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddNumberRecordBuilder toBuilder() =>
      new AddNumberRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddNumberRecord &&
        count == other.count &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, count.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddNumberRecord')
          ..add('count', count)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AddNumberRecordBuilder
    implements Builder<AddNumberRecord, AddNumberRecordBuilder> {
  _$AddNumberRecord? _$v;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AddNumberRecordBuilder() {
    AddNumberRecord._initializeBuilder(this);
  }

  AddNumberRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _count = $v.count;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddNumberRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddNumberRecord;
  }

  @override
  void update(void Function(AddNumberRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddNumberRecord build() => _build();

  _$AddNumberRecord _build() {
    final _$result = _$v ?? new _$AddNumberRecord._(count: count, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

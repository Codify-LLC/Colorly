// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'options_for_i_c_i_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OptionsForICIRecord> _$optionsForICIRecordSerializer =
    new _$OptionsForICIRecordSerializer();

class _$OptionsForICIRecordSerializer
    implements StructuredSerializer<OptionsForICIRecord> {
  @override
  final Iterable<Type> types = const [
    OptionsForICIRecord,
    _$OptionsForICIRecord
  ];
  @override
  final String wireName = 'OptionsForICIRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, OptionsForICIRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.optionsNames;
    if (value != null) {
      result
        ..add('optionsNames')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.inCartItem;
    if (value != null) {
      result
        ..add('inCartItem')
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
  OptionsForICIRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OptionsForICIRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'optionsNames':
          result.optionsNames.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'inCartItem':
          result.inCartItem = serializers.deserialize(value,
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

class _$OptionsForICIRecord extends OptionsForICIRecord {
  @override
  final BuiltList<String>? optionsNames;
  @override
  final DocumentReference<Object?>? inCartItem;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$OptionsForICIRecord(
          [void Function(OptionsForICIRecordBuilder)? updates]) =>
      (new OptionsForICIRecordBuilder()..update(updates))._build();

  _$OptionsForICIRecord._({this.optionsNames, this.inCartItem, this.ffRef})
      : super._();

  @override
  OptionsForICIRecord rebuild(
          void Function(OptionsForICIRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OptionsForICIRecordBuilder toBuilder() =>
      new OptionsForICIRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OptionsForICIRecord &&
        optionsNames == other.optionsNames &&
        inCartItem == other.inCartItem &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, optionsNames.hashCode), inCartItem.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OptionsForICIRecord')
          ..add('optionsNames', optionsNames)
          ..add('inCartItem', inCartItem)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class OptionsForICIRecordBuilder
    implements Builder<OptionsForICIRecord, OptionsForICIRecordBuilder> {
  _$OptionsForICIRecord? _$v;

  ListBuilder<String>? _optionsNames;
  ListBuilder<String> get optionsNames =>
      _$this._optionsNames ??= new ListBuilder<String>();
  set optionsNames(ListBuilder<String>? optionsNames) =>
      _$this._optionsNames = optionsNames;

  DocumentReference<Object?>? _inCartItem;
  DocumentReference<Object?>? get inCartItem => _$this._inCartItem;
  set inCartItem(DocumentReference<Object?>? inCartItem) =>
      _$this._inCartItem = inCartItem;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  OptionsForICIRecordBuilder() {
    OptionsForICIRecord._initializeBuilder(this);
  }

  OptionsForICIRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _optionsNames = $v.optionsNames?.toBuilder();
      _inCartItem = $v.inCartItem;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OptionsForICIRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OptionsForICIRecord;
  }

  @override
  void update(void Function(OptionsForICIRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OptionsForICIRecord build() => _build();

  _$OptionsForICIRecord _build() {
    _$OptionsForICIRecord _$result;
    try {
      _$result = _$v ??
          new _$OptionsForICIRecord._(
              optionsNames: _optionsNames?.build(),
              inCartItem: inCartItem,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'optionsNames';
        _optionsNames?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OptionsForICIRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

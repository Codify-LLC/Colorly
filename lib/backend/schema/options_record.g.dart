// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'options_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OptionsRecord> _$optionsRecordSerializer =
    new _$OptionsRecordSerializer();

class _$OptionsRecordSerializer implements StructuredSerializer<OptionsRecord> {
  @override
  final Iterable<Type> types = const [OptionsRecord, _$OptionsRecord];
  @override
  final String wireName = 'OptionsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, OptionsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.optionName;
    if (value != null) {
      result
        ..add('optionName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.optionPrice;
    if (value != null) {
      result
        ..add('optionPrice')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
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
  OptionsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OptionsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'optionName':
          result.optionName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'optionPrice':
          result.optionPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
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

class _$OptionsRecord extends OptionsRecord {
  @override
  final String? optionName;
  @override
  final double? optionPrice;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$OptionsRecord([void Function(OptionsRecordBuilder)? updates]) =>
      (new OptionsRecordBuilder()..update(updates))._build();

  _$OptionsRecord._({this.optionName, this.optionPrice, this.ffRef})
      : super._();

  @override
  OptionsRecord rebuild(void Function(OptionsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OptionsRecordBuilder toBuilder() => new OptionsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OptionsRecord &&
        optionName == other.optionName &&
        optionPrice == other.optionPrice &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, optionName.hashCode), optionPrice.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OptionsRecord')
          ..add('optionName', optionName)
          ..add('optionPrice', optionPrice)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class OptionsRecordBuilder
    implements Builder<OptionsRecord, OptionsRecordBuilder> {
  _$OptionsRecord? _$v;

  String? _optionName;
  String? get optionName => _$this._optionName;
  set optionName(String? optionName) => _$this._optionName = optionName;

  double? _optionPrice;
  double? get optionPrice => _$this._optionPrice;
  set optionPrice(double? optionPrice) => _$this._optionPrice = optionPrice;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  OptionsRecordBuilder() {
    OptionsRecord._initializeBuilder(this);
  }

  OptionsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _optionName = $v.optionName;
      _optionPrice = $v.optionPrice;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OptionsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OptionsRecord;
  }

  @override
  void update(void Function(OptionsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OptionsRecord build() => _build();

  _$OptionsRecord _build() {
    final _$result = _$v ??
        new _$OptionsRecord._(
            optionName: optionName, optionPrice: optionPrice, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

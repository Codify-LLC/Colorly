// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_bags_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CompletedBagsRecord> _$completedBagsRecordSerializer =
    new _$CompletedBagsRecordSerializer();

class _$CompletedBagsRecordSerializer
    implements StructuredSerializer<CompletedBagsRecord> {
  @override
  final Iterable<Type> types = const [
    CompletedBagsRecord,
    _$CompletedBagsRecord
  ];
  @override
  final String wireName = 'CompletedBagsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CompletedBagsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.orderItems;
    if (value != null) {
      result
        ..add('orderItems')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.bagNumber;
    if (value != null) {
      result
        ..add('bagNumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.complete;
    if (value != null) {
      result
        ..add('complete')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  CompletedBagsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompletedBagsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'orderItems':
          result.orderItems.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'bagNumber':
          result.bagNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'complete':
          result.complete = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$CompletedBagsRecord extends CompletedBagsRecord {
  @override
  final BuiltList<DocumentReference<Object?>>? orderItems;
  @override
  final String? bagNumber;
  @override
  final bool? complete;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CompletedBagsRecord(
          [void Function(CompletedBagsRecordBuilder)? updates]) =>
      (new CompletedBagsRecordBuilder()..update(updates))._build();

  _$CompletedBagsRecord._(
      {this.orderItems, this.bagNumber, this.complete, this.ffRef})
      : super._();

  @override
  CompletedBagsRecord rebuild(
          void Function(CompletedBagsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompletedBagsRecordBuilder toBuilder() =>
      new CompletedBagsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompletedBagsRecord &&
        orderItems == other.orderItems &&
        bagNumber == other.bagNumber &&
        complete == other.complete &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, orderItems.hashCode), bagNumber.hashCode),
            complete.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CompletedBagsRecord')
          ..add('orderItems', orderItems)
          ..add('bagNumber', bagNumber)
          ..add('complete', complete)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CompletedBagsRecordBuilder
    implements Builder<CompletedBagsRecord, CompletedBagsRecordBuilder> {
  _$CompletedBagsRecord? _$v;

  ListBuilder<DocumentReference<Object?>>? _orderItems;
  ListBuilder<DocumentReference<Object?>> get orderItems =>
      _$this._orderItems ??= new ListBuilder<DocumentReference<Object?>>();
  set orderItems(ListBuilder<DocumentReference<Object?>>? orderItems) =>
      _$this._orderItems = orderItems;

  String? _bagNumber;
  String? get bagNumber => _$this._bagNumber;
  set bagNumber(String? bagNumber) => _$this._bagNumber = bagNumber;

  bool? _complete;
  bool? get complete => _$this._complete;
  set complete(bool? complete) => _$this._complete = complete;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CompletedBagsRecordBuilder() {
    CompletedBagsRecord._initializeBuilder(this);
  }

  CompletedBagsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _orderItems = $v.orderItems?.toBuilder();
      _bagNumber = $v.bagNumber;
      _complete = $v.complete;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompletedBagsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CompletedBagsRecord;
  }

  @override
  void update(void Function(CompletedBagsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CompletedBagsRecord build() => _build();

  _$CompletedBagsRecord _build() {
    _$CompletedBagsRecord _$result;
    try {
      _$result = _$v ??
          new _$CompletedBagsRecord._(
              orderItems: _orderItems?.build(),
              bagNumber: bagNumber,
              complete: complete,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'orderItems';
        _orderItems?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CompletedBagsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

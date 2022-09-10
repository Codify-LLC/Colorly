// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_bag_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ShoppingBagRecord> _$shoppingBagRecordSerializer =
    new _$ShoppingBagRecordSerializer();

class _$ShoppingBagRecordSerializer
    implements StructuredSerializer<ShoppingBagRecord> {
  @override
  final Iterable<Type> types = const [ShoppingBagRecord, _$ShoppingBagRecord];
  @override
  final String wireName = 'ShoppingBagRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ShoppingBagRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.created;
    if (value != null) {
      result
        ..add('created')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.inCartItemsRef;
    if (value != null) {
      result
        ..add('inCartItemsRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.paid;
    if (value != null) {
      result
        ..add('paid')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.delivery;
    if (value != null) {
      result
        ..add('delivery')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.orderNumber;
    if (value != null) {
      result
        ..add('orderNumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.orderTotal;
    if (value != null) {
      result
        ..add('orderTotal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.restaurantRef;
    if (value != null) {
      result
        ..add('restaurantRef')
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
  ShoppingBagRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ShoppingBagRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'created':
          result.created = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'inCartItemsRef':
          result.inCartItemsRef.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'paid':
          result.paid = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'delivery':
          result.delivery = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'orderNumber':
          result.orderNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'orderTotal':
          result.orderTotal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'restaurantRef':
          result.restaurantRef = serializers.deserialize(value,
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

class _$ShoppingBagRecord extends ShoppingBagRecord {
  @override
  final DateTime? created;
  @override
  final BuiltList<DocumentReference<Object?>>? inCartItemsRef;
  @override
  final DocumentReference<Object?>? user;
  @override
  final bool? paid;
  @override
  final bool? delivery;
  @override
  final String? orderNumber;
  @override
  final double? orderTotal;
  @override
  final DocumentReference<Object?>? restaurantRef;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ShoppingBagRecord(
          [void Function(ShoppingBagRecordBuilder)? updates]) =>
      (new ShoppingBagRecordBuilder()..update(updates))._build();

  _$ShoppingBagRecord._(
      {this.created,
      this.inCartItemsRef,
      this.user,
      this.paid,
      this.delivery,
      this.orderNumber,
      this.orderTotal,
      this.restaurantRef,
      this.ffRef})
      : super._();

  @override
  ShoppingBagRecord rebuild(void Function(ShoppingBagRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShoppingBagRecordBuilder toBuilder() =>
      new ShoppingBagRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShoppingBagRecord &&
        created == other.created &&
        inCartItemsRef == other.inCartItemsRef &&
        user == other.user &&
        paid == other.paid &&
        delivery == other.delivery &&
        orderNumber == other.orderNumber &&
        orderTotal == other.orderTotal &&
        restaurantRef == other.restaurantRef &&
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
                                $jc($jc(0, created.hashCode),
                                    inCartItemsRef.hashCode),
                                user.hashCode),
                            paid.hashCode),
                        delivery.hashCode),
                    orderNumber.hashCode),
                orderTotal.hashCode),
            restaurantRef.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ShoppingBagRecord')
          ..add('created', created)
          ..add('inCartItemsRef', inCartItemsRef)
          ..add('user', user)
          ..add('paid', paid)
          ..add('delivery', delivery)
          ..add('orderNumber', orderNumber)
          ..add('orderTotal', orderTotal)
          ..add('restaurantRef', restaurantRef)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ShoppingBagRecordBuilder
    implements Builder<ShoppingBagRecord, ShoppingBagRecordBuilder> {
  _$ShoppingBagRecord? _$v;

  DateTime? _created;
  DateTime? get created => _$this._created;
  set created(DateTime? created) => _$this._created = created;

  ListBuilder<DocumentReference<Object?>>? _inCartItemsRef;
  ListBuilder<DocumentReference<Object?>> get inCartItemsRef =>
      _$this._inCartItemsRef ??= new ListBuilder<DocumentReference<Object?>>();
  set inCartItemsRef(ListBuilder<DocumentReference<Object?>>? inCartItemsRef) =>
      _$this._inCartItemsRef = inCartItemsRef;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  bool? _paid;
  bool? get paid => _$this._paid;
  set paid(bool? paid) => _$this._paid = paid;

  bool? _delivery;
  bool? get delivery => _$this._delivery;
  set delivery(bool? delivery) => _$this._delivery = delivery;

  String? _orderNumber;
  String? get orderNumber => _$this._orderNumber;
  set orderNumber(String? orderNumber) => _$this._orderNumber = orderNumber;

  double? _orderTotal;
  double? get orderTotal => _$this._orderTotal;
  set orderTotal(double? orderTotal) => _$this._orderTotal = orderTotal;

  DocumentReference<Object?>? _restaurantRef;
  DocumentReference<Object?>? get restaurantRef => _$this._restaurantRef;
  set restaurantRef(DocumentReference<Object?>? restaurantRef) =>
      _$this._restaurantRef = restaurantRef;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ShoppingBagRecordBuilder() {
    ShoppingBagRecord._initializeBuilder(this);
  }

  ShoppingBagRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _created = $v.created;
      _inCartItemsRef = $v.inCartItemsRef?.toBuilder();
      _user = $v.user;
      _paid = $v.paid;
      _delivery = $v.delivery;
      _orderNumber = $v.orderNumber;
      _orderTotal = $v.orderTotal;
      _restaurantRef = $v.restaurantRef;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShoppingBagRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ShoppingBagRecord;
  }

  @override
  void update(void Function(ShoppingBagRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShoppingBagRecord build() => _build();

  _$ShoppingBagRecord _build() {
    _$ShoppingBagRecord _$result;
    try {
      _$result = _$v ??
          new _$ShoppingBagRecord._(
              created: created,
              inCartItemsRef: _inCartItemsRef?.build(),
              user: user,
              paid: paid,
              delivery: delivery,
              orderNumber: orderNumber,
              orderTotal: orderTotal,
              restaurantRef: restaurantRef,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'inCartItemsRef';
        _inCartItemsRef?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ShoppingBagRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

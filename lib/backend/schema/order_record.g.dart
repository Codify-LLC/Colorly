// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrderRecord> _$orderRecordSerializer = new _$OrderRecordSerializer();

class _$OrderRecordSerializer implements StructuredSerializer<OrderRecord> {
  @override
  final Iterable<Type> types = const [OrderRecord, _$OrderRecord];
  @override
  final String wireName = 'OrderRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, OrderRecord object,
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
    value = object.restaurant;
    if (value != null) {
      result
        ..add('restaurant')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.orderNumber;
    if (value != null) {
      result
        ..add('orderNumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
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
    value = object.paid;
    if (value != null) {
      result
        ..add('paid')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.inCartItems;
    if (value != null) {
      result
        ..add('inCartItems')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.orderTotal;
    if (value != null) {
      result
        ..add('orderTotal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.submitted;
    if (value != null) {
      result
        ..add('submitted')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.confirmed;
    if (value != null) {
      result
        ..add('confirmed')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.preparing;
    if (value != null) {
      result
        ..add('preparing')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.ready;
    if (value != null) {
      result
        ..add('ready')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.timestamp;
    if (value != null) {
      result
        ..add('timestamp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.shoppingBag;
    if (value != null) {
      result
        ..add('shoppingBag')
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
  OrderRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrderRecordBuilder();

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
        case 'restaurant':
          result.restaurant = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'orderNumber':
          result.orderNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'orderItems':
          result.orderItems.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'paid':
          result.paid = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'inCartItems':
          result.inCartItems.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'orderTotal':
          result.orderTotal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'submitted':
          result.submitted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'confirmed':
          result.confirmed = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'preparing':
          result.preparing = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'ready':
          result.ready = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'shoppingBag':
          result.shoppingBag = serializers.deserialize(value,
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

class _$OrderRecord extends OrderRecord {
  @override
  final DocumentReference<Object?>? user;
  @override
  final DocumentReference<Object?>? restaurant;
  @override
  final String? orderNumber;
  @override
  final BuiltList<DocumentReference<Object?>>? orderItems;
  @override
  final bool? paid;
  @override
  final BuiltList<DocumentReference<Object?>>? inCartItems;
  @override
  final double? orderTotal;
  @override
  final String? type;
  @override
  final bool? submitted;
  @override
  final bool? confirmed;
  @override
  final bool? preparing;
  @override
  final bool? ready;
  @override
  final DateTime? timestamp;
  @override
  final DocumentReference<Object?>? shoppingBag;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$OrderRecord([void Function(OrderRecordBuilder)? updates]) =>
      (new OrderRecordBuilder()..update(updates))._build();

  _$OrderRecord._(
      {this.user,
      this.restaurant,
      this.orderNumber,
      this.orderItems,
      this.paid,
      this.inCartItems,
      this.orderTotal,
      this.type,
      this.submitted,
      this.confirmed,
      this.preparing,
      this.ready,
      this.timestamp,
      this.shoppingBag,
      this.ffRef})
      : super._();

  @override
  OrderRecord rebuild(void Function(OrderRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderRecordBuilder toBuilder() => new OrderRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderRecord &&
        user == other.user &&
        restaurant == other.restaurant &&
        orderNumber == other.orderNumber &&
        orderItems == other.orderItems &&
        paid == other.paid &&
        inCartItems == other.inCartItems &&
        orderTotal == other.orderTotal &&
        type == other.type &&
        submitted == other.submitted &&
        confirmed == other.confirmed &&
        preparing == other.preparing &&
        ready == other.ready &&
        timestamp == other.timestamp &&
        shoppingBag == other.shoppingBag &&
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
                                                            $jc(0,
                                                                user.hashCode),
                                                            restaurant
                                                                .hashCode),
                                                        orderNumber.hashCode),
                                                    orderItems.hashCode),
                                                paid.hashCode),
                                            inCartItems.hashCode),
                                        orderTotal.hashCode),
                                    type.hashCode),
                                submitted.hashCode),
                            confirmed.hashCode),
                        preparing.hashCode),
                    ready.hashCode),
                timestamp.hashCode),
            shoppingBag.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrderRecord')
          ..add('user', user)
          ..add('restaurant', restaurant)
          ..add('orderNumber', orderNumber)
          ..add('orderItems', orderItems)
          ..add('paid', paid)
          ..add('inCartItems', inCartItems)
          ..add('orderTotal', orderTotal)
          ..add('type', type)
          ..add('submitted', submitted)
          ..add('confirmed', confirmed)
          ..add('preparing', preparing)
          ..add('ready', ready)
          ..add('timestamp', timestamp)
          ..add('shoppingBag', shoppingBag)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class OrderRecordBuilder implements Builder<OrderRecord, OrderRecordBuilder> {
  _$OrderRecord? _$v;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  DocumentReference<Object?>? _restaurant;
  DocumentReference<Object?>? get restaurant => _$this._restaurant;
  set restaurant(DocumentReference<Object?>? restaurant) =>
      _$this._restaurant = restaurant;

  String? _orderNumber;
  String? get orderNumber => _$this._orderNumber;
  set orderNumber(String? orderNumber) => _$this._orderNumber = orderNumber;

  ListBuilder<DocumentReference<Object?>>? _orderItems;
  ListBuilder<DocumentReference<Object?>> get orderItems =>
      _$this._orderItems ??= new ListBuilder<DocumentReference<Object?>>();
  set orderItems(ListBuilder<DocumentReference<Object?>>? orderItems) =>
      _$this._orderItems = orderItems;

  bool? _paid;
  bool? get paid => _$this._paid;
  set paid(bool? paid) => _$this._paid = paid;

  ListBuilder<DocumentReference<Object?>>? _inCartItems;
  ListBuilder<DocumentReference<Object?>> get inCartItems =>
      _$this._inCartItems ??= new ListBuilder<DocumentReference<Object?>>();
  set inCartItems(ListBuilder<DocumentReference<Object?>>? inCartItems) =>
      _$this._inCartItems = inCartItems;

  double? _orderTotal;
  double? get orderTotal => _$this._orderTotal;
  set orderTotal(double? orderTotal) => _$this._orderTotal = orderTotal;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  bool? _submitted;
  bool? get submitted => _$this._submitted;
  set submitted(bool? submitted) => _$this._submitted = submitted;

  bool? _confirmed;
  bool? get confirmed => _$this._confirmed;
  set confirmed(bool? confirmed) => _$this._confirmed = confirmed;

  bool? _preparing;
  bool? get preparing => _$this._preparing;
  set preparing(bool? preparing) => _$this._preparing = preparing;

  bool? _ready;
  bool? get ready => _$this._ready;
  set ready(bool? ready) => _$this._ready = ready;

  DateTime? _timestamp;
  DateTime? get timestamp => _$this._timestamp;
  set timestamp(DateTime? timestamp) => _$this._timestamp = timestamp;

  DocumentReference<Object?>? _shoppingBag;
  DocumentReference<Object?>? get shoppingBag => _$this._shoppingBag;
  set shoppingBag(DocumentReference<Object?>? shoppingBag) =>
      _$this._shoppingBag = shoppingBag;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  OrderRecordBuilder() {
    OrderRecord._initializeBuilder(this);
  }

  OrderRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user;
      _restaurant = $v.restaurant;
      _orderNumber = $v.orderNumber;
      _orderItems = $v.orderItems?.toBuilder();
      _paid = $v.paid;
      _inCartItems = $v.inCartItems?.toBuilder();
      _orderTotal = $v.orderTotal;
      _type = $v.type;
      _submitted = $v.submitted;
      _confirmed = $v.confirmed;
      _preparing = $v.preparing;
      _ready = $v.ready;
      _timestamp = $v.timestamp;
      _shoppingBag = $v.shoppingBag;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrderRecord;
  }

  @override
  void update(void Function(OrderRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrderRecord build() => _build();

  _$OrderRecord _build() {
    _$OrderRecord _$result;
    try {
      _$result = _$v ??
          new _$OrderRecord._(
              user: user,
              restaurant: restaurant,
              orderNumber: orderNumber,
              orderItems: _orderItems?.build(),
              paid: paid,
              inCartItems: _inCartItems?.build(),
              orderTotal: orderTotal,
              type: type,
              submitted: submitted,
              confirmed: confirmed,
              preparing: preparing,
              ready: ready,
              timestamp: timestamp,
              shoppingBag: shoppingBag,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'orderItems';
        _orderItems?.build();

        _$failedField = 'inCartItems';
        _inCartItems?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OrderRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

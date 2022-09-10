// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_cart_item_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InCartItemRecord> _$inCartItemRecordSerializer =
    new _$InCartItemRecordSerializer();

class _$InCartItemRecordSerializer
    implements StructuredSerializer<InCartItemRecord> {
  @override
  final Iterable<Type> types = const [InCartItemRecord, _$InCartItemRecord];
  @override
  final String wireName = 'InCartItemRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, InCartItemRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.menuItem;
    if (value != null) {
      result
        ..add('menuItem')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.quantity;
    if (value != null) {
      result
        ..add('quantity')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.specialNote;
    if (value != null) {
      result
        ..add('specialNote')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.timeAdded;
    if (value != null) {
      result
        ..add('timeAdded')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.options;
    if (value != null) {
      result
        ..add('options')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(bool)])));
    }
    value = object.option1;
    if (value != null) {
      result
        ..add('option1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.optionsNames;
    if (value != null) {
      result
        ..add('optionsNames')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.bag;
    if (value != null) {
      result
        ..add('bag')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.active;
    if (value != null) {
      result
        ..add('active')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.restaurantRef;
    if (value != null) {
      result
        ..add('restaurantRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  InCartItemRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InCartItemRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'menuItem':
          result.menuItem = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'quantity':
          result.quantity = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'specialNote':
          result.specialNote = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'timeAdded':
          result.timeAdded = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'options':
          result.options.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(bool)]))!
              as BuiltList<Object?>);
          break;
        case 'option1':
          result.option1.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'optionsNames':
          result.optionsNames.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'bag':
          result.bag = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'active':
          result.active = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'restaurantRef':
          result.restaurantRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$InCartItemRecord extends InCartItemRecord {
  @override
  final DocumentReference<Object?>? menuItem;
  @override
  final double? price;
  @override
  final double? quantity;
  @override
  final DocumentReference<Object?>? user;
  @override
  final String? specialNote;
  @override
  final DateTime? timeAdded;
  @override
  final BuiltList<bool>? options;
  @override
  final BuiltList<DocumentReference<Object?>>? option1;
  @override
  final BuiltList<String>? optionsNames;
  @override
  final DocumentReference<Object?>? bag;
  @override
  final bool? active;
  @override
  final DocumentReference<Object?>? restaurantRef;
  @override
  final DocumentReference<Object?>? shoppingBag;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$InCartItemRecord(
          [void Function(InCartItemRecordBuilder)? updates]) =>
      (new InCartItemRecordBuilder()..update(updates))._build();

  _$InCartItemRecord._(
      {this.menuItem,
      this.price,
      this.quantity,
      this.user,
      this.specialNote,
      this.timeAdded,
      this.options,
      this.option1,
      this.optionsNames,
      this.bag,
      this.active,
      this.restaurantRef,
      this.shoppingBag,
      this.ffRef})
      : super._();

  @override
  InCartItemRecord rebuild(void Function(InCartItemRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InCartItemRecordBuilder toBuilder() =>
      new InCartItemRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InCartItemRecord &&
        menuItem == other.menuItem &&
        price == other.price &&
        quantity == other.quantity &&
        user == other.user &&
        specialNote == other.specialNote &&
        timeAdded == other.timeAdded &&
        options == other.options &&
        option1 == other.option1 &&
        optionsNames == other.optionsNames &&
        bag == other.bag &&
        active == other.active &&
        restaurantRef == other.restaurantRef &&
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
                                                        $jc(0,
                                                            menuItem.hashCode),
                                                        price.hashCode),
                                                    quantity.hashCode),
                                                user.hashCode),
                                            specialNote.hashCode),
                                        timeAdded.hashCode),
                                    options.hashCode),
                                option1.hashCode),
                            optionsNames.hashCode),
                        bag.hashCode),
                    active.hashCode),
                restaurantRef.hashCode),
            shoppingBag.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InCartItemRecord')
          ..add('menuItem', menuItem)
          ..add('price', price)
          ..add('quantity', quantity)
          ..add('user', user)
          ..add('specialNote', specialNote)
          ..add('timeAdded', timeAdded)
          ..add('options', options)
          ..add('option1', option1)
          ..add('optionsNames', optionsNames)
          ..add('bag', bag)
          ..add('active', active)
          ..add('restaurantRef', restaurantRef)
          ..add('shoppingBag', shoppingBag)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class InCartItemRecordBuilder
    implements Builder<InCartItemRecord, InCartItemRecordBuilder> {
  _$InCartItemRecord? _$v;

  DocumentReference<Object?>? _menuItem;
  DocumentReference<Object?>? get menuItem => _$this._menuItem;
  set menuItem(DocumentReference<Object?>? menuItem) =>
      _$this._menuItem = menuItem;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  double? _quantity;
  double? get quantity => _$this._quantity;
  set quantity(double? quantity) => _$this._quantity = quantity;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  String? _specialNote;
  String? get specialNote => _$this._specialNote;
  set specialNote(String? specialNote) => _$this._specialNote = specialNote;

  DateTime? _timeAdded;
  DateTime? get timeAdded => _$this._timeAdded;
  set timeAdded(DateTime? timeAdded) => _$this._timeAdded = timeAdded;

  ListBuilder<bool>? _options;
  ListBuilder<bool> get options => _$this._options ??= new ListBuilder<bool>();
  set options(ListBuilder<bool>? options) => _$this._options = options;

  ListBuilder<DocumentReference<Object?>>? _option1;
  ListBuilder<DocumentReference<Object?>> get option1 =>
      _$this._option1 ??= new ListBuilder<DocumentReference<Object?>>();
  set option1(ListBuilder<DocumentReference<Object?>>? option1) =>
      _$this._option1 = option1;

  ListBuilder<String>? _optionsNames;
  ListBuilder<String> get optionsNames =>
      _$this._optionsNames ??= new ListBuilder<String>();
  set optionsNames(ListBuilder<String>? optionsNames) =>
      _$this._optionsNames = optionsNames;

  DocumentReference<Object?>? _bag;
  DocumentReference<Object?>? get bag => _$this._bag;
  set bag(DocumentReference<Object?>? bag) => _$this._bag = bag;

  bool? _active;
  bool? get active => _$this._active;
  set active(bool? active) => _$this._active = active;

  DocumentReference<Object?>? _restaurantRef;
  DocumentReference<Object?>? get restaurantRef => _$this._restaurantRef;
  set restaurantRef(DocumentReference<Object?>? restaurantRef) =>
      _$this._restaurantRef = restaurantRef;

  DocumentReference<Object?>? _shoppingBag;
  DocumentReference<Object?>? get shoppingBag => _$this._shoppingBag;
  set shoppingBag(DocumentReference<Object?>? shoppingBag) =>
      _$this._shoppingBag = shoppingBag;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  InCartItemRecordBuilder() {
    InCartItemRecord._initializeBuilder(this);
  }

  InCartItemRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _menuItem = $v.menuItem;
      _price = $v.price;
      _quantity = $v.quantity;
      _user = $v.user;
      _specialNote = $v.specialNote;
      _timeAdded = $v.timeAdded;
      _options = $v.options?.toBuilder();
      _option1 = $v.option1?.toBuilder();
      _optionsNames = $v.optionsNames?.toBuilder();
      _bag = $v.bag;
      _active = $v.active;
      _restaurantRef = $v.restaurantRef;
      _shoppingBag = $v.shoppingBag;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InCartItemRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InCartItemRecord;
  }

  @override
  void update(void Function(InCartItemRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InCartItemRecord build() => _build();

  _$InCartItemRecord _build() {
    _$InCartItemRecord _$result;
    try {
      _$result = _$v ??
          new _$InCartItemRecord._(
              menuItem: menuItem,
              price: price,
              quantity: quantity,
              user: user,
              specialNote: specialNote,
              timeAdded: timeAdded,
              options: _options?.build(),
              option1: _option1?.build(),
              optionsNames: _optionsNames?.build(),
              bag: bag,
              active: active,
              restaurantRef: restaurantRef,
              shoppingBag: shoppingBag,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'options';
        _options?.build();
        _$failedField = 'option1';
        _option1?.build();
        _$failedField = 'optionsNames';
        _optionsNames?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'InCartItemRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

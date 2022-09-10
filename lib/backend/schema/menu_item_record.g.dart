// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MenuItemRecord> _$menuItemRecordSerializer =
    new _$MenuItemRecordSerializer();

class _$MenuItemRecordSerializer
    implements StructuredSerializer<MenuItemRecord> {
  @override
  final Iterable<Type> types = const [MenuItemRecord, _$MenuItemRecord];
  @override
  final String wireName = 'MenuItemRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, MenuItemRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.itemName;
    if (value != null) {
      result
        ..add('itemName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.itemDescription;
    if (value != null) {
      result
        ..add('itemDescription')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.itemImage;
    if (value != null) {
      result
        ..add('itemImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.restRef;
    if (value != null) {
      result
        ..add('restRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('userRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('createdAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.courseRef;
    if (value != null) {
      result
        ..add('courseRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.itemPrice;
    if (value != null) {
      result
        ..add('itemPrice')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.featuredItem;
    if (value != null) {
      result
        ..add('featuredItem')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.number;
    if (value != null) {
      result
        ..add('number')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.modifiers;
    if (value != null) {
      result
        ..add('modifiers')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.modifier;
    if (value != null) {
      result
        ..add('modifier')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.options;
    if (value != null) {
      result
        ..add('options')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.optionStrings;
    if (value != null) {
      result
        ..add('optionStrings')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.option1;
    if (value != null) {
      result
        ..add('option1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.hasOption1;
    if (value != null) {
      result
        ..add('hasOption1')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.hasOption2;
    if (value != null) {
      result
        ..add('hasOption2')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.hasOption3;
    if (value != null) {
      result
        ..add('hasOption3')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.hasOption4;
    if (value != null) {
      result
        ..add('hasOption4')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.hasOption5;
    if (value != null) {
      result
        ..add('hasOption5')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.options1;
    if (value != null) {
      result
        ..add('options1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.uploadedPhotos;
    if (value != null) {
      result
        ..add('uploadedPhotos')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  MenuItemRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MenuItemRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'itemName':
          result.itemName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'itemDescription':
          result.itemDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'itemImage':
          result.itemImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'restRef':
          result.restRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'userRef':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'courseRef':
          result.courseRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'itemPrice':
          result.itemPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'featuredItem':
          result.featuredItem = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'number':
          result.number = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'modifiers':
          result.modifiers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'modifier':
          result.modifier.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'options':
          result.options.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'optionStrings':
          result.optionStrings.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'option1':
          result.option1 = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'hasOption1':
          result.hasOption1 = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'hasOption2':
          result.hasOption2 = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'hasOption3':
          result.hasOption3 = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'hasOption4':
          result.hasOption4 = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'hasOption5':
          result.hasOption5 = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'options1':
          result.options1.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'uploadedPhotos':
          result.uploadedPhotos.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
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

class _$MenuItemRecord extends MenuItemRecord {
  @override
  final String? itemName;
  @override
  final String? itemDescription;
  @override
  final String? itemImage;
  @override
  final DocumentReference<Object?>? restRef;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final DateTime? createdAt;
  @override
  final DocumentReference<Object?>? courseRef;
  @override
  final double? itemPrice;
  @override
  final bool? featuredItem;
  @override
  final int? number;
  @override
  final BuiltList<DocumentReference<Object?>>? modifiers;
  @override
  final BuiltList<String>? modifier;
  @override
  final BuiltList<DocumentReference<Object?>>? options;
  @override
  final BuiltList<String>? optionStrings;
  @override
  final DocumentReference<Object?>? option1;
  @override
  final bool? hasOption1;
  @override
  final bool? hasOption2;
  @override
  final bool? hasOption3;
  @override
  final bool? hasOption4;
  @override
  final bool? hasOption5;
  @override
  final BuiltList<DocumentReference<Object?>>? options1;
  @override
  final BuiltList<String>? uploadedPhotos;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MenuItemRecord([void Function(MenuItemRecordBuilder)? updates]) =>
      (new MenuItemRecordBuilder()..update(updates))._build();

  _$MenuItemRecord._(
      {this.itemName,
      this.itemDescription,
      this.itemImage,
      this.restRef,
      this.userRef,
      this.createdAt,
      this.courseRef,
      this.itemPrice,
      this.featuredItem,
      this.number,
      this.modifiers,
      this.modifier,
      this.options,
      this.optionStrings,
      this.option1,
      this.hasOption1,
      this.hasOption2,
      this.hasOption3,
      this.hasOption4,
      this.hasOption5,
      this.options1,
      this.uploadedPhotos,
      this.ffRef})
      : super._();

  @override
  MenuItemRecord rebuild(void Function(MenuItemRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MenuItemRecordBuilder toBuilder() =>
      new MenuItemRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MenuItemRecord &&
        itemName == other.itemName &&
        itemDescription == other.itemDescription &&
        itemImage == other.itemImage &&
        restRef == other.restRef &&
        userRef == other.userRef &&
        createdAt == other.createdAt &&
        courseRef == other.courseRef &&
        itemPrice == other.itemPrice &&
        featuredItem == other.featuredItem &&
        number == other.number &&
        modifiers == other.modifiers &&
        modifier == other.modifier &&
        options == other.options &&
        optionStrings == other.optionStrings &&
        option1 == other.option1 &&
        hasOption1 == other.hasOption1 &&
        hasOption2 == other.hasOption2 &&
        hasOption3 == other.hasOption3 &&
        hasOption4 == other.hasOption4 &&
        hasOption5 == other.hasOption5 &&
        options1 == other.options1 &&
        uploadedPhotos == other.uploadedPhotos &&
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
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc(0, itemName.hashCode), itemDescription.hashCode), itemImage.hashCode), restRef.hashCode),
                                                                                userRef.hashCode),
                                                                            createdAt.hashCode),
                                                                        courseRef.hashCode),
                                                                    itemPrice.hashCode),
                                                                featuredItem.hashCode),
                                                            number.hashCode),
                                                        modifiers.hashCode),
                                                    modifier.hashCode),
                                                options.hashCode),
                                            optionStrings.hashCode),
                                        option1.hashCode),
                                    hasOption1.hashCode),
                                hasOption2.hashCode),
                            hasOption3.hashCode),
                        hasOption4.hashCode),
                    hasOption5.hashCode),
                options1.hashCode),
            uploadedPhotos.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MenuItemRecord')
          ..add('itemName', itemName)
          ..add('itemDescription', itemDescription)
          ..add('itemImage', itemImage)
          ..add('restRef', restRef)
          ..add('userRef', userRef)
          ..add('createdAt', createdAt)
          ..add('courseRef', courseRef)
          ..add('itemPrice', itemPrice)
          ..add('featuredItem', featuredItem)
          ..add('number', number)
          ..add('modifiers', modifiers)
          ..add('modifier', modifier)
          ..add('options', options)
          ..add('optionStrings', optionStrings)
          ..add('option1', option1)
          ..add('hasOption1', hasOption1)
          ..add('hasOption2', hasOption2)
          ..add('hasOption3', hasOption3)
          ..add('hasOption4', hasOption4)
          ..add('hasOption5', hasOption5)
          ..add('options1', options1)
          ..add('uploadedPhotos', uploadedPhotos)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MenuItemRecordBuilder
    implements Builder<MenuItemRecord, MenuItemRecordBuilder> {
  _$MenuItemRecord? _$v;

  String? _itemName;
  String? get itemName => _$this._itemName;
  set itemName(String? itemName) => _$this._itemName = itemName;

  String? _itemDescription;
  String? get itemDescription => _$this._itemDescription;
  set itemDescription(String? itemDescription) =>
      _$this._itemDescription = itemDescription;

  String? _itemImage;
  String? get itemImage => _$this._itemImage;
  set itemImage(String? itemImage) => _$this._itemImage = itemImage;

  DocumentReference<Object?>? _restRef;
  DocumentReference<Object?>? get restRef => _$this._restRef;
  set restRef(DocumentReference<Object?>? restRef) => _$this._restRef = restRef;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DocumentReference<Object?>? _courseRef;
  DocumentReference<Object?>? get courseRef => _$this._courseRef;
  set courseRef(DocumentReference<Object?>? courseRef) =>
      _$this._courseRef = courseRef;

  double? _itemPrice;
  double? get itemPrice => _$this._itemPrice;
  set itemPrice(double? itemPrice) => _$this._itemPrice = itemPrice;

  bool? _featuredItem;
  bool? get featuredItem => _$this._featuredItem;
  set featuredItem(bool? featuredItem) => _$this._featuredItem = featuredItem;

  int? _number;
  int? get number => _$this._number;
  set number(int? number) => _$this._number = number;

  ListBuilder<DocumentReference<Object?>>? _modifiers;
  ListBuilder<DocumentReference<Object?>> get modifiers =>
      _$this._modifiers ??= new ListBuilder<DocumentReference<Object?>>();
  set modifiers(ListBuilder<DocumentReference<Object?>>? modifiers) =>
      _$this._modifiers = modifiers;

  ListBuilder<String>? _modifier;
  ListBuilder<String> get modifier =>
      _$this._modifier ??= new ListBuilder<String>();
  set modifier(ListBuilder<String>? modifier) => _$this._modifier = modifier;

  ListBuilder<DocumentReference<Object?>>? _options;
  ListBuilder<DocumentReference<Object?>> get options =>
      _$this._options ??= new ListBuilder<DocumentReference<Object?>>();
  set options(ListBuilder<DocumentReference<Object?>>? options) =>
      _$this._options = options;

  ListBuilder<String>? _optionStrings;
  ListBuilder<String> get optionStrings =>
      _$this._optionStrings ??= new ListBuilder<String>();
  set optionStrings(ListBuilder<String>? optionStrings) =>
      _$this._optionStrings = optionStrings;

  DocumentReference<Object?>? _option1;
  DocumentReference<Object?>? get option1 => _$this._option1;
  set option1(DocumentReference<Object?>? option1) => _$this._option1 = option1;

  bool? _hasOption1;
  bool? get hasOption1 => _$this._hasOption1;
  set hasOption1(bool? hasOption1) => _$this._hasOption1 = hasOption1;

  bool? _hasOption2;
  bool? get hasOption2 => _$this._hasOption2;
  set hasOption2(bool? hasOption2) => _$this._hasOption2 = hasOption2;

  bool? _hasOption3;
  bool? get hasOption3 => _$this._hasOption3;
  set hasOption3(bool? hasOption3) => _$this._hasOption3 = hasOption3;

  bool? _hasOption4;
  bool? get hasOption4 => _$this._hasOption4;
  set hasOption4(bool? hasOption4) => _$this._hasOption4 = hasOption4;

  bool? _hasOption5;
  bool? get hasOption5 => _$this._hasOption5;
  set hasOption5(bool? hasOption5) => _$this._hasOption5 = hasOption5;

  ListBuilder<DocumentReference<Object?>>? _options1;
  ListBuilder<DocumentReference<Object?>> get options1 =>
      _$this._options1 ??= new ListBuilder<DocumentReference<Object?>>();
  set options1(ListBuilder<DocumentReference<Object?>>? options1) =>
      _$this._options1 = options1;

  ListBuilder<String>? _uploadedPhotos;
  ListBuilder<String> get uploadedPhotos =>
      _$this._uploadedPhotos ??= new ListBuilder<String>();
  set uploadedPhotos(ListBuilder<String>? uploadedPhotos) =>
      _$this._uploadedPhotos = uploadedPhotos;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MenuItemRecordBuilder() {
    MenuItemRecord._initializeBuilder(this);
  }

  MenuItemRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _itemName = $v.itemName;
      _itemDescription = $v.itemDescription;
      _itemImage = $v.itemImage;
      _restRef = $v.restRef;
      _userRef = $v.userRef;
      _createdAt = $v.createdAt;
      _courseRef = $v.courseRef;
      _itemPrice = $v.itemPrice;
      _featuredItem = $v.featuredItem;
      _number = $v.number;
      _modifiers = $v.modifiers?.toBuilder();
      _modifier = $v.modifier?.toBuilder();
      _options = $v.options?.toBuilder();
      _optionStrings = $v.optionStrings?.toBuilder();
      _option1 = $v.option1;
      _hasOption1 = $v.hasOption1;
      _hasOption2 = $v.hasOption2;
      _hasOption3 = $v.hasOption3;
      _hasOption4 = $v.hasOption4;
      _hasOption5 = $v.hasOption5;
      _options1 = $v.options1?.toBuilder();
      _uploadedPhotos = $v.uploadedPhotos?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MenuItemRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MenuItemRecord;
  }

  @override
  void update(void Function(MenuItemRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MenuItemRecord build() => _build();

  _$MenuItemRecord _build() {
    _$MenuItemRecord _$result;
    try {
      _$result = _$v ??
          new _$MenuItemRecord._(
              itemName: itemName,
              itemDescription: itemDescription,
              itemImage: itemImage,
              restRef: restRef,
              userRef: userRef,
              createdAt: createdAt,
              courseRef: courseRef,
              itemPrice: itemPrice,
              featuredItem: featuredItem,
              number: number,
              modifiers: _modifiers?.build(),
              modifier: _modifier?.build(),
              options: _options?.build(),
              optionStrings: _optionStrings?.build(),
              option1: option1,
              hasOption1: hasOption1,
              hasOption2: hasOption2,
              hasOption3: hasOption3,
              hasOption4: hasOption4,
              hasOption5: hasOption5,
              options1: _options1?.build(),
              uploadedPhotos: _uploadedPhotos?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'modifiers';
        _modifiers?.build();
        _$failedField = 'modifier';
        _modifier?.build();
        _$failedField = 'options';
        _options?.build();
        _$failedField = 'optionStrings';
        _optionStrings?.build();

        _$failedField = 'options1';
        _options1?.build();
        _$failedField = 'uploadedPhotos';
        _uploadedPhotos?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MenuItemRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option1_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Option1Record> _$option1RecordSerializer =
    new _$Option1RecordSerializer();

class _$Option1RecordSerializer implements StructuredSerializer<Option1Record> {
  @override
  final Iterable<Type> types = const [Option1Record, _$Option1Record];
  @override
  final String wireName = 'Option1Record';

  @override
  Iterable<Object?> serialize(Serializers serializers, Option1Record object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.option1Name;
    if (value != null) {
      result
        ..add('option1Name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.option1Title;
    if (value != null) {
      result
        ..add('option1Title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.menuItemRef;
    if (value != null) {
      result
        ..add('menuItemRef')
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
    value = object.options;
    if (value != null) {
      result
        ..add('options')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.option1Price;
    if (value != null) {
      result
        ..add('option1Price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.inCartItemRef;
    if (value != null) {
      result
        ..add('inCartItemRef')
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
  Option1Record deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new Option1RecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'option1Name':
          result.option1Name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'option1Title':
          result.option1Title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'menuItemRef':
          result.menuItemRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'hasOption1':
          result.hasOption1 = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'options':
          result.options.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'option1Price':
          result.option1Price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'inCartItemRef':
          result.inCartItemRef = serializers.deserialize(value,
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

class _$Option1Record extends Option1Record {
  @override
  final String? option1Name;
  @override
  final String? option1Title;
  @override
  final DocumentReference<Object?>? menuItemRef;
  @override
  final bool? hasOption1;
  @override
  final BuiltList<String>? options;
  @override
  final double? option1Price;
  @override
  final DocumentReference<Object?>? inCartItemRef;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$Option1Record([void Function(Option1RecordBuilder)? updates]) =>
      (new Option1RecordBuilder()..update(updates))._build();

  _$Option1Record._(
      {this.option1Name,
      this.option1Title,
      this.menuItemRef,
      this.hasOption1,
      this.options,
      this.option1Price,
      this.inCartItemRef,
      this.ffRef})
      : super._();

  @override
  Option1Record rebuild(void Function(Option1RecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Option1RecordBuilder toBuilder() => new Option1RecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Option1Record &&
        option1Name == other.option1Name &&
        option1Title == other.option1Title &&
        menuItemRef == other.menuItemRef &&
        hasOption1 == other.hasOption1 &&
        options == other.options &&
        option1Price == other.option1Price &&
        inCartItemRef == other.inCartItemRef &&
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
                            $jc($jc(0, option1Name.hashCode),
                                option1Title.hashCode),
                            menuItemRef.hashCode),
                        hasOption1.hashCode),
                    options.hashCode),
                option1Price.hashCode),
            inCartItemRef.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Option1Record')
          ..add('option1Name', option1Name)
          ..add('option1Title', option1Title)
          ..add('menuItemRef', menuItemRef)
          ..add('hasOption1', hasOption1)
          ..add('options', options)
          ..add('option1Price', option1Price)
          ..add('inCartItemRef', inCartItemRef)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class Option1RecordBuilder
    implements Builder<Option1Record, Option1RecordBuilder> {
  _$Option1Record? _$v;

  String? _option1Name;
  String? get option1Name => _$this._option1Name;
  set option1Name(String? option1Name) => _$this._option1Name = option1Name;

  String? _option1Title;
  String? get option1Title => _$this._option1Title;
  set option1Title(String? option1Title) => _$this._option1Title = option1Title;

  DocumentReference<Object?>? _menuItemRef;
  DocumentReference<Object?>? get menuItemRef => _$this._menuItemRef;
  set menuItemRef(DocumentReference<Object?>? menuItemRef) =>
      _$this._menuItemRef = menuItemRef;

  bool? _hasOption1;
  bool? get hasOption1 => _$this._hasOption1;
  set hasOption1(bool? hasOption1) => _$this._hasOption1 = hasOption1;

  ListBuilder<String>? _options;
  ListBuilder<String> get options =>
      _$this._options ??= new ListBuilder<String>();
  set options(ListBuilder<String>? options) => _$this._options = options;

  double? _option1Price;
  double? get option1Price => _$this._option1Price;
  set option1Price(double? option1Price) => _$this._option1Price = option1Price;

  DocumentReference<Object?>? _inCartItemRef;
  DocumentReference<Object?>? get inCartItemRef => _$this._inCartItemRef;
  set inCartItemRef(DocumentReference<Object?>? inCartItemRef) =>
      _$this._inCartItemRef = inCartItemRef;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  Option1RecordBuilder() {
    Option1Record._initializeBuilder(this);
  }

  Option1RecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _option1Name = $v.option1Name;
      _option1Title = $v.option1Title;
      _menuItemRef = $v.menuItemRef;
      _hasOption1 = $v.hasOption1;
      _options = $v.options?.toBuilder();
      _option1Price = $v.option1Price;
      _inCartItemRef = $v.inCartItemRef;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Option1Record other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Option1Record;
  }

  @override
  void update(void Function(Option1RecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Option1Record build() => _build();

  _$Option1Record _build() {
    _$Option1Record _$result;
    try {
      _$result = _$v ??
          new _$Option1Record._(
              option1Name: option1Name,
              option1Title: option1Title,
              menuItemRef: menuItemRef,
              hasOption1: hasOption1,
              options: _options?.build(),
              option1Price: option1Price,
              inCartItemRef: inCartItemRef,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'options';
        _options?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Option1Record', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

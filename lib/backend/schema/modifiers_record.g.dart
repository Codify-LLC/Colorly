// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modifiers_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ModifiersRecord> _$modifiersRecordSerializer =
    new _$ModifiersRecordSerializer();

class _$ModifiersRecordSerializer
    implements StructuredSerializer<ModifiersRecord> {
  @override
  final Iterable<Type> types = const [ModifiersRecord, _$ModifiersRecord];
  @override
  final String wireName = 'ModifiersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ModifiersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.modName;
    if (value != null) {
      result
        ..add('modName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.modItem;
    if (value != null) {
      result
        ..add('modItem')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.modOptions;
    if (value != null) {
      result
        ..add('modOptions')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.modItems;
    if (value != null) {
      result
        ..add('modItems')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.modNames;
    if (value != null) {
      result
        ..add('modNames')
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
  ModifiersRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ModifiersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'modName':
          result.modName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'modItem':
          result.modItem = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'modOptions':
          result.modOptions.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'modItems':
          result.modItems.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'modNames':
          result.modNames.replace(serializers.deserialize(value,
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

class _$ModifiersRecord extends ModifiersRecord {
  @override
  final String? modName;
  @override
  final DocumentReference<Object?>? modItem;
  @override
  final BuiltList<DocumentReference<Object?>>? modOptions;
  @override
  final BuiltList<DocumentReference<Object?>>? modItems;
  @override
  final BuiltList<String>? modNames;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ModifiersRecord([void Function(ModifiersRecordBuilder)? updates]) =>
      (new ModifiersRecordBuilder()..update(updates))._build();

  _$ModifiersRecord._(
      {this.modName,
      this.modItem,
      this.modOptions,
      this.modItems,
      this.modNames,
      this.ffRef})
      : super._();

  @override
  ModifiersRecord rebuild(void Function(ModifiersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModifiersRecordBuilder toBuilder() =>
      new ModifiersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ModifiersRecord &&
        modName == other.modName &&
        modItem == other.modItem &&
        modOptions == other.modOptions &&
        modItems == other.modItems &&
        modNames == other.modNames &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, modName.hashCode), modItem.hashCode),
                    modOptions.hashCode),
                modItems.hashCode),
            modNames.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ModifiersRecord')
          ..add('modName', modName)
          ..add('modItem', modItem)
          ..add('modOptions', modOptions)
          ..add('modItems', modItems)
          ..add('modNames', modNames)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ModifiersRecordBuilder
    implements Builder<ModifiersRecord, ModifiersRecordBuilder> {
  _$ModifiersRecord? _$v;

  String? _modName;
  String? get modName => _$this._modName;
  set modName(String? modName) => _$this._modName = modName;

  DocumentReference<Object?>? _modItem;
  DocumentReference<Object?>? get modItem => _$this._modItem;
  set modItem(DocumentReference<Object?>? modItem) => _$this._modItem = modItem;

  ListBuilder<DocumentReference<Object?>>? _modOptions;
  ListBuilder<DocumentReference<Object?>> get modOptions =>
      _$this._modOptions ??= new ListBuilder<DocumentReference<Object?>>();
  set modOptions(ListBuilder<DocumentReference<Object?>>? modOptions) =>
      _$this._modOptions = modOptions;

  ListBuilder<DocumentReference<Object?>>? _modItems;
  ListBuilder<DocumentReference<Object?>> get modItems =>
      _$this._modItems ??= new ListBuilder<DocumentReference<Object?>>();
  set modItems(ListBuilder<DocumentReference<Object?>>? modItems) =>
      _$this._modItems = modItems;

  ListBuilder<String>? _modNames;
  ListBuilder<String> get modNames =>
      _$this._modNames ??= new ListBuilder<String>();
  set modNames(ListBuilder<String>? modNames) => _$this._modNames = modNames;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ModifiersRecordBuilder() {
    ModifiersRecord._initializeBuilder(this);
  }

  ModifiersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _modName = $v.modName;
      _modItem = $v.modItem;
      _modOptions = $v.modOptions?.toBuilder();
      _modItems = $v.modItems?.toBuilder();
      _modNames = $v.modNames?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ModifiersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ModifiersRecord;
  }

  @override
  void update(void Function(ModifiersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ModifiersRecord build() => _build();

  _$ModifiersRecord _build() {
    _$ModifiersRecord _$result;
    try {
      _$result = _$v ??
          new _$ModifiersRecord._(
              modName: modName,
              modItem: modItem,
              modOptions: _modOptions?.build(),
              modItems: _modItems?.build(),
              modNames: _modNames?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'modOptions';
        _modOptions?.build();
        _$failedField = 'modItems';
        _modItems?.build();
        _$failedField = 'modNames';
        _modNames?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ModifiersRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

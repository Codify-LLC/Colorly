// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adventures_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AdventuresRecord> _$adventuresRecordSerializer =
    new _$AdventuresRecordSerializer();

class _$AdventuresRecordSerializer
    implements StructuredSerializer<AdventuresRecord> {
  @override
  final Iterable<Type> types = const [AdventuresRecord, _$AdventuresRecord];
  @override
  final String wireName = 'AdventuresRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AdventuresRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.createdTime;
    if (value != null) {
      result
        ..add('createdTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.adventureName;
    if (value != null) {
      result
        ..add('adventureName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.slot1;
    if (value != null) {
      result
        ..add('slot1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.slot2;
    if (value != null) {
      result
        ..add('slot2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.slot3;
    if (value != null) {
      result
        ..add('slot3')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.expireTime;
    if (value != null) {
      result
        ..add('expireTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.has1;
    if (value != null) {
      result
        ..add('has1')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.has2;
    if (value != null) {
      result
        ..add('has2')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.has3;
    if (value != null) {
      result
        ..add('has3')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.featured;
    if (value != null) {
      result
        ..add('featured')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
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
  AdventuresRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AdventuresRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'createdTime':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'adventureName':
          result.adventureName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'slot1':
          result.slot1 = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'slot2':
          result.slot2 = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'slot3':
          result.slot3 = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'expireTime':
          result.expireTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'has1':
          result.has1 = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'has2':
          result.has2 = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'has3':
          result.has3 = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'featured':
          result.featured = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
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

class _$AdventuresRecord extends AdventuresRecord {
  @override
  final DateTime? createdTime;
  @override
  final String? adventureName;
  @override
  final DocumentReference<Object?>? slot1;
  @override
  final DocumentReference<Object?>? slot2;
  @override
  final DocumentReference<Object?>? slot3;
  @override
  final DateTime? expireTime;
  @override
  final bool? has1;
  @override
  final bool? has2;
  @override
  final bool? has3;
  @override
  final bool? featured;
  @override
  final DocumentReference<Object?>? user;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AdventuresRecord(
          [void Function(AdventuresRecordBuilder)? updates]) =>
      (new AdventuresRecordBuilder()..update(updates))._build();

  _$AdventuresRecord._(
      {this.createdTime,
      this.adventureName,
      this.slot1,
      this.slot2,
      this.slot3,
      this.expireTime,
      this.has1,
      this.has2,
      this.has3,
      this.featured,
      this.user,
      this.ffRef})
      : super._();

  @override
  AdventuresRecord rebuild(void Function(AdventuresRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdventuresRecordBuilder toBuilder() =>
      new AdventuresRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdventuresRecord &&
        createdTime == other.createdTime &&
        adventureName == other.adventureName &&
        slot1 == other.slot1 &&
        slot2 == other.slot2 &&
        slot3 == other.slot3 &&
        expireTime == other.expireTime &&
        has1 == other.has1 &&
        has2 == other.has2 &&
        has3 == other.has3 &&
        featured == other.featured &&
        user == other.user &&
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
                                            $jc($jc(0, createdTime.hashCode),
                                                adventureName.hashCode),
                                            slot1.hashCode),
                                        slot2.hashCode),
                                    slot3.hashCode),
                                expireTime.hashCode),
                            has1.hashCode),
                        has2.hashCode),
                    has3.hashCode),
                featured.hashCode),
            user.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdventuresRecord')
          ..add('createdTime', createdTime)
          ..add('adventureName', adventureName)
          ..add('slot1', slot1)
          ..add('slot2', slot2)
          ..add('slot3', slot3)
          ..add('expireTime', expireTime)
          ..add('has1', has1)
          ..add('has2', has2)
          ..add('has3', has3)
          ..add('featured', featured)
          ..add('user', user)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AdventuresRecordBuilder
    implements Builder<AdventuresRecord, AdventuresRecordBuilder> {
  _$AdventuresRecord? _$v;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _adventureName;
  String? get adventureName => _$this._adventureName;
  set adventureName(String? adventureName) =>
      _$this._adventureName = adventureName;

  DocumentReference<Object?>? _slot1;
  DocumentReference<Object?>? get slot1 => _$this._slot1;
  set slot1(DocumentReference<Object?>? slot1) => _$this._slot1 = slot1;

  DocumentReference<Object?>? _slot2;
  DocumentReference<Object?>? get slot2 => _$this._slot2;
  set slot2(DocumentReference<Object?>? slot2) => _$this._slot2 = slot2;

  DocumentReference<Object?>? _slot3;
  DocumentReference<Object?>? get slot3 => _$this._slot3;
  set slot3(DocumentReference<Object?>? slot3) => _$this._slot3 = slot3;

  DateTime? _expireTime;
  DateTime? get expireTime => _$this._expireTime;
  set expireTime(DateTime? expireTime) => _$this._expireTime = expireTime;

  bool? _has1;
  bool? get has1 => _$this._has1;
  set has1(bool? has1) => _$this._has1 = has1;

  bool? _has2;
  bool? get has2 => _$this._has2;
  set has2(bool? has2) => _$this._has2 = has2;

  bool? _has3;
  bool? get has3 => _$this._has3;
  set has3(bool? has3) => _$this._has3 = has3;

  bool? _featured;
  bool? get featured => _$this._featured;
  set featured(bool? featured) => _$this._featured = featured;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AdventuresRecordBuilder() {
    AdventuresRecord._initializeBuilder(this);
  }

  AdventuresRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdTime = $v.createdTime;
      _adventureName = $v.adventureName;
      _slot1 = $v.slot1;
      _slot2 = $v.slot2;
      _slot3 = $v.slot3;
      _expireTime = $v.expireTime;
      _has1 = $v.has1;
      _has2 = $v.has2;
      _has3 = $v.has3;
      _featured = $v.featured;
      _user = $v.user;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdventuresRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AdventuresRecord;
  }

  @override
  void update(void Function(AdventuresRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdventuresRecord build() => _build();

  _$AdventuresRecord _build() {
    final _$result = _$v ??
        new _$AdventuresRecord._(
            createdTime: createdTime,
            adventureName: adventureName,
            slot1: slot1,
            slot2: slot2,
            slot3: slot3,
            expireTime: expireTime,
            has1: has1,
            has2: has2,
            has3: has3,
            featured: featured,
            user: user,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

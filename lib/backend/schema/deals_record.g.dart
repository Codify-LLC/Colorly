// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deals_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DealsRecord> _$dealsRecordSerializer = new _$DealsRecordSerializer();

class _$DealsRecordSerializer implements StructuredSerializer<DealsRecord> {
  @override
  final Iterable<Type> types = const [DealsRecord, _$DealsRecord];
  @override
  final String wireName = 'DealsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, DealsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.restRef;
    if (value != null) {
      result
        ..add('restRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.expiry;
    if (value != null) {
      result
        ..add('expiry')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.active;
    if (value != null) {
      result
        ..add('active')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.details;
    if (value != null) {
      result
        ..add('details')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.code;
    if (value != null) {
      result
        ..add('code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dealClicks;
    if (value != null) {
      result
        ..add('dealClicks')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.conditions;
    if (value != null) {
      result
        ..add('conditions')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.promoted;
    if (value != null) {
      result
        ..add('promoted')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.promotedExpiry;
    if (value != null) {
      result
        ..add('promotedExpiry')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.userSaved;
    if (value != null) {
      result
        ..add('userSaved')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.needsRedeemed;
    if (value != null) {
      result
        ..add('needsRedeemed')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.whoRedeemed;
    if (value != null) {
      result
        ..add('whoRedeemed')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.dealAmount;
    if (value != null) {
      result
        ..add('dealAmount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  DealsRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DealsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'restRef':
          result.restRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'expiry':
          result.expiry = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'active':
          result.active = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'details':
          result.details = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dealClicks':
          result.dealClicks = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'conditions':
          result.conditions = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'promoted':
          result.promoted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'promotedExpiry':
          result.promotedExpiry = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'userSaved':
          result.userSaved.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'needsRedeemed':
          result.needsRedeemed = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'whoRedeemed':
          result.whoRedeemed.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'dealAmount':
          result.dealAmount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$DealsRecord extends DealsRecord {
  @override
  final DocumentReference<Object?>? restRef;
  @override
  final DateTime? expiry;
  @override
  final bool? active;
  @override
  final LatLng? location;
  @override
  final String? details;
  @override
  final String? code;
  @override
  final String? title;
  @override
  final int? dealClicks;
  @override
  final String? conditions;
  @override
  final bool? promoted;
  @override
  final DateTime? promotedExpiry;
  @override
  final BuiltList<DocumentReference<Object?>>? userSaved;
  @override
  final bool? needsRedeemed;
  @override
  final BuiltList<DocumentReference<Object?>>? whoRedeemed;
  @override
  final int? dealAmount;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$DealsRecord([void Function(DealsRecordBuilder)? updates]) =>
      (new DealsRecordBuilder()..update(updates))._build();

  _$DealsRecord._(
      {this.restRef,
      this.expiry,
      this.active,
      this.location,
      this.details,
      this.code,
      this.title,
      this.dealClicks,
      this.conditions,
      this.promoted,
      this.promotedExpiry,
      this.userSaved,
      this.needsRedeemed,
      this.whoRedeemed,
      this.dealAmount,
      this.ffRef})
      : super._();

  @override
  DealsRecord rebuild(void Function(DealsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DealsRecordBuilder toBuilder() => new DealsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DealsRecord &&
        restRef == other.restRef &&
        expiry == other.expiry &&
        active == other.active &&
        location == other.location &&
        details == other.details &&
        code == other.code &&
        title == other.title &&
        dealClicks == other.dealClicks &&
        conditions == other.conditions &&
        promoted == other.promoted &&
        promotedExpiry == other.promotedExpiry &&
        userSaved == other.userSaved &&
        needsRedeemed == other.needsRedeemed &&
        whoRedeemed == other.whoRedeemed &&
        dealAmount == other.dealAmount &&
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
                                                                    0,
                                                                    restRef
                                                                        .hashCode),
                                                                expiry
                                                                    .hashCode),
                                                            active.hashCode),
                                                        location.hashCode),
                                                    details.hashCode),
                                                code.hashCode),
                                            title.hashCode),
                                        dealClicks.hashCode),
                                    conditions.hashCode),
                                promoted.hashCode),
                            promotedExpiry.hashCode),
                        userSaved.hashCode),
                    needsRedeemed.hashCode),
                whoRedeemed.hashCode),
            dealAmount.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DealsRecord')
          ..add('restRef', restRef)
          ..add('expiry', expiry)
          ..add('active', active)
          ..add('location', location)
          ..add('details', details)
          ..add('code', code)
          ..add('title', title)
          ..add('dealClicks', dealClicks)
          ..add('conditions', conditions)
          ..add('promoted', promoted)
          ..add('promotedExpiry', promotedExpiry)
          ..add('userSaved', userSaved)
          ..add('needsRedeemed', needsRedeemed)
          ..add('whoRedeemed', whoRedeemed)
          ..add('dealAmount', dealAmount)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class DealsRecordBuilder implements Builder<DealsRecord, DealsRecordBuilder> {
  _$DealsRecord? _$v;

  DocumentReference<Object?>? _restRef;
  DocumentReference<Object?>? get restRef => _$this._restRef;
  set restRef(DocumentReference<Object?>? restRef) => _$this._restRef = restRef;

  DateTime? _expiry;
  DateTime? get expiry => _$this._expiry;
  set expiry(DateTime? expiry) => _$this._expiry = expiry;

  bool? _active;
  bool? get active => _$this._active;
  set active(bool? active) => _$this._active = active;

  LatLng? _location;
  LatLng? get location => _$this._location;
  set location(LatLng? location) => _$this._location = location;

  String? _details;
  String? get details => _$this._details;
  set details(String? details) => _$this._details = details;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  int? _dealClicks;
  int? get dealClicks => _$this._dealClicks;
  set dealClicks(int? dealClicks) => _$this._dealClicks = dealClicks;

  String? _conditions;
  String? get conditions => _$this._conditions;
  set conditions(String? conditions) => _$this._conditions = conditions;

  bool? _promoted;
  bool? get promoted => _$this._promoted;
  set promoted(bool? promoted) => _$this._promoted = promoted;

  DateTime? _promotedExpiry;
  DateTime? get promotedExpiry => _$this._promotedExpiry;
  set promotedExpiry(DateTime? promotedExpiry) =>
      _$this._promotedExpiry = promotedExpiry;

  ListBuilder<DocumentReference<Object?>>? _userSaved;
  ListBuilder<DocumentReference<Object?>> get userSaved =>
      _$this._userSaved ??= new ListBuilder<DocumentReference<Object?>>();
  set userSaved(ListBuilder<DocumentReference<Object?>>? userSaved) =>
      _$this._userSaved = userSaved;

  bool? _needsRedeemed;
  bool? get needsRedeemed => _$this._needsRedeemed;
  set needsRedeemed(bool? needsRedeemed) =>
      _$this._needsRedeemed = needsRedeemed;

  ListBuilder<DocumentReference<Object?>>? _whoRedeemed;
  ListBuilder<DocumentReference<Object?>> get whoRedeemed =>
      _$this._whoRedeemed ??= new ListBuilder<DocumentReference<Object?>>();
  set whoRedeemed(ListBuilder<DocumentReference<Object?>>? whoRedeemed) =>
      _$this._whoRedeemed = whoRedeemed;

  int? _dealAmount;
  int? get dealAmount => _$this._dealAmount;
  set dealAmount(int? dealAmount) => _$this._dealAmount = dealAmount;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  DealsRecordBuilder() {
    DealsRecord._initializeBuilder(this);
  }

  DealsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _restRef = $v.restRef;
      _expiry = $v.expiry;
      _active = $v.active;
      _location = $v.location;
      _details = $v.details;
      _code = $v.code;
      _title = $v.title;
      _dealClicks = $v.dealClicks;
      _conditions = $v.conditions;
      _promoted = $v.promoted;
      _promotedExpiry = $v.promotedExpiry;
      _userSaved = $v.userSaved?.toBuilder();
      _needsRedeemed = $v.needsRedeemed;
      _whoRedeemed = $v.whoRedeemed?.toBuilder();
      _dealAmount = $v.dealAmount;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DealsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DealsRecord;
  }

  @override
  void update(void Function(DealsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DealsRecord build() => _build();

  _$DealsRecord _build() {
    _$DealsRecord _$result;
    try {
      _$result = _$v ??
          new _$DealsRecord._(
              restRef: restRef,
              expiry: expiry,
              active: active,
              location: location,
              details: details,
              code: code,
              title: title,
              dealClicks: dealClicks,
              conditions: conditions,
              promoted: promoted,
              promotedExpiry: promotedExpiry,
              userSaved: _userSaved?.build(),
              needsRedeemed: needsRedeemed,
              whoRedeemed: _whoRedeemed?.build(),
              dealAmount: dealAmount,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'userSaved';
        _userSaved?.build();

        _$failedField = 'whoRedeemed';
        _whoRedeemed?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'DealsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

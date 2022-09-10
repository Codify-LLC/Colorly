// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StatisticsRecord> _$statisticsRecordSerializer =
    new _$StatisticsRecordSerializer();

class _$StatisticsRecordSerializer
    implements StructuredSerializer<StatisticsRecord> {
  @override
  final Iterable<Type> types = const [StatisticsRecord, _$StatisticsRecord];
  @override
  final String wireName = 'StatisticsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, StatisticsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.numberOfFalvor;
    if (value != null) {
      result
        ..add('numberOfFalvor')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.numberFollowers;
    if (value != null) {
      result
        ..add('numberFollowers')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.numberFollowing;
    if (value != null) {
      result
        ..add('numberFollowing')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.userReference;
    if (value != null) {
      result
        ..add('userReference')
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
  StatisticsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StatisticsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'numberOfFalvor':
          result.numberOfFalvor = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'numberFollowers':
          result.numberFollowers = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'numberFollowing':
          result.numberFollowing = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'userReference':
          result.userReference = serializers.deserialize(value,
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

class _$StatisticsRecord extends StatisticsRecord {
  @override
  final int? numberOfFalvor;
  @override
  final int? numberFollowers;
  @override
  final int? numberFollowing;
  @override
  final DocumentReference<Object?>? userReference;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$StatisticsRecord(
          [void Function(StatisticsRecordBuilder)? updates]) =>
      (new StatisticsRecordBuilder()..update(updates))._build();

  _$StatisticsRecord._(
      {this.numberOfFalvor,
      this.numberFollowers,
      this.numberFollowing,
      this.userReference,
      this.ffRef})
      : super._();

  @override
  StatisticsRecord rebuild(void Function(StatisticsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StatisticsRecordBuilder toBuilder() =>
      new StatisticsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StatisticsRecord &&
        numberOfFalvor == other.numberOfFalvor &&
        numberFollowers == other.numberFollowers &&
        numberFollowing == other.numberFollowing &&
        userReference == other.userReference &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, numberOfFalvor.hashCode), numberFollowers.hashCode),
                numberFollowing.hashCode),
            userReference.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StatisticsRecord')
          ..add('numberOfFalvor', numberOfFalvor)
          ..add('numberFollowers', numberFollowers)
          ..add('numberFollowing', numberFollowing)
          ..add('userReference', userReference)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class StatisticsRecordBuilder
    implements Builder<StatisticsRecord, StatisticsRecordBuilder> {
  _$StatisticsRecord? _$v;

  int? _numberOfFalvor;
  int? get numberOfFalvor => _$this._numberOfFalvor;
  set numberOfFalvor(int? numberOfFalvor) =>
      _$this._numberOfFalvor = numberOfFalvor;

  int? _numberFollowers;
  int? get numberFollowers => _$this._numberFollowers;
  set numberFollowers(int? numberFollowers) =>
      _$this._numberFollowers = numberFollowers;

  int? _numberFollowing;
  int? get numberFollowing => _$this._numberFollowing;
  set numberFollowing(int? numberFollowing) =>
      _$this._numberFollowing = numberFollowing;

  DocumentReference<Object?>? _userReference;
  DocumentReference<Object?>? get userReference => _$this._userReference;
  set userReference(DocumentReference<Object?>? userReference) =>
      _$this._userReference = userReference;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  StatisticsRecordBuilder() {
    StatisticsRecord._initializeBuilder(this);
  }

  StatisticsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _numberOfFalvor = $v.numberOfFalvor;
      _numberFollowers = $v.numberFollowers;
      _numberFollowing = $v.numberFollowing;
      _userReference = $v.userReference;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StatisticsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StatisticsRecord;
  }

  @override
  void update(void Function(StatisticsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StatisticsRecord build() => _build();

  _$StatisticsRecord _build() {
    final _$result = _$v ??
        new _$StatisticsRecord._(
            numberOfFalvor: numberOfFalvor,
            numberFollowers: numberFollowers,
            numberFollowing: numberFollowing,
            userReference: userReference,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

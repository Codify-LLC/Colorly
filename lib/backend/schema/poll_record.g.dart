// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PollRecord> _$pollRecordSerializer = new _$PollRecordSerializer();

class _$PollRecordSerializer implements StructuredSerializer<PollRecord> {
  @override
  final Iterable<Type> types = const [PollRecord, _$PollRecord];
  @override
  final String wireName = 'PollRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PollRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.stream;
    if (value != null) {
      result
        ..add('stream')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.current;
    if (value != null) {
      result
        ..add('current')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.question;
    if (value != null) {
      result
        ..add('question')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.answer1;
    if (value != null) {
      result
        ..add('answer1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.answer2;
    if (value != null) {
      result
        ..add('answer2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.answer3;
    if (value != null) {
      result
        ..add('answer3')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.answer4;
    if (value != null) {
      result
        ..add('answer4')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.totalAnswersGiven;
    if (value != null) {
      result
        ..add('totalAnswersGiven')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
    value = object.has4;
    if (value != null) {
      result
        ..add('has4')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.answer1Stats;
    if (value != null) {
      result
        ..add('answer1Stats')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.answer2Stats;
    if (value != null) {
      result
        ..add('answer2Stats')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.answer3Stats;
    if (value != null) {
      result
        ..add('answer3Stats')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.answer4Stats;
    if (value != null) {
      result
        ..add('answer4Stats')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.created;
    if (value != null) {
      result
        ..add('created')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  PollRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PollRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'stream':
          result.stream = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'current':
          result.current = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'question':
          result.question = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'answer1':
          result.answer1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'answer2':
          result.answer2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'answer3':
          result.answer3 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'answer4':
          result.answer4 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'totalAnswersGiven':
          result.totalAnswersGiven = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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
        case 'has4':
          result.has4 = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'answer1Stats':
          result.answer1Stats = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'answer2Stats':
          result.answer2Stats = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'answer3Stats':
          result.answer3Stats = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'answer4Stats':
          result.answer4Stats = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'created':
          result.created = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$PollRecord extends PollRecord {
  @override
  final DocumentReference<Object?>? stream;
  @override
  final bool? current;
  @override
  final String? question;
  @override
  final String? answer1;
  @override
  final String? answer2;
  @override
  final String? answer3;
  @override
  final String? answer4;
  @override
  final int? totalAnswersGiven;
  @override
  final bool? has1;
  @override
  final bool? has2;
  @override
  final bool? has3;
  @override
  final bool? has4;
  @override
  final double? answer1Stats;
  @override
  final double? answer2Stats;
  @override
  final double? answer3Stats;
  @override
  final double? answer4Stats;
  @override
  final DateTime? created;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PollRecord([void Function(PollRecordBuilder)? updates]) =>
      (new PollRecordBuilder()..update(updates))._build();

  _$PollRecord._(
      {this.stream,
      this.current,
      this.question,
      this.answer1,
      this.answer2,
      this.answer3,
      this.answer4,
      this.totalAnswersGiven,
      this.has1,
      this.has2,
      this.has3,
      this.has4,
      this.answer1Stats,
      this.answer2Stats,
      this.answer3Stats,
      this.answer4Stats,
      this.created,
      this.ffRef})
      : super._();

  @override
  PollRecord rebuild(void Function(PollRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PollRecordBuilder toBuilder() => new PollRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PollRecord &&
        stream == other.stream &&
        current == other.current &&
        question == other.question &&
        answer1 == other.answer1 &&
        answer2 == other.answer2 &&
        answer3 == other.answer3 &&
        answer4 == other.answer4 &&
        totalAnswersGiven == other.totalAnswersGiven &&
        has1 == other.has1 &&
        has2 == other.has2 &&
        has3 == other.has3 &&
        has4 == other.has4 &&
        answer1Stats == other.answer1Stats &&
        answer2Stats == other.answer2Stats &&
        answer3Stats == other.answer3Stats &&
        answer4Stats == other.answer4Stats &&
        created == other.created &&
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
                                                                            0,
                                                                            stream
                                                                                .hashCode),
                                                                        current
                                                                            .hashCode),
                                                                    question
                                                                        .hashCode),
                                                                answer1
                                                                    .hashCode),
                                                            answer2.hashCode),
                                                        answer3.hashCode),
                                                    answer4.hashCode),
                                                totalAnswersGiven.hashCode),
                                            has1.hashCode),
                                        has2.hashCode),
                                    has3.hashCode),
                                has4.hashCode),
                            answer1Stats.hashCode),
                        answer2Stats.hashCode),
                    answer3Stats.hashCode),
                answer4Stats.hashCode),
            created.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PollRecord')
          ..add('stream', stream)
          ..add('current', current)
          ..add('question', question)
          ..add('answer1', answer1)
          ..add('answer2', answer2)
          ..add('answer3', answer3)
          ..add('answer4', answer4)
          ..add('totalAnswersGiven', totalAnswersGiven)
          ..add('has1', has1)
          ..add('has2', has2)
          ..add('has3', has3)
          ..add('has4', has4)
          ..add('answer1Stats', answer1Stats)
          ..add('answer2Stats', answer2Stats)
          ..add('answer3Stats', answer3Stats)
          ..add('answer4Stats', answer4Stats)
          ..add('created', created)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PollRecordBuilder implements Builder<PollRecord, PollRecordBuilder> {
  _$PollRecord? _$v;

  DocumentReference<Object?>? _stream;
  DocumentReference<Object?>? get stream => _$this._stream;
  set stream(DocumentReference<Object?>? stream) => _$this._stream = stream;

  bool? _current;
  bool? get current => _$this._current;
  set current(bool? current) => _$this._current = current;

  String? _question;
  String? get question => _$this._question;
  set question(String? question) => _$this._question = question;

  String? _answer1;
  String? get answer1 => _$this._answer1;
  set answer1(String? answer1) => _$this._answer1 = answer1;

  String? _answer2;
  String? get answer2 => _$this._answer2;
  set answer2(String? answer2) => _$this._answer2 = answer2;

  String? _answer3;
  String? get answer3 => _$this._answer3;
  set answer3(String? answer3) => _$this._answer3 = answer3;

  String? _answer4;
  String? get answer4 => _$this._answer4;
  set answer4(String? answer4) => _$this._answer4 = answer4;

  int? _totalAnswersGiven;
  int? get totalAnswersGiven => _$this._totalAnswersGiven;
  set totalAnswersGiven(int? totalAnswersGiven) =>
      _$this._totalAnswersGiven = totalAnswersGiven;

  bool? _has1;
  bool? get has1 => _$this._has1;
  set has1(bool? has1) => _$this._has1 = has1;

  bool? _has2;
  bool? get has2 => _$this._has2;
  set has2(bool? has2) => _$this._has2 = has2;

  bool? _has3;
  bool? get has3 => _$this._has3;
  set has3(bool? has3) => _$this._has3 = has3;

  bool? _has4;
  bool? get has4 => _$this._has4;
  set has4(bool? has4) => _$this._has4 = has4;

  double? _answer1Stats;
  double? get answer1Stats => _$this._answer1Stats;
  set answer1Stats(double? answer1Stats) => _$this._answer1Stats = answer1Stats;

  double? _answer2Stats;
  double? get answer2Stats => _$this._answer2Stats;
  set answer2Stats(double? answer2Stats) => _$this._answer2Stats = answer2Stats;

  double? _answer3Stats;
  double? get answer3Stats => _$this._answer3Stats;
  set answer3Stats(double? answer3Stats) => _$this._answer3Stats = answer3Stats;

  double? _answer4Stats;
  double? get answer4Stats => _$this._answer4Stats;
  set answer4Stats(double? answer4Stats) => _$this._answer4Stats = answer4Stats;

  DateTime? _created;
  DateTime? get created => _$this._created;
  set created(DateTime? created) => _$this._created = created;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PollRecordBuilder() {
    PollRecord._initializeBuilder(this);
  }

  PollRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _stream = $v.stream;
      _current = $v.current;
      _question = $v.question;
      _answer1 = $v.answer1;
      _answer2 = $v.answer2;
      _answer3 = $v.answer3;
      _answer4 = $v.answer4;
      _totalAnswersGiven = $v.totalAnswersGiven;
      _has1 = $v.has1;
      _has2 = $v.has2;
      _has3 = $v.has3;
      _has4 = $v.has4;
      _answer1Stats = $v.answer1Stats;
      _answer2Stats = $v.answer2Stats;
      _answer3Stats = $v.answer3Stats;
      _answer4Stats = $v.answer4Stats;
      _created = $v.created;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PollRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PollRecord;
  }

  @override
  void update(void Function(PollRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PollRecord build() => _build();

  _$PollRecord _build() {
    final _$result = _$v ??
        new _$PollRecord._(
            stream: stream,
            current: current,
            question: question,
            answer1: answer1,
            answer2: answer2,
            answer3: answer3,
            answer4: answer4,
            totalAnswersGiven: totalAnswersGiven,
            has1: has1,
            has2: has2,
            has3: has3,
            has4: has4,
            answer1Stats: answer1Stats,
            answer2Stats: answer2Stats,
            answer3Stats: answer3Stats,
            answer4Stats: answer4Stats,
            created: created,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

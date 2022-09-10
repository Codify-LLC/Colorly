// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_lists_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PersonalListsRecord> _$personalListsRecordSerializer =
    new _$PersonalListsRecordSerializer();

class _$PersonalListsRecordSerializer
    implements StructuredSerializer<PersonalListsRecord> {
  @override
  final Iterable<Type> types = const [
    PersonalListsRecord,
    _$PersonalListsRecord
  ];
  @override
  final String wireName = 'PersonalListsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PersonalListsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.userRef;
    if (value != null) {
      result
        ..add('userRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.likes;
    if (value != null) {
      result
        ..add('likes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.restaurants;
    if (value != null) {
      result
        ..add('restaurants')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.updatedTime;
    if (value != null) {
      result
        ..add('updatedTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.featuredImage;
    if (value != null) {
      result
        ..add('featuredImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  PersonalListsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PersonalListsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userRef':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'likes':
          result.likes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'restaurants':
          result.restaurants.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'updatedTime':
          result.updatedTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'featuredImage':
          result.featuredImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$PersonalListsRecord extends PersonalListsRecord {
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final BuiltList<DocumentReference<Object?>>? likes;
  @override
  final String? description;
  @override
  final BuiltList<DocumentReference<Object?>>? restaurants;
  @override
  final String? title;
  @override
  final DateTime? updatedTime;
  @override
  final String? featuredImage;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PersonalListsRecord(
          [void Function(PersonalListsRecordBuilder)? updates]) =>
      (new PersonalListsRecordBuilder()..update(updates))._build();

  _$PersonalListsRecord._(
      {this.userRef,
      this.likes,
      this.description,
      this.restaurants,
      this.title,
      this.updatedTime,
      this.featuredImage,
      this.ffRef})
      : super._();

  @override
  PersonalListsRecord rebuild(
          void Function(PersonalListsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PersonalListsRecordBuilder toBuilder() =>
      new PersonalListsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PersonalListsRecord &&
        userRef == other.userRef &&
        likes == other.likes &&
        description == other.description &&
        restaurants == other.restaurants &&
        title == other.title &&
        updatedTime == other.updatedTime &&
        featuredImage == other.featuredImage &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, userRef.hashCode), likes.hashCode),
                            description.hashCode),
                        restaurants.hashCode),
                    title.hashCode),
                updatedTime.hashCode),
            featuredImage.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PersonalListsRecord')
          ..add('userRef', userRef)
          ..add('likes', likes)
          ..add('description', description)
          ..add('restaurants', restaurants)
          ..add('title', title)
          ..add('updatedTime', updatedTime)
          ..add('featuredImage', featuredImage)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PersonalListsRecordBuilder
    implements Builder<PersonalListsRecord, PersonalListsRecordBuilder> {
  _$PersonalListsRecord? _$v;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  ListBuilder<DocumentReference<Object?>>? _likes;
  ListBuilder<DocumentReference<Object?>> get likes =>
      _$this._likes ??= new ListBuilder<DocumentReference<Object?>>();
  set likes(ListBuilder<DocumentReference<Object?>>? likes) =>
      _$this._likes = likes;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ListBuilder<DocumentReference<Object?>>? _restaurants;
  ListBuilder<DocumentReference<Object?>> get restaurants =>
      _$this._restaurants ??= new ListBuilder<DocumentReference<Object?>>();
  set restaurants(ListBuilder<DocumentReference<Object?>>? restaurants) =>
      _$this._restaurants = restaurants;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  DateTime? _updatedTime;
  DateTime? get updatedTime => _$this._updatedTime;
  set updatedTime(DateTime? updatedTime) => _$this._updatedTime = updatedTime;

  String? _featuredImage;
  String? get featuredImage => _$this._featuredImage;
  set featuredImage(String? featuredImage) =>
      _$this._featuredImage = featuredImage;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PersonalListsRecordBuilder() {
    PersonalListsRecord._initializeBuilder(this);
  }

  PersonalListsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userRef = $v.userRef;
      _likes = $v.likes?.toBuilder();
      _description = $v.description;
      _restaurants = $v.restaurants?.toBuilder();
      _title = $v.title;
      _updatedTime = $v.updatedTime;
      _featuredImage = $v.featuredImage;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PersonalListsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PersonalListsRecord;
  }

  @override
  void update(void Function(PersonalListsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PersonalListsRecord build() => _build();

  _$PersonalListsRecord _build() {
    _$PersonalListsRecord _$result;
    try {
      _$result = _$v ??
          new _$PersonalListsRecord._(
              userRef: userRef,
              likes: _likes?.build(),
              description: description,
              restaurants: _restaurants?.build(),
              title: title,
              updatedTime: updatedTime,
              featuredImage: featuredImage,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'likes';
        _likes?.build();

        _$failedField = 'restaurants';
        _restaurants?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PersonalListsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

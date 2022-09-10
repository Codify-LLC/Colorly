// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curated_lists_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CuratedListsRecord> _$curatedListsRecordSerializer =
    new _$CuratedListsRecordSerializer();

class _$CuratedListsRecordSerializer
    implements StructuredSerializer<CuratedListsRecord> {
  @override
  final Iterable<Type> types = const [CuratedListsRecord, _$CuratedListsRecord];
  @override
  final String wireName = 'CuratedListsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CuratedListsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
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
    value = object.range;
    if (value != null) {
      result
        ..add('range')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.followers;
    if (value != null) {
      result
        ..add('followers')
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
    value = object.isFeatured;
    if (value != null) {
      result
        ..add('isFeatured')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  CuratedListsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CuratedListsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'restaurants':
          result.restaurants.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'range':
          result.range = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'followers':
          result.followers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isFeatured':
          result.isFeatured = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$CuratedListsRecord extends CuratedListsRecord {
  @override
  final String? title;
  @override
  final String? image;
  @override
  final BuiltList<DocumentReference<Object?>>? restaurants;
  @override
  final String? range;
  @override
  final BuiltList<DocumentReference<Object?>>? followers;
  @override
  final String? description;
  @override
  final bool? isFeatured;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CuratedListsRecord(
          [void Function(CuratedListsRecordBuilder)? updates]) =>
      (new CuratedListsRecordBuilder()..update(updates))._build();

  _$CuratedListsRecord._(
      {this.title,
      this.image,
      this.restaurants,
      this.range,
      this.followers,
      this.description,
      this.isFeatured,
      this.ffRef})
      : super._();

  @override
  CuratedListsRecord rebuild(
          void Function(CuratedListsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CuratedListsRecordBuilder toBuilder() =>
      new CuratedListsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CuratedListsRecord &&
        title == other.title &&
        image == other.image &&
        restaurants == other.restaurants &&
        range == other.range &&
        followers == other.followers &&
        description == other.description &&
        isFeatured == other.isFeatured &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, title.hashCode), image.hashCode),
                            restaurants.hashCode),
                        range.hashCode),
                    followers.hashCode),
                description.hashCode),
            isFeatured.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CuratedListsRecord')
          ..add('title', title)
          ..add('image', image)
          ..add('restaurants', restaurants)
          ..add('range', range)
          ..add('followers', followers)
          ..add('description', description)
          ..add('isFeatured', isFeatured)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CuratedListsRecordBuilder
    implements Builder<CuratedListsRecord, CuratedListsRecordBuilder> {
  _$CuratedListsRecord? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  ListBuilder<DocumentReference<Object?>>? _restaurants;
  ListBuilder<DocumentReference<Object?>> get restaurants =>
      _$this._restaurants ??= new ListBuilder<DocumentReference<Object?>>();
  set restaurants(ListBuilder<DocumentReference<Object?>>? restaurants) =>
      _$this._restaurants = restaurants;

  String? _range;
  String? get range => _$this._range;
  set range(String? range) => _$this._range = range;

  ListBuilder<DocumentReference<Object?>>? _followers;
  ListBuilder<DocumentReference<Object?>> get followers =>
      _$this._followers ??= new ListBuilder<DocumentReference<Object?>>();
  set followers(ListBuilder<DocumentReference<Object?>>? followers) =>
      _$this._followers = followers;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  bool? _isFeatured;
  bool? get isFeatured => _$this._isFeatured;
  set isFeatured(bool? isFeatured) => _$this._isFeatured = isFeatured;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CuratedListsRecordBuilder() {
    CuratedListsRecord._initializeBuilder(this);
  }

  CuratedListsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _image = $v.image;
      _restaurants = $v.restaurants?.toBuilder();
      _range = $v.range;
      _followers = $v.followers?.toBuilder();
      _description = $v.description;
      _isFeatured = $v.isFeatured;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CuratedListsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CuratedListsRecord;
  }

  @override
  void update(void Function(CuratedListsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CuratedListsRecord build() => _build();

  _$CuratedListsRecord _build() {
    _$CuratedListsRecord _$result;
    try {
      _$result = _$v ??
          new _$CuratedListsRecord._(
              title: title,
              image: image,
              restaurants: _restaurants?.build(),
              range: range,
              followers: _followers?.build(),
              description: description,
              isFeatured: isFeatured,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'restaurants';
        _restaurants?.build();

        _$failedField = 'followers';
        _followers?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CuratedListsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

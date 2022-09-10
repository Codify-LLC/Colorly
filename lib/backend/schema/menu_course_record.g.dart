// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_course_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MenuCourseRecord> _$menuCourseRecordSerializer =
    new _$MenuCourseRecordSerializer();

class _$MenuCourseRecordSerializer
    implements StructuredSerializer<MenuCourseRecord> {
  @override
  final Iterable<Type> types = const [MenuCourseRecord, _$MenuCourseRecord];
  @override
  final String wireName = 'MenuCourseRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, MenuCourseRecord object,
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
    value = object.menuItems;
    if (value != null) {
      result
        ..add('menuItems')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('createdAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.courseName;
    if (value != null) {
      result
        ..add('courseName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.courseNames;
    if (value != null) {
      result
        ..add('courseNames')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.courseDescription;
    if (value != null) {
      result
        ..add('courseDescription')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.courseImage;
    if (value != null) {
      result
        ..add('courseImage')
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
  MenuCourseRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MenuCourseRecordBuilder();

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
        case 'menuItems':
          result.menuItems.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'courseName':
          result.courseName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'courseNames':
          result.courseNames.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'courseDescription':
          result.courseDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'courseImage':
          result.courseImage = serializers.deserialize(value,
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

class _$MenuCourseRecord extends MenuCourseRecord {
  @override
  final DocumentReference<Object?>? restRef;
  @override
  final BuiltList<DocumentReference<Object?>>? menuItems;
  @override
  final DateTime? createdAt;
  @override
  final String? courseName;
  @override
  final BuiltList<String>? courseNames;
  @override
  final String? courseDescription;
  @override
  final String? courseImage;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MenuCourseRecord(
          [void Function(MenuCourseRecordBuilder)? updates]) =>
      (new MenuCourseRecordBuilder()..update(updates))._build();

  _$MenuCourseRecord._(
      {this.restRef,
      this.menuItems,
      this.createdAt,
      this.courseName,
      this.courseNames,
      this.courseDescription,
      this.courseImage,
      this.ffRef})
      : super._();

  @override
  MenuCourseRecord rebuild(void Function(MenuCourseRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MenuCourseRecordBuilder toBuilder() =>
      new MenuCourseRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MenuCourseRecord &&
        restRef == other.restRef &&
        menuItems == other.menuItems &&
        createdAt == other.createdAt &&
        courseName == other.courseName &&
        courseNames == other.courseNames &&
        courseDescription == other.courseDescription &&
        courseImage == other.courseImage &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, restRef.hashCode), menuItems.hashCode),
                            createdAt.hashCode),
                        courseName.hashCode),
                    courseNames.hashCode),
                courseDescription.hashCode),
            courseImage.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MenuCourseRecord')
          ..add('restRef', restRef)
          ..add('menuItems', menuItems)
          ..add('createdAt', createdAt)
          ..add('courseName', courseName)
          ..add('courseNames', courseNames)
          ..add('courseDescription', courseDescription)
          ..add('courseImage', courseImage)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MenuCourseRecordBuilder
    implements Builder<MenuCourseRecord, MenuCourseRecordBuilder> {
  _$MenuCourseRecord? _$v;

  DocumentReference<Object?>? _restRef;
  DocumentReference<Object?>? get restRef => _$this._restRef;
  set restRef(DocumentReference<Object?>? restRef) => _$this._restRef = restRef;

  ListBuilder<DocumentReference<Object?>>? _menuItems;
  ListBuilder<DocumentReference<Object?>> get menuItems =>
      _$this._menuItems ??= new ListBuilder<DocumentReference<Object?>>();
  set menuItems(ListBuilder<DocumentReference<Object?>>? menuItems) =>
      _$this._menuItems = menuItems;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _courseName;
  String? get courseName => _$this._courseName;
  set courseName(String? courseName) => _$this._courseName = courseName;

  ListBuilder<String>? _courseNames;
  ListBuilder<String> get courseNames =>
      _$this._courseNames ??= new ListBuilder<String>();
  set courseNames(ListBuilder<String>? courseNames) =>
      _$this._courseNames = courseNames;

  String? _courseDescription;
  String? get courseDescription => _$this._courseDescription;
  set courseDescription(String? courseDescription) =>
      _$this._courseDescription = courseDescription;

  String? _courseImage;
  String? get courseImage => _$this._courseImage;
  set courseImage(String? courseImage) => _$this._courseImage = courseImage;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MenuCourseRecordBuilder() {
    MenuCourseRecord._initializeBuilder(this);
  }

  MenuCourseRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _restRef = $v.restRef;
      _menuItems = $v.menuItems?.toBuilder();
      _createdAt = $v.createdAt;
      _courseName = $v.courseName;
      _courseNames = $v.courseNames?.toBuilder();
      _courseDescription = $v.courseDescription;
      _courseImage = $v.courseImage;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MenuCourseRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MenuCourseRecord;
  }

  @override
  void update(void Function(MenuCourseRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MenuCourseRecord build() => _build();

  _$MenuCourseRecord _build() {
    _$MenuCourseRecord _$result;
    try {
      _$result = _$v ??
          new _$MenuCourseRecord._(
              restRef: restRef,
              menuItems: _menuItems?.build(),
              createdAt: createdAt,
              courseName: courseName,
              courseNames: _courseNames?.build(),
              courseDescription: courseDescription,
              courseImage: courseImage,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'menuItems';
        _menuItems?.build();

        _$failedField = 'courseNames';
        _courseNames?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MenuCourseRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

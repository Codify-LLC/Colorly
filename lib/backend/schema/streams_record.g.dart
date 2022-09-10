// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streams_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StreamsRecord> _$streamsRecordSerializer =
    new _$StreamsRecordSerializer();

class _$StreamsRecordSerializer implements StructuredSerializer<StreamsRecord> {
  @override
  final Iterable<Type> types = const [StreamsRecord, _$StreamsRecord];
  @override
  final String wireName = 'StreamsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, StreamsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.isLive;
    if (value != null) {
      result
        ..add('is_live')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.playbackName;
    if (value != null) {
      result
        ..add('playback_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.playbackUrl;
    if (value != null) {
      result
        ..add('playback_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.timestamp;
    if (value != null) {
      result
        ..add('timestamp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.liveComments;
    if (value != null) {
      result
        ..add('liveComments')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.host;
    if (value != null) {
      result
        ..add('host')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.restaurant;
    if (value != null) {
      result
        ..add('restaurant')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
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
    value = object.hasLocation;
    if (value != null) {
      result
        ..add('hasLocation')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.hasRestaurant;
    if (value != null) {
      result
        ..add('hasRestaurant')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.hasPoll;
    if (value != null) {
      result
        ..add('hasPoll')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.hasTrivia;
    if (value != null) {
      result
        ..add('hasTrivia')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.poll;
    if (value != null) {
      result
        ..add('poll')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.trivia;
    if (value != null) {
      result
        ..add('trivia')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.pollRef;
    if (value != null) {
      result
        ..add('pollRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.triviaRef;
    if (value != null) {
      result
        ..add('triviaRef')
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
  StreamsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StreamsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'is_live':
          result.isLive = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'playback_name':
          result.playbackName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'playback_url':
          result.playbackUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'liveComments':
          result.liveComments.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'host':
          result.host = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'restaurant':
          result.restaurant = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'menuItems':
          result.menuItems.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'hasLocation':
          result.hasLocation = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'hasRestaurant':
          result.hasRestaurant = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'hasPoll':
          result.hasPoll = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'hasTrivia':
          result.hasTrivia = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'poll':
          result.poll.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'trivia':
          result.trivia.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'pollRef':
          result.pollRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'triviaRef':
          result.triviaRef = serializers.deserialize(value,
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

class _$StreamsRecord extends StreamsRecord {
  @override
  final bool? isLive;
  @override
  final String? playbackName;
  @override
  final String? playbackUrl;
  @override
  final DateTime? timestamp;
  @override
  final String? uid;
  @override
  final BuiltList<DocumentReference<Object?>>? liveComments;
  @override
  final DocumentReference<Object?>? host;
  @override
  final DocumentReference<Object?>? restaurant;
  @override
  final LatLng? location;
  @override
  final BuiltList<DocumentReference<Object?>>? menuItems;
  @override
  final bool? hasLocation;
  @override
  final bool? hasRestaurant;
  @override
  final bool? hasPoll;
  @override
  final bool? hasTrivia;
  @override
  final BuiltList<DocumentReference<Object?>>? poll;
  @override
  final BuiltList<DocumentReference<Object?>>? trivia;
  @override
  final DocumentReference<Object?>? pollRef;
  @override
  final DocumentReference<Object?>? triviaRef;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$StreamsRecord([void Function(StreamsRecordBuilder)? updates]) =>
      (new StreamsRecordBuilder()..update(updates))._build();

  _$StreamsRecord._(
      {this.isLive,
      this.playbackName,
      this.playbackUrl,
      this.timestamp,
      this.uid,
      this.liveComments,
      this.host,
      this.restaurant,
      this.location,
      this.menuItems,
      this.hasLocation,
      this.hasRestaurant,
      this.hasPoll,
      this.hasTrivia,
      this.poll,
      this.trivia,
      this.pollRef,
      this.triviaRef,
      this.ffRef})
      : super._();

  @override
  StreamsRecord rebuild(void Function(StreamsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StreamsRecordBuilder toBuilder() => new StreamsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StreamsRecord &&
        isLive == other.isLive &&
        playbackName == other.playbackName &&
        playbackUrl == other.playbackUrl &&
        timestamp == other.timestamp &&
        uid == other.uid &&
        liveComments == other.liveComments &&
        host == other.host &&
        restaurant == other.restaurant &&
        location == other.location &&
        menuItems == other.menuItems &&
        hasLocation == other.hasLocation &&
        hasRestaurant == other.hasRestaurant &&
        hasPoll == other.hasPoll &&
        hasTrivia == other.hasTrivia &&
        poll == other.poll &&
        trivia == other.trivia &&
        pollRef == other.pollRef &&
        triviaRef == other.triviaRef &&
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
                                                                            $jc(
                                                                                0,
                                                                                isLive
                                                                                    .hashCode),
                                                                            playbackName
                                                                                .hashCode),
                                                                        playbackUrl
                                                                            .hashCode),
                                                                    timestamp
                                                                        .hashCode),
                                                                uid.hashCode),
                                                            liveComments
                                                                .hashCode),
                                                        host.hashCode),
                                                    restaurant.hashCode),
                                                location.hashCode),
                                            menuItems.hashCode),
                                        hasLocation.hashCode),
                                    hasRestaurant.hashCode),
                                hasPoll.hashCode),
                            hasTrivia.hashCode),
                        poll.hashCode),
                    trivia.hashCode),
                pollRef.hashCode),
            triviaRef.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StreamsRecord')
          ..add('isLive', isLive)
          ..add('playbackName', playbackName)
          ..add('playbackUrl', playbackUrl)
          ..add('timestamp', timestamp)
          ..add('uid', uid)
          ..add('liveComments', liveComments)
          ..add('host', host)
          ..add('restaurant', restaurant)
          ..add('location', location)
          ..add('menuItems', menuItems)
          ..add('hasLocation', hasLocation)
          ..add('hasRestaurant', hasRestaurant)
          ..add('hasPoll', hasPoll)
          ..add('hasTrivia', hasTrivia)
          ..add('poll', poll)
          ..add('trivia', trivia)
          ..add('pollRef', pollRef)
          ..add('triviaRef', triviaRef)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class StreamsRecordBuilder
    implements Builder<StreamsRecord, StreamsRecordBuilder> {
  _$StreamsRecord? _$v;

  bool? _isLive;
  bool? get isLive => _$this._isLive;
  set isLive(bool? isLive) => _$this._isLive = isLive;

  String? _playbackName;
  String? get playbackName => _$this._playbackName;
  set playbackName(String? playbackName) => _$this._playbackName = playbackName;

  String? _playbackUrl;
  String? get playbackUrl => _$this._playbackUrl;
  set playbackUrl(String? playbackUrl) => _$this._playbackUrl = playbackUrl;

  DateTime? _timestamp;
  DateTime? get timestamp => _$this._timestamp;
  set timestamp(DateTime? timestamp) => _$this._timestamp = timestamp;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  ListBuilder<DocumentReference<Object?>>? _liveComments;
  ListBuilder<DocumentReference<Object?>> get liveComments =>
      _$this._liveComments ??= new ListBuilder<DocumentReference<Object?>>();
  set liveComments(ListBuilder<DocumentReference<Object?>>? liveComments) =>
      _$this._liveComments = liveComments;

  DocumentReference<Object?>? _host;
  DocumentReference<Object?>? get host => _$this._host;
  set host(DocumentReference<Object?>? host) => _$this._host = host;

  DocumentReference<Object?>? _restaurant;
  DocumentReference<Object?>? get restaurant => _$this._restaurant;
  set restaurant(DocumentReference<Object?>? restaurant) =>
      _$this._restaurant = restaurant;

  LatLng? _location;
  LatLng? get location => _$this._location;
  set location(LatLng? location) => _$this._location = location;

  ListBuilder<DocumentReference<Object?>>? _menuItems;
  ListBuilder<DocumentReference<Object?>> get menuItems =>
      _$this._menuItems ??= new ListBuilder<DocumentReference<Object?>>();
  set menuItems(ListBuilder<DocumentReference<Object?>>? menuItems) =>
      _$this._menuItems = menuItems;

  bool? _hasLocation;
  bool? get hasLocation => _$this._hasLocation;
  set hasLocation(bool? hasLocation) => _$this._hasLocation = hasLocation;

  bool? _hasRestaurant;
  bool? get hasRestaurant => _$this._hasRestaurant;
  set hasRestaurant(bool? hasRestaurant) =>
      _$this._hasRestaurant = hasRestaurant;

  bool? _hasPoll;
  bool? get hasPoll => _$this._hasPoll;
  set hasPoll(bool? hasPoll) => _$this._hasPoll = hasPoll;

  bool? _hasTrivia;
  bool? get hasTrivia => _$this._hasTrivia;
  set hasTrivia(bool? hasTrivia) => _$this._hasTrivia = hasTrivia;

  ListBuilder<DocumentReference<Object?>>? _poll;
  ListBuilder<DocumentReference<Object?>> get poll =>
      _$this._poll ??= new ListBuilder<DocumentReference<Object?>>();
  set poll(ListBuilder<DocumentReference<Object?>>? poll) =>
      _$this._poll = poll;

  ListBuilder<DocumentReference<Object?>>? _trivia;
  ListBuilder<DocumentReference<Object?>> get trivia =>
      _$this._trivia ??= new ListBuilder<DocumentReference<Object?>>();
  set trivia(ListBuilder<DocumentReference<Object?>>? trivia) =>
      _$this._trivia = trivia;

  DocumentReference<Object?>? _pollRef;
  DocumentReference<Object?>? get pollRef => _$this._pollRef;
  set pollRef(DocumentReference<Object?>? pollRef) => _$this._pollRef = pollRef;

  DocumentReference<Object?>? _triviaRef;
  DocumentReference<Object?>? get triviaRef => _$this._triviaRef;
  set triviaRef(DocumentReference<Object?>? triviaRef) =>
      _$this._triviaRef = triviaRef;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  StreamsRecordBuilder() {
    StreamsRecord._initializeBuilder(this);
  }

  StreamsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLive = $v.isLive;
      _playbackName = $v.playbackName;
      _playbackUrl = $v.playbackUrl;
      _timestamp = $v.timestamp;
      _uid = $v.uid;
      _liveComments = $v.liveComments?.toBuilder();
      _host = $v.host;
      _restaurant = $v.restaurant;
      _location = $v.location;
      _menuItems = $v.menuItems?.toBuilder();
      _hasLocation = $v.hasLocation;
      _hasRestaurant = $v.hasRestaurant;
      _hasPoll = $v.hasPoll;
      _hasTrivia = $v.hasTrivia;
      _poll = $v.poll?.toBuilder();
      _trivia = $v.trivia?.toBuilder();
      _pollRef = $v.pollRef;
      _triviaRef = $v.triviaRef;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StreamsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StreamsRecord;
  }

  @override
  void update(void Function(StreamsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StreamsRecord build() => _build();

  _$StreamsRecord _build() {
    _$StreamsRecord _$result;
    try {
      _$result = _$v ??
          new _$StreamsRecord._(
              isLive: isLive,
              playbackName: playbackName,
              playbackUrl: playbackUrl,
              timestamp: timestamp,
              uid: uid,
              liveComments: _liveComments?.build(),
              host: host,
              restaurant: restaurant,
              location: location,
              menuItems: _menuItems?.build(),
              hasLocation: hasLocation,
              hasRestaurant: hasRestaurant,
              hasPoll: hasPoll,
              hasTrivia: hasTrivia,
              poll: _poll?.build(),
              trivia: _trivia?.build(),
              pollRef: pollRef,
              triviaRef: triviaRef,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'liveComments';
        _liveComments?.build();

        _$failedField = 'menuItems';
        _menuItems?.build();

        _$failedField = 'poll';
        _poll?.build();
        _$failedField = 'trivia';
        _trivia?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'StreamsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

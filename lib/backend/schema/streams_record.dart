import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'streams_record.g.dart';

abstract class StreamsRecord
    implements Built<StreamsRecord, StreamsRecordBuilder> {
  static Serializer<StreamsRecord> get serializer => _$streamsRecordSerializer;

  @BuiltValueField(wireName: 'is_live')
  bool? get isLive;

  @BuiltValueField(wireName: 'playback_name')
  String? get playbackName;

  @BuiltValueField(wireName: 'playback_url')
  String? get playbackUrl;

  DateTime? get timestamp;

  String? get uid;

  BuiltList<DocumentReference>? get liveComments;

  DocumentReference? get host;

  DocumentReference? get restaurant;

  LatLng? get location;

  BuiltList<DocumentReference>? get menuItems;

  bool? get hasLocation;

  bool? get hasRestaurant;

  bool? get hasPoll;

  bool? get hasTrivia;

  BuiltList<DocumentReference>? get poll;

  BuiltList<DocumentReference>? get trivia;

  DocumentReference? get pollRef;

  DocumentReference? get triviaRef;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(StreamsRecordBuilder builder) => builder
    ..isLive = false
    ..playbackName = ''
    ..playbackUrl = ''
    ..uid = ''
    ..liveComments = ListBuilder()
    ..menuItems = ListBuilder()
    ..hasLocation = false
    ..hasRestaurant = false
    ..hasPoll = false
    ..hasTrivia = false
    ..poll = ListBuilder()
    ..trivia = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('streams');

  static Stream<StreamsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<StreamsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  StreamsRecord._();
  factory StreamsRecord([void Function(StreamsRecordBuilder) updates]) =
      _$StreamsRecord;

  static StreamsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createStreamsRecordData({
  bool? isLive,
  String? playbackName,
  String? playbackUrl,
  DateTime? timestamp,
  String? uid,
  DocumentReference? host,
  DocumentReference? restaurant,
  LatLng? location,
  bool? hasLocation,
  bool? hasRestaurant,
  bool? hasPoll,
  bool? hasTrivia,
  DocumentReference? pollRef,
  DocumentReference? triviaRef,
}) {
  final firestoreData = serializers.toFirestore(
    StreamsRecord.serializer,
    StreamsRecord(
      (s) => s
        ..isLive = isLive
        ..playbackName = playbackName
        ..playbackUrl = playbackUrl
        ..timestamp = timestamp
        ..uid = uid
        ..liveComments = null
        ..host = host
        ..restaurant = restaurant
        ..location = location
        ..menuItems = null
        ..hasLocation = hasLocation
        ..hasRestaurant = hasRestaurant
        ..hasPoll = hasPoll
        ..hasTrivia = hasTrivia
        ..poll = null
        ..trivia = null
        ..pollRef = pollRef
        ..triviaRef = triviaRef,
    ),
  );

  return firestoreData;
}

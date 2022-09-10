import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'deals_record.g.dart';

abstract class DealsRecord implements Built<DealsRecord, DealsRecordBuilder> {
  static Serializer<DealsRecord> get serializer => _$dealsRecordSerializer;

  DocumentReference? get restRef;

  DateTime? get expiry;

  bool? get active;

  LatLng? get location;

  String? get details;

  String? get code;

  String? get title;

  int? get dealClicks;

  String? get conditions;

  bool? get promoted;

  DateTime? get promotedExpiry;

  BuiltList<DocumentReference>? get userSaved;

  bool? get needsRedeemed;

  BuiltList<DocumentReference>? get whoRedeemed;

  int? get dealAmount;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(DealsRecordBuilder builder) => builder
    ..active = false
    ..details = ''
    ..code = ''
    ..title = ''
    ..dealClicks = 0
    ..conditions = ''
    ..promoted = false
    ..userSaved = ListBuilder()
    ..needsRedeemed = false
    ..whoRedeemed = ListBuilder()
    ..dealAmount = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('deals');

  static Stream<DealsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DealsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static DealsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => DealsRecord(
        (c) => c
          ..restRef = safeGet(() => toRef(snapshot.data['restRef']))
          ..expiry = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['expiry']))
          ..active = snapshot.data['active']
          ..location = safeGet(() => LatLng(
                snapshot.data['_geoloc']['lat'],
                snapshot.data['_geoloc']['lng'],
              ))
          ..details = snapshot.data['details']
          ..code = snapshot.data['code']
          ..title = snapshot.data['title']
          ..dealClicks = snapshot.data['dealClicks']?.round()
          ..conditions = snapshot.data['conditions']
          ..promoted = snapshot.data['promoted']
          ..promotedExpiry = safeGet(() => DateTime.fromMillisecondsSinceEpoch(
              snapshot.data['promotedExpiry']))
          ..userSaved = safeGet(() =>
              ListBuilder(snapshot.data['userSaved'].map((s) => toRef(s))))
          ..needsRedeemed = snapshot.data['needsRedeemed']
          ..whoRedeemed = safeGet(() =>
              ListBuilder(snapshot.data['whoRedeemed'].map((s) => toRef(s))))
          ..dealAmount = snapshot.data['dealAmount']?.round()
          ..ffRef = DealsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<DealsRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'deals',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  DealsRecord._();
  factory DealsRecord([void Function(DealsRecordBuilder) updates]) =
      _$DealsRecord;

  static DealsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDealsRecordData({
  DocumentReference? restRef,
  DateTime? expiry,
  bool? active,
  LatLng? location,
  String? details,
  String? code,
  String? title,
  int? dealClicks,
  String? conditions,
  bool? promoted,
  DateTime? promotedExpiry,
  bool? needsRedeemed,
  int? dealAmount,
}) {
  final firestoreData = serializers.toFirestore(
    DealsRecord.serializer,
    DealsRecord(
      (d) => d
        ..restRef = restRef
        ..expiry = expiry
        ..active = active
        ..location = location
        ..details = details
        ..code = code
        ..title = title
        ..dealClicks = dealClicks
        ..conditions = conditions
        ..promoted = promoted
        ..promotedExpiry = promotedExpiry
        ..userSaved = null
        ..needsRedeemed = needsRedeemed
        ..whoRedeemed = null
        ..dealAmount = dealAmount,
    ),
  );

  return firestoreData;
}

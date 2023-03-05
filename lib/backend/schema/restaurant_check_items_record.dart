import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'restaurant_check_items_record.g.dart';

abstract class RestaurantCheckItemsRecord
    implements
        Built<RestaurantCheckItemsRecord, RestaurantCheckItemsRecordBuilder> {
  static Serializer<RestaurantCheckItemsRecord> get serializer =>
      _$restaurantCheckItemsRecordSerializer;

  String? get itemName;

  String? get groupName;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(RestaurantCheckItemsRecordBuilder builder) =>
      builder
        ..itemName = ''
        ..groupName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('restaurantCheckItems');

  static Stream<RestaurantCheckItemsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RestaurantCheckItemsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  RestaurantCheckItemsRecord._();
  factory RestaurantCheckItemsRecord(
          [void Function(RestaurantCheckItemsRecordBuilder) updates]) =
      _$RestaurantCheckItemsRecord;

  static RestaurantCheckItemsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRestaurantCheckItemsRecordData({
  String? itemName,
  String? groupName,
}) {
  final firestoreData = serializers.toFirestore(
    RestaurantCheckItemsRecord.serializer,
    RestaurantCheckItemsRecord(
      (r) => r
        ..itemName = itemName
        ..groupName = groupName,
    ),
  );

  return firestoreData;
}

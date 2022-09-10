import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'in_cart_item_record.g.dart';

abstract class InCartItemRecord
    implements Built<InCartItemRecord, InCartItemRecordBuilder> {
  static Serializer<InCartItemRecord> get serializer =>
      _$inCartItemRecordSerializer;

  DocumentReference? get menuItem;

  double? get price;

  double? get quantity;

  DocumentReference? get user;

  String? get specialNote;

  DateTime? get timeAdded;

  BuiltList<bool>? get options;

  BuiltList<DocumentReference>? get option1;

  BuiltList<String>? get optionsNames;

  DocumentReference? get bag;

  bool? get active;

  DocumentReference? get restaurantRef;

  DocumentReference? get shoppingBag;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(InCartItemRecordBuilder builder) => builder
    ..price = 0.0
    ..quantity = 0.0
    ..specialNote = ''
    ..options = ListBuilder()
    ..option1 = ListBuilder()
    ..optionsNames = ListBuilder()
    ..active = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('inCartItem');

  static Stream<InCartItemRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<InCartItemRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  InCartItemRecord._();
  factory InCartItemRecord([void Function(InCartItemRecordBuilder) updates]) =
      _$InCartItemRecord;

  static InCartItemRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createInCartItemRecordData({
  DocumentReference? menuItem,
  double? price,
  double? quantity,
  DocumentReference? user,
  String? specialNote,
  DateTime? timeAdded,
  DocumentReference? bag,
  bool? active,
  DocumentReference? restaurantRef,
  DocumentReference? shoppingBag,
}) {
  final firestoreData = serializers.toFirestore(
    InCartItemRecord.serializer,
    InCartItemRecord(
      (i) => i
        ..menuItem = menuItem
        ..price = price
        ..quantity = quantity
        ..user = user
        ..specialNote = specialNote
        ..timeAdded = timeAdded
        ..options = null
        ..option1 = null
        ..optionsNames = null
        ..bag = bag
        ..active = active
        ..restaurantRef = restaurantRef
        ..shoppingBag = shoppingBag,
    ),
  );

  return firestoreData;
}

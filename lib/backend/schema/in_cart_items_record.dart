import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'in_cart_items_record.g.dart';

abstract class InCartItemsRecord
    implements Built<InCartItemsRecord, InCartItemsRecordBuilder> {
  static Serializer<InCartItemsRecord> get serializer =>
      _$inCartItemsRecordSerializer;

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

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(InCartItemsRecordBuilder builder) => builder
    ..price = 0.0
    ..quantity = 0.0
    ..specialNote = ''
    ..options = ListBuilder()
    ..option1 = ListBuilder()
    ..optionsNames = ListBuilder()
    ..active = false;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('inCartItems')
          : FirebaseFirestore.instance.collectionGroup('inCartItems');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('inCartItems').doc();

  static Stream<InCartItemsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<InCartItemsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  InCartItemsRecord._();
  factory InCartItemsRecord([void Function(InCartItemsRecordBuilder) updates]) =
      _$InCartItemsRecord;

  static InCartItemsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createInCartItemsRecordData({
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
    InCartItemsRecord.serializer,
    InCartItemsRecord(
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

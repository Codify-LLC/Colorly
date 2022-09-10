import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'shopping_bag_record.g.dart';

abstract class ShoppingBagRecord
    implements Built<ShoppingBagRecord, ShoppingBagRecordBuilder> {
  static Serializer<ShoppingBagRecord> get serializer =>
      _$shoppingBagRecordSerializer;

  DateTime? get created;

  BuiltList<DocumentReference>? get inCartItemsRef;

  DocumentReference? get user;

  bool? get paid;

  bool? get delivery;

  String? get orderNumber;

  double? get orderTotal;

  DocumentReference? get restaurantRef;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ShoppingBagRecordBuilder builder) => builder
    ..inCartItemsRef = ListBuilder()
    ..paid = false
    ..delivery = false
    ..orderNumber = ''
    ..orderTotal = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('shoppingBag');

  static Stream<ShoppingBagRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ShoppingBagRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ShoppingBagRecord._();
  factory ShoppingBagRecord([void Function(ShoppingBagRecordBuilder) updates]) =
      _$ShoppingBagRecord;

  static ShoppingBagRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createShoppingBagRecordData({
  DateTime? created,
  DocumentReference? user,
  bool? paid,
  bool? delivery,
  String? orderNumber,
  double? orderTotal,
  DocumentReference? restaurantRef,
}) {
  final firestoreData = serializers.toFirestore(
    ShoppingBagRecord.serializer,
    ShoppingBagRecord(
      (s) => s
        ..created = created
        ..inCartItemsRef = null
        ..user = user
        ..paid = paid
        ..delivery = delivery
        ..orderNumber = orderNumber
        ..orderTotal = orderTotal
        ..restaurantRef = restaurantRef,
    ),
  );

  return firestoreData;
}

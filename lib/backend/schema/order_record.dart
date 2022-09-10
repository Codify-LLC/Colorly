import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'order_record.g.dart';

abstract class OrderRecord implements Built<OrderRecord, OrderRecordBuilder> {
  static Serializer<OrderRecord> get serializer => _$orderRecordSerializer;

  DocumentReference? get user;

  DocumentReference? get restaurant;

  String? get orderNumber;

  BuiltList<DocumentReference>? get orderItems;

  bool? get paid;

  BuiltList<DocumentReference>? get inCartItems;

  double? get orderTotal;

  String? get type;

  bool? get submitted;

  bool? get confirmed;

  bool? get preparing;

  bool? get ready;

  DateTime? get timestamp;

  DocumentReference? get shoppingBag;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(OrderRecordBuilder builder) => builder
    ..orderNumber = ''
    ..orderItems = ListBuilder()
    ..paid = false
    ..inCartItems = ListBuilder()
    ..orderTotal = 0.0
    ..type = ''
    ..submitted = false
    ..confirmed = false
    ..preparing = false
    ..ready = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('order');

  static Stream<OrderRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<OrderRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  OrderRecord._();
  factory OrderRecord([void Function(OrderRecordBuilder) updates]) =
      _$OrderRecord;

  static OrderRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createOrderRecordData({
  DocumentReference? user,
  DocumentReference? restaurant,
  String? orderNumber,
  bool? paid,
  double? orderTotal,
  String? type,
  bool? submitted,
  bool? confirmed,
  bool? preparing,
  bool? ready,
  DateTime? timestamp,
  DocumentReference? shoppingBag,
}) {
  final firestoreData = serializers.toFirestore(
    OrderRecord.serializer,
    OrderRecord(
      (o) => o
        ..user = user
        ..restaurant = restaurant
        ..orderNumber = orderNumber
        ..orderItems = null
        ..paid = paid
        ..inCartItems = null
        ..orderTotal = orderTotal
        ..type = type
        ..submitted = submitted
        ..confirmed = confirmed
        ..preparing = preparing
        ..ready = ready
        ..timestamp = timestamp
        ..shoppingBag = shoppingBag,
    ),
  );

  return firestoreData;
}

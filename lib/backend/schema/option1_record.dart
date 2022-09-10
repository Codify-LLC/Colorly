import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'option1_record.g.dart';

abstract class Option1Record
    implements Built<Option1Record, Option1RecordBuilder> {
  static Serializer<Option1Record> get serializer => _$option1RecordSerializer;

  String? get option1Name;

  String? get option1Title;

  DocumentReference? get menuItemRef;

  bool? get hasOption1;

  BuiltList<String>? get options;

  double? get option1Price;

  DocumentReference? get inCartItemRef;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(Option1RecordBuilder builder) => builder
    ..option1Name = ''
    ..option1Title = ''
    ..hasOption1 = false
    ..options = ListBuilder()
    ..option1Price = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('option1');

  static Stream<Option1Record> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<Option1Record> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  Option1Record._();
  factory Option1Record([void Function(Option1RecordBuilder) updates]) =
      _$Option1Record;

  static Option1Record getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createOption1RecordData({
  String? option1Name,
  String? option1Title,
  DocumentReference? menuItemRef,
  bool? hasOption1,
  double? option1Price,
  DocumentReference? inCartItemRef,
}) {
  final firestoreData = serializers.toFirestore(
    Option1Record.serializer,
    Option1Record(
      (o) => o
        ..option1Name = option1Name
        ..option1Title = option1Title
        ..menuItemRef = menuItemRef
        ..hasOption1 = hasOption1
        ..options = null
        ..option1Price = option1Price
        ..inCartItemRef = inCartItemRef,
    ),
  );

  return firestoreData;
}

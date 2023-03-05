import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'menu_item_record.g.dart';

abstract class MenuItemRecord
    implements Built<MenuItemRecord, MenuItemRecordBuilder> {
  static Serializer<MenuItemRecord> get serializer =>
      _$menuItemRecordSerializer;

  String? get itemName;

  String? get itemDescription;

  String? get itemImage;

  DocumentReference? get restRef;

  DocumentReference? get userRef;

  DateTime? get createdAt;

  DocumentReference? get courseRef;

  double? get itemPrice;

  bool? get featuredItem;

  int? get number;

  BuiltList<DocumentReference>? get modifiers;

  BuiltList<String>? get modifier;

  BuiltList<DocumentReference>? get options;

  BuiltList<String>? get optionStrings;

  DocumentReference? get option1;

  bool? get hasOption1;

  bool? get hasOption2;

  bool? get hasOption3;

  bool? get hasOption4;

  bool? get hasOption5;

  BuiltList<DocumentReference>? get options1;

  BuiltList<String>? get uploadedPhotos;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MenuItemRecordBuilder builder) => builder
    ..itemName = ''
    ..itemDescription = ''
    ..itemImage = ''
    ..itemPrice = 0.0
    ..featuredItem = false
    ..number = 0
    ..modifiers = ListBuilder()
    ..modifier = ListBuilder()
    ..options = ListBuilder()
    ..optionStrings = ListBuilder()
    ..hasOption1 = false
    ..hasOption2 = false
    ..hasOption3 = false
    ..hasOption4 = false
    ..hasOption5 = false
    ..options1 = ListBuilder()
    ..uploadedPhotos = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('menuItem');

  static Stream<MenuItemRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MenuItemRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static MenuItemRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      MenuItemRecord(
        (c) => c
          ..itemName = snapshot.data['itemName']
          ..itemDescription = snapshot.data['itemDescription']
          ..itemImage = snapshot.data['itemImage']
          ..restRef = safeGet(() => toRef(snapshot.data['restRef']))
          ..userRef = safeGet(() => toRef(snapshot.data['userRef']))
          ..createdAt = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['createdAt']))
          ..courseRef = safeGet(() => toRef(snapshot.data['courseRef']))
          ..itemPrice = snapshot.data['itemPrice']?.toDouble()
          ..featuredItem = snapshot.data['featuredItem']
          ..number = snapshot.data['number']?.round()
          ..modifiers = safeGet(() =>
              ListBuilder(snapshot.data['modifiers'].map((s) => toRef(s))))
          ..modifier = safeGet(() => ListBuilder(snapshot.data['modifier']))
          ..options = safeGet(
              () => ListBuilder(snapshot.data['options'].map((s) => toRef(s))))
          ..optionStrings =
              safeGet(() => ListBuilder(snapshot.data['optionStrings']))
          ..option1 = safeGet(() => toRef(snapshot.data['option1']))
          ..hasOption1 = snapshot.data['hasOption1']
          ..hasOption2 = snapshot.data['hasOption2']
          ..hasOption3 = snapshot.data['hasOption3']
          ..hasOption4 = snapshot.data['hasOption4']
          ..hasOption5 = snapshot.data['hasOption5']
          ..options1 = safeGet(
              () => ListBuilder(snapshot.data['options1'].map((s) => toRef(s))))
          ..uploadedPhotos =
              safeGet(() => ListBuilder(snapshot.data['uploadedPhotos']))
          ..ffRef = MenuItemRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<MenuItemRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'menuItem',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  MenuItemRecord._();
  factory MenuItemRecord([void Function(MenuItemRecordBuilder) updates]) =
      _$MenuItemRecord;

  static MenuItemRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMenuItemRecordData({
  String? itemName,
  String? itemDescription,
  String? itemImage,
  DocumentReference? restRef,
  DocumentReference? userRef,
  DateTime? createdAt,
  DocumentReference? courseRef,
  double? itemPrice,
  bool? featuredItem,
  int? number,
  DocumentReference? option1,
  bool? hasOption1,
  bool? hasOption2,
  bool? hasOption3,
  bool? hasOption4,
  bool? hasOption5,
}) {
  final firestoreData = serializers.toFirestore(
    MenuItemRecord.serializer,
    MenuItemRecord(
      (m) => m
        ..itemName = itemName
        ..itemDescription = itemDescription
        ..itemImage = itemImage
        ..restRef = restRef
        ..userRef = userRef
        ..createdAt = createdAt
        ..courseRef = courseRef
        ..itemPrice = itemPrice
        ..featuredItem = featuredItem
        ..number = number
        ..modifiers = null
        ..modifier = null
        ..options = null
        ..optionStrings = null
        ..option1 = option1
        ..hasOption1 = hasOption1
        ..hasOption2 = hasOption2
        ..hasOption3 = hasOption3
        ..hasOption4 = hasOption4
        ..hasOption5 = hasOption5
        ..options1 = null
        ..uploadedPhotos = null,
    ),
  );

  return firestoreData;
}

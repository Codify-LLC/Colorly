import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'likes_record.g.dart';

abstract class LikesRecord implements Built<LikesRecord, LikesRecordBuilder> {
  static Serializer<LikesRecord> get serializer => _$likesRecordSerializer;

  BuiltList<DocumentReference>? get whoLikedReference;

  DocumentReference? get postReference;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(LikesRecordBuilder builder) =>
      builder..whoLikedReference = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('likes');

  static Stream<LikesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<LikesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  LikesRecord._();
  factory LikesRecord([void Function(LikesRecordBuilder) updates]) =
      _$LikesRecord;

  static LikesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createLikesRecordData({
  DocumentReference? postReference,
}) {
  final firestoreData = serializers.toFirestore(
    LikesRecord.serializer,
    LikesRecord(
      (l) => l
        ..whoLikedReference = null
        ..postReference = postReference,
    ),
  );

  return firestoreData;
}

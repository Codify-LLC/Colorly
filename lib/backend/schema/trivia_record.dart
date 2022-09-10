import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'trivia_record.g.dart';

abstract class TriviaRecord
    implements Built<TriviaRecord, TriviaRecordBuilder> {
  static Serializer<TriviaRecord> get serializer => _$triviaRecordSerializer;

  DocumentReference? get stream;

  bool? get current;

  String? get answer1;

  String? get answer2;

  String? get answer3;

  String? get answer4;

  String? get correctAnswer;

  String? get question;

  bool? get has1;

  bool? get has2;

  bool? get has3;

  bool? get has4;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TriviaRecordBuilder builder) => builder
    ..current = false
    ..answer1 = ''
    ..answer2 = ''
    ..answer3 = ''
    ..answer4 = ''
    ..correctAnswer = ''
    ..question = ''
    ..has1 = false
    ..has2 = false
    ..has3 = false
    ..has4 = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('trivia');

  static Stream<TriviaRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TriviaRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TriviaRecord._();
  factory TriviaRecord([void Function(TriviaRecordBuilder) updates]) =
      _$TriviaRecord;

  static TriviaRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTriviaRecordData({
  DocumentReference? stream,
  bool? current,
  String? answer1,
  String? answer2,
  String? answer3,
  String? answer4,
  String? correctAnswer,
  String? question,
  bool? has1,
  bool? has2,
  bool? has3,
  bool? has4,
}) {
  final firestoreData = serializers.toFirestore(
    TriviaRecord.serializer,
    TriviaRecord(
      (t) => t
        ..stream = stream
        ..current = current
        ..answer1 = answer1
        ..answer2 = answer2
        ..answer3 = answer3
        ..answer4 = answer4
        ..correctAnswer = correctAnswer
        ..question = question
        ..has1 = has1
        ..has2 = has2
        ..has3 = has3
        ..has4 = has4,
    ),
  );

  return firestoreData;
}

import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'poll_record.g.dart';

abstract class PollRecord implements Built<PollRecord, PollRecordBuilder> {
  static Serializer<PollRecord> get serializer => _$pollRecordSerializer;

  DocumentReference? get stream;

  bool? get current;

  String? get question;

  String? get answer1;

  String? get answer2;

  String? get answer3;

  String? get answer4;

  int? get totalAnswersGiven;

  bool? get has1;

  bool? get has2;

  bool? get has3;

  bool? get has4;

  double? get answer1Stats;

  double? get answer2Stats;

  double? get answer3Stats;

  double? get answer4Stats;

  DateTime? get created;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PollRecordBuilder builder) => builder
    ..current = false
    ..question = ''
    ..answer1 = ''
    ..answer2 = ''
    ..answer3 = ''
    ..answer4 = ''
    ..totalAnswersGiven = 0
    ..has1 = false
    ..has2 = false
    ..has3 = false
    ..has4 = false
    ..answer1Stats = 0.0
    ..answer2Stats = 0.0
    ..answer3Stats = 0.0
    ..answer4Stats = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('poll');

  static Stream<PollRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PollRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PollRecord._();
  factory PollRecord([void Function(PollRecordBuilder) updates]) = _$PollRecord;

  static PollRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPollRecordData({
  DocumentReference? stream,
  bool? current,
  String? question,
  String? answer1,
  String? answer2,
  String? answer3,
  String? answer4,
  int? totalAnswersGiven,
  bool? has1,
  bool? has2,
  bool? has3,
  bool? has4,
  double? answer1Stats,
  double? answer2Stats,
  double? answer3Stats,
  double? answer4Stats,
  DateTime? created,
}) {
  final firestoreData = serializers.toFirestore(
    PollRecord.serializer,
    PollRecord(
      (p) => p
        ..stream = stream
        ..current = current
        ..question = question
        ..answer1 = answer1
        ..answer2 = answer2
        ..answer3 = answer3
        ..answer4 = answer4
        ..totalAnswersGiven = totalAnswersGiven
        ..has1 = has1
        ..has2 = has2
        ..has3 = has3
        ..has4 = has4
        ..answer1Stats = answer1Stats
        ..answer2Stats = answer2Stats
        ..answer3Stats = answer3Stats
        ..answer4Stats = answer4Stats
        ..created = created,
    ),
  );

  return firestoreData;
}

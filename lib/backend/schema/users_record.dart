import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  String? get uid;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  String? get username;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get email;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  String? get bio;

  @BuiltValueField(wireName: 'instagram_url')
  String? get instagramUrl;

  @BuiltValueField(wireName: 'facebook_url')
  String? get facebookUrl;

  @BuiltValueField(wireName: 'tiktok_url')
  String? get tiktokUrl;

  String? get website;

  bool? get isRestaurant;

  DocumentReference? get restaurantConnect;

  BuiltList<DocumentReference>? get followers;

  BuiltList<DocumentReference>? get following;

  BuiltList<int>? get flavor;

  BuiltList<DocumentReference>? get restConnections;

  int? get flavorTotal;

  bool? get acceptsTerms;

  BuiltList<DocumentReference>? get blockedUsers;

  BuiltList<DocumentReference>? get bookmarked;

  BuiltList<DocumentReference>? get isFlagged;

  BuiltList<DocumentReference>? get whoFollowed;

  bool? get superAdmin;

  BuiltList<String>? get city;

  BuiltList<DocumentReference>? get orders;

  DocumentReference? get order;

  bool? get currentOrder;

  bool? get isPremium;

  BuiltList<DocumentReference>? get shoppingCart;

  BuiltList<DocumentReference>? get deals;

  BuiltList<DocumentReference>? get usedDeals;

  bool? get hasFacebook;

  bool? get hasInstagram;

  bool? get hasTikTok;

  bool? get hasLink;

  int? get fizzzCoin;

  int? get fizzzMonthly;

  BuiltList<DocumentReference>? get savedPosts;

  DocumentReference? get adventureRef;

  bool? get hasAdventure;

  String? get qrCode;

  DocumentReference? get addNumberRef;

  DocumentReference? get orderingRestaurant;

  bool? get hasOrderingRestaurant;

  DocumentReference? get shoppingBag;

  String? get address;

  LatLng? get locationDelivery;

  int? get reviews;

  int? get distanceToRestaurant;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..uid = ''
    ..displayName = ''
    ..username = ''
    ..photoUrl = ''
    ..email = ''
    ..phoneNumber = ''
    ..bio = ''
    ..instagramUrl = ''
    ..facebookUrl = ''
    ..tiktokUrl = ''
    ..website = ''
    ..isRestaurant = false
    ..followers = ListBuilder()
    ..following = ListBuilder()
    ..flavor = ListBuilder()
    ..restConnections = ListBuilder()
    ..flavorTotal = 0
    ..acceptsTerms = false
    ..blockedUsers = ListBuilder()
    ..bookmarked = ListBuilder()
    ..isFlagged = ListBuilder()
    ..whoFollowed = ListBuilder()
    ..superAdmin = false
    ..city = ListBuilder()
    ..orders = ListBuilder()
    ..currentOrder = false
    ..isPremium = false
    ..shoppingCart = ListBuilder()
    ..deals = ListBuilder()
    ..usedDeals = ListBuilder()
    ..hasFacebook = false
    ..hasInstagram = false
    ..hasTikTok = false
    ..hasLink = false
    ..fizzzCoin = 0
    ..fizzzMonthly = 0
    ..savedPosts = ListBuilder()
    ..hasAdventure = false
    ..qrCode = ''
    ..hasOrderingRestaurant = false
    ..address = ''
    ..reviews = 0
    ..distanceToRestaurant = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => UsersRecord(
        (c) => c
          ..uid = snapshot.data['uid']
          ..displayName = snapshot.data['display_name']
          ..username = snapshot.data['username']
          ..photoUrl = snapshot.data['photo_url']
          ..email = snapshot.data['email']
          ..phoneNumber = snapshot.data['phone_number']
          ..createdTime = safeGet(() => DateTime.fromMillisecondsSinceEpoch(
              snapshot.data['created_time']))
          ..bio = snapshot.data['bio']
          ..instagramUrl = snapshot.data['instagram_url']
          ..facebookUrl = snapshot.data['facebook_url']
          ..tiktokUrl = snapshot.data['tiktok_url']
          ..website = snapshot.data['website']
          ..isRestaurant = snapshot.data['isRestaurant']
          ..restaurantConnect =
              safeGet(() => toRef(snapshot.data['restaurantConnect']))
          ..followers = safeGet(() =>
              ListBuilder(snapshot.data['followers'].map((s) => toRef(s))))
          ..following = safeGet(() =>
              ListBuilder(snapshot.data['following'].map((s) => toRef(s))))
          ..flavor =
              safeGet(() => ListBuilder(snapshot.data['flavor']?.round()))
          ..restConnections = safeGet(() => ListBuilder(
              snapshot.data['restConnections'].map((s) => toRef(s))))
          ..flavorTotal = snapshot.data['flavorTotal']?.round()
          ..acceptsTerms = snapshot.data['acceptsTerms']
          ..blockedUsers = safeGet(() =>
              ListBuilder(snapshot.data['blockedUsers'].map((s) => toRef(s))))
          ..bookmarked = safeGet(() =>
              ListBuilder(snapshot.data['bookmarked'].map((s) => toRef(s))))
          ..isFlagged = safeGet(() =>
              ListBuilder(snapshot.data['isFlagged'].map((s) => toRef(s))))
          ..whoFollowed = safeGet(() =>
              ListBuilder(snapshot.data['whoFollowed'].map((s) => toRef(s))))
          ..superAdmin = snapshot.data['superAdmin']
          ..city = safeGet(() => ListBuilder(snapshot.data['city']))
          ..orders = safeGet(
              () => ListBuilder(snapshot.data['orders'].map((s) => toRef(s))))
          ..order = safeGet(() => toRef(snapshot.data['order']))
          ..currentOrder = snapshot.data['currentOrder']
          ..isPremium = snapshot.data['isPremium']
          ..shoppingCart = safeGet(() =>
              ListBuilder(snapshot.data['shoppingCart'].map((s) => toRef(s))))
          ..deals = safeGet(
              () => ListBuilder(snapshot.data['deals'].map((s) => toRef(s))))
          ..usedDeals = safeGet(() =>
              ListBuilder(snapshot.data['usedDeals'].map((s) => toRef(s))))
          ..hasFacebook = snapshot.data['hasFacebook']
          ..hasInstagram = snapshot.data['hasInstagram']
          ..hasTikTok = snapshot.data['hasTikTok']
          ..hasLink = snapshot.data['hasLink']
          ..fizzzCoin = snapshot.data['fizzzCoin']?.round()
          ..fizzzMonthly = snapshot.data['fizzzMonthly']?.round()
          ..savedPosts = safeGet(() =>
              ListBuilder(snapshot.data['savedPosts'].map((s) => toRef(s))))
          ..adventureRef = safeGet(() => toRef(snapshot.data['adventureRef']))
          ..hasAdventure = snapshot.data['hasAdventure']
          ..qrCode = snapshot.data['qrCode']
          ..addNumberRef = safeGet(() => toRef(snapshot.data['addNumberRef']))
          ..orderingRestaurant =
              safeGet(() => toRef(snapshot.data['orderingRestaurant']))
          ..hasOrderingRestaurant = snapshot.data['hasOrderingRestaurant']
          ..shoppingBag = safeGet(() => toRef(snapshot.data['shoppingBag']))
          ..address = snapshot.data['address']
          ..locationDelivery = safeGet(() => LatLng(
                snapshot.data['_geoloc']['lat'],
                snapshot.data['_geoloc']['lng'],
              ))
          ..reviews = snapshot.data['reviews']?.round()
          ..distanceToRestaurant =
              snapshot.data['distanceToRestaurant']?.round()
          ..ffRef = UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsersRecordData({
  String? uid,
  String? displayName,
  String? username,
  String? photoUrl,
  String? email,
  String? phoneNumber,
  DateTime? createdTime,
  String? bio,
  String? instagramUrl,
  String? facebookUrl,
  String? tiktokUrl,
  String? website,
  bool? isRestaurant,
  DocumentReference? restaurantConnect,
  int? flavorTotal,
  bool? acceptsTerms,
  bool? superAdmin,
  DocumentReference? order,
  bool? currentOrder,
  bool? isPremium,
  bool? hasFacebook,
  bool? hasInstagram,
  bool? hasTikTok,
  bool? hasLink,
  int? fizzzCoin,
  int? fizzzMonthly,
  DocumentReference? adventureRef,
  bool? hasAdventure,
  String? qrCode,
  DocumentReference? addNumberRef,
  DocumentReference? orderingRestaurant,
  bool? hasOrderingRestaurant,
  DocumentReference? shoppingBag,
  String? address,
  LatLng? locationDelivery,
  int? reviews,
  int? distanceToRestaurant,
}) {
  final firestoreData = serializers.toFirestore(
    UsersRecord.serializer,
    UsersRecord(
      (u) => u
        ..uid = uid
        ..displayName = displayName
        ..username = username
        ..photoUrl = photoUrl
        ..email = email
        ..phoneNumber = phoneNumber
        ..createdTime = createdTime
        ..bio = bio
        ..instagramUrl = instagramUrl
        ..facebookUrl = facebookUrl
        ..tiktokUrl = tiktokUrl
        ..website = website
        ..isRestaurant = isRestaurant
        ..restaurantConnect = restaurantConnect
        ..followers = null
        ..following = null
        ..flavor = null
        ..restConnections = null
        ..flavorTotal = flavorTotal
        ..acceptsTerms = acceptsTerms
        ..blockedUsers = null
        ..bookmarked = null
        ..isFlagged = null
        ..whoFollowed = null
        ..superAdmin = superAdmin
        ..city = null
        ..orders = null
        ..order = order
        ..currentOrder = currentOrder
        ..isPremium = isPremium
        ..shoppingCart = null
        ..deals = null
        ..usedDeals = null
        ..hasFacebook = hasFacebook
        ..hasInstagram = hasInstagram
        ..hasTikTok = hasTikTok
        ..hasLink = hasLink
        ..fizzzCoin = fizzzCoin
        ..fizzzMonthly = fizzzMonthly
        ..savedPosts = null
        ..adventureRef = adventureRef
        ..hasAdventure = hasAdventure
        ..qrCode = qrCode
        ..addNumberRef = addNumberRef
        ..orderingRestaurant = orderingRestaurant
        ..hasOrderingRestaurant = hasOrderingRestaurant
        ..shoppingBag = shoppingBag
        ..address = address
        ..locationDelivery = locationDelivery
        ..reviews = reviews
        ..distanceToRestaurant = distanceToRestaurant,
    ),
  );

  return firestoreData;
}

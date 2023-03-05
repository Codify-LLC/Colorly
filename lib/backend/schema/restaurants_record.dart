import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'restaurants_record.g.dart';

abstract class RestaurantsRecord
    implements Built<RestaurantsRecord, RestaurantsRecordBuilder> {
  static Serializer<RestaurantsRecord> get serializer =>
      _$restaurantsRecordSerializer;

  @BuiltValueField(wireName: 'restaurant_name')
  String? get restaurantName;

  @BuiltValueField(wireName: 'Logo')
  String? get logo;

  @BuiltValueField(wireName: 'Featured_image')
  String? get featuredImage;

  @BuiltValueField(wireName: 'rest_lat_long')
  LatLng? get restLatLong;

  String? get city;

  String? get email;

  String? get website;

  @BuiltValueField(wireName: 'price_range')
  String? get priceRange;

  @BuiltValueField(wireName: 'rest_slogan')
  String? get restSlogan;

  @BuiltValueField(wireName: 'rest_address')
  String? get restAddress;

  int? get reviews;

  @BuiltValueField(wireName: 'rest_description')
  String? get restDescription;

  String? get categories;

  double? get rating;

  DocumentReference? get userConnection;

  BuiltList<String>? get gallery;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  String? get mondayHours;

  String? get tuesdayHours;

  String? get wednesdayHours;

  String? get thursdayHours;

  String? get fridayHours;

  String? get saturdayHours;

  String? get sundayHours;

  BuiltList<DocumentReference>? get whoBookmarked;

  String? get highlight1;

  String? get highlight2;

  DateTime? get expiryTime;

  bool? get promotedValid;

  bool? get isSubscribed;

  int? get storyClicks;

  int? get learnMoreClicks;

  int? get phoneClicks;

  int? get websiteClicks;

  int? get mapClicks;

  BuiltList<DocumentReference>? get menuItems;

  BuiltList<String>? get menuCourses;

  BuiltList<DocumentReference>? get menuCourseRef;

  String? get videoTour;

  String? get onlineOrderLink;

  int? get orderNowClicks;

  bool? get delivery;

  bool? get takeout;

  bool? get wifi;

  bool? get birthdayFreebies;

  bool? get happyHour;

  bool? get reservations;

  bool? get tableService;

  bool? get mobileRewards;

  bool? get standalone;

  int? get cardClicks;

  bool? get hasAdNumber;

  String? get doordash;

  String? get grubhub;

  String? get postmates;

  String? get ubereats;

  String? get instacart;

  String? get chownow;

  bool? get hasDoordash;

  bool? get hasGrubhub;

  bool? get hasPostmates;

  bool? get hasUbereats;

  bool? get hasInstacart;

  bool? get hasChownow;

  String? get clustertruck;

  bool? get hasClustertruck;

  DocumentReference? get addNumberRef;

  int? get adNumber;

  int? get pickupTime;

  int? get deliveryTime;

  int? get deliveryFee;

  BuiltList<DocumentReference>? get curatedLists;

  int? get deliveryRange;

  BuiltList<String>? get cats;

  double? get foodMeter;

  double? get serviceMeter;

  double? get cleanlinessMeter;

  int? get checkedInCount;

  BuiltList<DocumentReference>? get checkedIn;

  BuiltList<String>? get accessabilities;

  BuiltList<String>? get amenities;

  BuiltList<String>? get crowd;

  BuiltList<String>? get diningOptions;

  BuiltList<String>? get highlights;

  BuiltList<String>? get offerings;

  BuiltList<String>? get payments;

  BuiltList<String>? get planning;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(RestaurantsRecordBuilder builder) => builder
    ..restaurantName = ''
    ..logo = ''
    ..featuredImage = ''
    ..city = ''
    ..email = ''
    ..website = ''
    ..priceRange = ''
    ..restSlogan = ''
    ..restAddress = ''
    ..reviews = 0
    ..restDescription = ''
    ..categories = ''
    ..rating = 0.0
    ..gallery = ListBuilder()
    ..phoneNumber = ''
    ..mondayHours = ''
    ..tuesdayHours = ''
    ..wednesdayHours = ''
    ..thursdayHours = ''
    ..fridayHours = ''
    ..saturdayHours = ''
    ..sundayHours = ''
    ..whoBookmarked = ListBuilder()
    ..highlight1 = ''
    ..highlight2 = ''
    ..promotedValid = false
    ..isSubscribed = false
    ..storyClicks = 0
    ..learnMoreClicks = 0
    ..phoneClicks = 0
    ..websiteClicks = 0
    ..mapClicks = 0
    ..menuItems = ListBuilder()
    ..menuCourses = ListBuilder()
    ..menuCourseRef = ListBuilder()
    ..videoTour = ''
    ..onlineOrderLink = ''
    ..orderNowClicks = 0
    ..delivery = false
    ..takeout = false
    ..wifi = false
    ..birthdayFreebies = false
    ..happyHour = false
    ..reservations = false
    ..tableService = false
    ..mobileRewards = false
    ..standalone = false
    ..cardClicks = 0
    ..hasAdNumber = false
    ..doordash = ''
    ..grubhub = ''
    ..postmates = ''
    ..ubereats = ''
    ..instacart = ''
    ..chownow = ''
    ..hasDoordash = false
    ..hasGrubhub = false
    ..hasPostmates = false
    ..hasUbereats = false
    ..hasInstacart = false
    ..hasChownow = false
    ..clustertruck = ''
    ..hasClustertruck = false
    ..adNumber = 0
    ..pickupTime = 0
    ..deliveryTime = 0
    ..deliveryFee = 0
    ..curatedLists = ListBuilder()
    ..deliveryRange = 0
    ..cats = ListBuilder()
    ..foodMeter = 0.0
    ..serviceMeter = 0.0
    ..cleanlinessMeter = 0.0
    ..checkedInCount = 0
    ..checkedIn = ListBuilder()
    ..accessabilities = ListBuilder()
    ..amenities = ListBuilder()
    ..crowd = ListBuilder()
    ..diningOptions = ListBuilder()
    ..highlights = ListBuilder()
    ..offerings = ListBuilder()
    ..payments = ListBuilder()
    ..planning = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('restaurants');

  static Stream<RestaurantsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RestaurantsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static RestaurantsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      RestaurantsRecord(
        (c) => c
          ..restaurantName = snapshot.data['restaurant_name']
          ..logo = snapshot.data['Logo']
          ..featuredImage = snapshot.data['Featured_image']
          ..restLatLong = safeGet(() => LatLng(
                snapshot.data['_geoloc']['lat'],
                snapshot.data['_geoloc']['lng'],
              ))
          ..city = snapshot.data['city']
          ..email = snapshot.data['email']
          ..website = snapshot.data['website']
          ..priceRange = snapshot.data['price_range']
          ..restSlogan = snapshot.data['rest_slogan']
          ..restAddress = snapshot.data['rest_address']
          ..reviews = snapshot.data['reviews']?.round()
          ..restDescription = snapshot.data['rest_description']
          ..categories = snapshot.data['categories']
          ..rating = snapshot.data['rating']?.toDouble()
          ..userConnection =
              safeGet(() => toRef(snapshot.data['userConnection']))
          ..gallery = safeGet(() => ListBuilder(snapshot.data['gallery']))
          ..phoneNumber = snapshot.data['phone_number']
          ..mondayHours = snapshot.data['mondayHours']
          ..tuesdayHours = snapshot.data['tuesdayHours']
          ..wednesdayHours = snapshot.data['wednesdayHours']
          ..thursdayHours = snapshot.data['thursdayHours']
          ..fridayHours = snapshot.data['fridayHours']
          ..saturdayHours = snapshot.data['saturdayHours']
          ..sundayHours = snapshot.data['sundayHours']
          ..whoBookmarked = safeGet(() =>
              ListBuilder(snapshot.data['whoBookmarked'].map((s) => toRef(s))))
          ..highlight1 = snapshot.data['highlight1']
          ..highlight2 = snapshot.data['highlight2']
          ..expiryTime = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['expiryTime']))
          ..promotedValid = snapshot.data['promotedValid']
          ..isSubscribed = snapshot.data['isSubscribed']
          ..storyClicks = snapshot.data['storyClicks']?.round()
          ..learnMoreClicks = snapshot.data['learnMoreClicks']?.round()
          ..phoneClicks = snapshot.data['phoneClicks']?.round()
          ..websiteClicks = snapshot.data['websiteClicks']?.round()
          ..mapClicks = snapshot.data['mapClicks']?.round()
          ..menuItems = safeGet(() =>
              ListBuilder(snapshot.data['menuItems'].map((s) => toRef(s))))
          ..menuCourses =
              safeGet(() => ListBuilder(snapshot.data['menuCourses']))
          ..menuCourseRef = safeGet(() =>
              ListBuilder(snapshot.data['menuCourseRef'].map((s) => toRef(s))))
          ..videoTour = snapshot.data['videoTour']
          ..onlineOrderLink = snapshot.data['onlineOrderLink']
          ..orderNowClicks = snapshot.data['orderNowClicks']?.round()
          ..delivery = snapshot.data['delivery']
          ..takeout = snapshot.data['takeout']
          ..wifi = snapshot.data['wifi']
          ..birthdayFreebies = snapshot.data['birthdayFreebies']
          ..happyHour = snapshot.data['happyHour']
          ..reservations = snapshot.data['reservations']
          ..tableService = snapshot.data['tableService']
          ..mobileRewards = snapshot.data['mobileRewards']
          ..standalone = snapshot.data['standalone']
          ..cardClicks = snapshot.data['cardClicks']?.round()
          ..hasAdNumber = snapshot.data['hasAdNumber']
          ..doordash = snapshot.data['doordash']
          ..grubhub = snapshot.data['grubhub']
          ..postmates = snapshot.data['postmates']
          ..ubereats = snapshot.data['ubereats']
          ..instacart = snapshot.data['instacart']
          ..chownow = snapshot.data['chownow']
          ..hasDoordash = snapshot.data['hasDoordash']
          ..hasGrubhub = snapshot.data['hasGrubhub']
          ..hasPostmates = snapshot.data['hasPostmates']
          ..hasUbereats = snapshot.data['hasUbereats']
          ..hasInstacart = snapshot.data['hasInstacart']
          ..hasChownow = snapshot.data['hasChownow']
          ..clustertruck = snapshot.data['clustertruck']
          ..hasClustertruck = snapshot.data['hasClustertruck']
          ..addNumberRef = safeGet(() => toRef(snapshot.data['addNumberRef']))
          ..adNumber = snapshot.data['adNumber']?.round()
          ..pickupTime = snapshot.data['pickupTime']?.round()
          ..deliveryTime = snapshot.data['deliveryTime']?.round()
          ..deliveryFee = snapshot.data['deliveryFee']?.round()
          ..curatedLists = safeGet(() =>
              ListBuilder(snapshot.data['curatedLists'].map((s) => toRef(s))))
          ..deliveryRange = snapshot.data['deliveryRange']?.round()
          ..cats = safeGet(() => ListBuilder(snapshot.data['cats']))
          ..foodMeter = snapshot.data['foodMeter']?.toDouble()
          ..serviceMeter = snapshot.data['serviceMeter']?.toDouble()
          ..cleanlinessMeter = snapshot.data['cleanlinessMeter']?.toDouble()
          ..checkedInCount = snapshot.data['checkedInCount']?.round()
          ..checkedIn = safeGet(() =>
              ListBuilder(snapshot.data['checkedIn'].map((s) => toRef(s))))
          ..accessabilities =
              safeGet(() => ListBuilder(snapshot.data['accessabilities']))
          ..amenities = safeGet(() => ListBuilder(snapshot.data['amenities']))
          ..crowd = safeGet(() => ListBuilder(snapshot.data['crowd']))
          ..diningOptions =
              safeGet(() => ListBuilder(snapshot.data['diningOptions']))
          ..highlights = safeGet(() => ListBuilder(snapshot.data['highlights']))
          ..offerings = safeGet(() => ListBuilder(snapshot.data['offerings']))
          ..payments = safeGet(() => ListBuilder(snapshot.data['payments']))
          ..planning = safeGet(() => ListBuilder(snapshot.data['planning']))
          ..ffRef = RestaurantsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<RestaurantsRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'restaurants',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  RestaurantsRecord._();
  factory RestaurantsRecord([void Function(RestaurantsRecordBuilder) updates]) =
      _$RestaurantsRecord;

  static RestaurantsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRestaurantsRecordData({
  String? restaurantName,
  String? logo,
  String? featuredImage,
  LatLng? restLatLong,
  String? city,
  String? email,
  String? website,
  String? priceRange,
  String? restSlogan,
  String? restAddress,
  int? reviews,
  String? restDescription,
  String? categories,
  double? rating,
  DocumentReference? userConnection,
  String? phoneNumber,
  String? mondayHours,
  String? tuesdayHours,
  String? wednesdayHours,
  String? thursdayHours,
  String? fridayHours,
  String? saturdayHours,
  String? sundayHours,
  String? highlight1,
  String? highlight2,
  DateTime? expiryTime,
  bool? promotedValid,
  bool? isSubscribed,
  int? storyClicks,
  int? learnMoreClicks,
  int? phoneClicks,
  int? websiteClicks,
  int? mapClicks,
  String? videoTour,
  String? onlineOrderLink,
  int? orderNowClicks,
  bool? delivery,
  bool? takeout,
  bool? wifi,
  bool? birthdayFreebies,
  bool? happyHour,
  bool? reservations,
  bool? tableService,
  bool? mobileRewards,
  bool? standalone,
  int? cardClicks,
  bool? hasAdNumber,
  String? doordash,
  String? grubhub,
  String? postmates,
  String? ubereats,
  String? instacart,
  String? chownow,
  bool? hasDoordash,
  bool? hasGrubhub,
  bool? hasPostmates,
  bool? hasUbereats,
  bool? hasInstacart,
  bool? hasChownow,
  String? clustertruck,
  bool? hasClustertruck,
  DocumentReference? addNumberRef,
  int? adNumber,
  int? pickupTime,
  int? deliveryTime,
  int? deliveryFee,
  int? deliveryRange,
  double? foodMeter,
  double? serviceMeter,
  double? cleanlinessMeter,
  int? checkedInCount,
}) {
  final firestoreData = serializers.toFirestore(
    RestaurantsRecord.serializer,
    RestaurantsRecord(
      (r) => r
        ..restaurantName = restaurantName
        ..logo = logo
        ..featuredImage = featuredImage
        ..restLatLong = restLatLong
        ..city = city
        ..email = email
        ..website = website
        ..priceRange = priceRange
        ..restSlogan = restSlogan
        ..restAddress = restAddress
        ..reviews = reviews
        ..restDescription = restDescription
        ..categories = categories
        ..rating = rating
        ..userConnection = userConnection
        ..gallery = null
        ..phoneNumber = phoneNumber
        ..mondayHours = mondayHours
        ..tuesdayHours = tuesdayHours
        ..wednesdayHours = wednesdayHours
        ..thursdayHours = thursdayHours
        ..fridayHours = fridayHours
        ..saturdayHours = saturdayHours
        ..sundayHours = sundayHours
        ..whoBookmarked = null
        ..highlight1 = highlight1
        ..highlight2 = highlight2
        ..expiryTime = expiryTime
        ..promotedValid = promotedValid
        ..isSubscribed = isSubscribed
        ..storyClicks = storyClicks
        ..learnMoreClicks = learnMoreClicks
        ..phoneClicks = phoneClicks
        ..websiteClicks = websiteClicks
        ..mapClicks = mapClicks
        ..menuItems = null
        ..menuCourses = null
        ..menuCourseRef = null
        ..videoTour = videoTour
        ..onlineOrderLink = onlineOrderLink
        ..orderNowClicks = orderNowClicks
        ..delivery = delivery
        ..takeout = takeout
        ..wifi = wifi
        ..birthdayFreebies = birthdayFreebies
        ..happyHour = happyHour
        ..reservations = reservations
        ..tableService = tableService
        ..mobileRewards = mobileRewards
        ..standalone = standalone
        ..cardClicks = cardClicks
        ..hasAdNumber = hasAdNumber
        ..doordash = doordash
        ..grubhub = grubhub
        ..postmates = postmates
        ..ubereats = ubereats
        ..instacart = instacart
        ..chownow = chownow
        ..hasDoordash = hasDoordash
        ..hasGrubhub = hasGrubhub
        ..hasPostmates = hasPostmates
        ..hasUbereats = hasUbereats
        ..hasInstacart = hasInstacart
        ..hasChownow = hasChownow
        ..clustertruck = clustertruck
        ..hasClustertruck = hasClustertruck
        ..addNumberRef = addNumberRef
        ..adNumber = adNumber
        ..pickupTime = pickupTime
        ..deliveryTime = deliveryTime
        ..deliveryFee = deliveryFee
        ..curatedLists = null
        ..deliveryRange = deliveryRange
        ..cats = null
        ..foodMeter = foodMeter
        ..serviceMeter = serviceMeter
        ..cleanlinessMeter = cleanlinessMeter
        ..checkedInCount = checkedInCount
        ..checkedIn = null
        ..accessabilities = null
        ..amenities = null
        ..crowd = null
        ..diningOptions = null
        ..highlights = null
        ..offerings = null
        ..payments = null
        ..planning = null,
    ),
  );

  return firestoreData;
}

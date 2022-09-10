// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurants_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RestaurantsRecord> _$restaurantsRecordSerializer =
    new _$RestaurantsRecordSerializer();

class _$RestaurantsRecordSerializer
    implements StructuredSerializer<RestaurantsRecord> {
  @override
  final Iterable<Type> types = const [RestaurantsRecord, _$RestaurantsRecord];
  @override
  final String wireName = 'RestaurantsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, RestaurantsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.restaurantName;
    if (value != null) {
      result
        ..add('restaurant_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.logo;
    if (value != null) {
      result
        ..add('Logo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.featuredImage;
    if (value != null) {
      result
        ..add('Featured_image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.restLatLong;
    if (value != null) {
      result
        ..add('rest_lat_long')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.city;
    if (value != null) {
      result
        ..add('city')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.website;
    if (value != null) {
      result
        ..add('website')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.priceRange;
    if (value != null) {
      result
        ..add('price_range')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.restSlogan;
    if (value != null) {
      result
        ..add('rest_slogan')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.restAddress;
    if (value != null) {
      result
        ..add('rest_address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reviews;
    if (value != null) {
      result
        ..add('reviews')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.restDescription;
    if (value != null) {
      result
        ..add('rest_description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.categories;
    if (value != null) {
      result
        ..add('categories')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.userConnection;
    if (value != null) {
      result
        ..add('userConnection')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.gallery;
    if (value != null) {
      result
        ..add('gallery')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mondayHours;
    if (value != null) {
      result
        ..add('mondayHours')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tuesdayHours;
    if (value != null) {
      result
        ..add('tuesdayHours')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.wednesdayHours;
    if (value != null) {
      result
        ..add('wednesdayHours')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.thursdayHours;
    if (value != null) {
      result
        ..add('thursdayHours')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fridayHours;
    if (value != null) {
      result
        ..add('fridayHours')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.saturdayHours;
    if (value != null) {
      result
        ..add('saturdayHours')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sundayHours;
    if (value != null) {
      result
        ..add('sundayHours')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.whoBookmarked;
    if (value != null) {
      result
        ..add('whoBookmarked')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.highlight1;
    if (value != null) {
      result
        ..add('highlight1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.highlight2;
    if (value != null) {
      result
        ..add('highlight2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.expiryTime;
    if (value != null) {
      result
        ..add('expiryTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.promotedValid;
    if (value != null) {
      result
        ..add('promotedValid')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isSubscribed;
    if (value != null) {
      result
        ..add('isSubscribed')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.storyClicks;
    if (value != null) {
      result
        ..add('storyClicks')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.learnMoreClicks;
    if (value != null) {
      result
        ..add('learnMoreClicks')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.phoneClicks;
    if (value != null) {
      result
        ..add('phoneClicks')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.websiteClicks;
    if (value != null) {
      result
        ..add('websiteClicks')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.mapClicks;
    if (value != null) {
      result
        ..add('mapClicks')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.menuItems;
    if (value != null) {
      result
        ..add('menuItems')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.menuCourses;
    if (value != null) {
      result
        ..add('menuCourses')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.menuCourseRef;
    if (value != null) {
      result
        ..add('menuCourseRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.videoTour;
    if (value != null) {
      result
        ..add('videoTour')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.onlineOrderLink;
    if (value != null) {
      result
        ..add('onlineOrderLink')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.orderNowClicks;
    if (value != null) {
      result
        ..add('orderNowClicks')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.delivery;
    if (value != null) {
      result
        ..add('delivery')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.takeout;
    if (value != null) {
      result
        ..add('takeout')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.wifi;
    if (value != null) {
      result
        ..add('wifi')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.birthdayFreebies;
    if (value != null) {
      result
        ..add('birthdayFreebies')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.happyHour;
    if (value != null) {
      result
        ..add('happyHour')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.reservations;
    if (value != null) {
      result
        ..add('reservations')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.tableService;
    if (value != null) {
      result
        ..add('tableService')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.mobileRewards;
    if (value != null) {
      result
        ..add('mobileRewards')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.standalone;
    if (value != null) {
      result
        ..add('standalone')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.cardClicks;
    if (value != null) {
      result
        ..add('cardClicks')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.hasAdNumber;
    if (value != null) {
      result
        ..add('hasAdNumber')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.doordash;
    if (value != null) {
      result
        ..add('doordash')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.grubhub;
    if (value != null) {
      result
        ..add('grubhub')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postmates;
    if (value != null) {
      result
        ..add('postmates')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ubereats;
    if (value != null) {
      result
        ..add('ubereats')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.instacart;
    if (value != null) {
      result
        ..add('instacart')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.chownow;
    if (value != null) {
      result
        ..add('chownow')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.hasDoordash;
    if (value != null) {
      result
        ..add('hasDoordash')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.hasGrubhub;
    if (value != null) {
      result
        ..add('hasGrubhub')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.hasPostmates;
    if (value != null) {
      result
        ..add('hasPostmates')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.hasUbereats;
    if (value != null) {
      result
        ..add('hasUbereats')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.hasInstacart;
    if (value != null) {
      result
        ..add('hasInstacart')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.hasChownow;
    if (value != null) {
      result
        ..add('hasChownow')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.clustertruck;
    if (value != null) {
      result
        ..add('clustertruck')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.hasClustertruck;
    if (value != null) {
      result
        ..add('hasClustertruck')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.addNumberRef;
    if (value != null) {
      result
        ..add('addNumberRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.adNumber;
    if (value != null) {
      result
        ..add('adNumber')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pickupTime;
    if (value != null) {
      result
        ..add('pickupTime')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.deliveryTime;
    if (value != null) {
      result
        ..add('deliveryTime')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.deliveryFee;
    if (value != null) {
      result
        ..add('deliveryFee')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.curatedLists;
    if (value != null) {
      result
        ..add('curatedLists')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.deliveryRange;
    if (value != null) {
      result
        ..add('deliveryRange')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.cats;
    if (value != null) {
      result
        ..add('cats')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.foodMeter;
    if (value != null) {
      result
        ..add('foodMeter')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.serviceMeter;
    if (value != null) {
      result
        ..add('serviceMeter')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.cleanlinessMeter;
    if (value != null) {
      result
        ..add('cleanlinessMeter')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  RestaurantsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RestaurantsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'restaurant_name':
          result.restaurantName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Logo':
          result.logo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Featured_image':
          result.featuredImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rest_lat_long':
          result.restLatLong = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'website':
          result.website = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'price_range':
          result.priceRange = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rest_slogan':
          result.restSlogan = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rest_address':
          result.restAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'reviews':
          result.reviews = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'rest_description':
          result.restDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'categories':
          result.categories = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'userConnection':
          result.userConnection = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'gallery':
          result.gallery.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'mondayHours':
          result.mondayHours = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tuesdayHours':
          result.tuesdayHours = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'wednesdayHours':
          result.wednesdayHours = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'thursdayHours':
          result.thursdayHours = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'fridayHours':
          result.fridayHours = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'saturdayHours':
          result.saturdayHours = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sundayHours':
          result.sundayHours = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'whoBookmarked':
          result.whoBookmarked.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'highlight1':
          result.highlight1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'highlight2':
          result.highlight2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'expiryTime':
          result.expiryTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'promotedValid':
          result.promotedValid = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'isSubscribed':
          result.isSubscribed = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'storyClicks':
          result.storyClicks = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'learnMoreClicks':
          result.learnMoreClicks = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'phoneClicks':
          result.phoneClicks = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'websiteClicks':
          result.websiteClicks = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'mapClicks':
          result.mapClicks = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'menuItems':
          result.menuItems.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'menuCourses':
          result.menuCourses.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'menuCourseRef':
          result.menuCourseRef.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'videoTour':
          result.videoTour = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'onlineOrderLink':
          result.onlineOrderLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'orderNowClicks':
          result.orderNowClicks = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'delivery':
          result.delivery = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'takeout':
          result.takeout = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'wifi':
          result.wifi = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'birthdayFreebies':
          result.birthdayFreebies = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'happyHour':
          result.happyHour = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'reservations':
          result.reservations = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'tableService':
          result.tableService = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'mobileRewards':
          result.mobileRewards = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'standalone':
          result.standalone = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'cardClicks':
          result.cardClicks = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'hasAdNumber':
          result.hasAdNumber = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'doordash':
          result.doordash = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'grubhub':
          result.grubhub = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'postmates':
          result.postmates = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ubereats':
          result.ubereats = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'instacart':
          result.instacart = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'chownow':
          result.chownow = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'hasDoordash':
          result.hasDoordash = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'hasGrubhub':
          result.hasGrubhub = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'hasPostmates':
          result.hasPostmates = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'hasUbereats':
          result.hasUbereats = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'hasInstacart':
          result.hasInstacart = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'hasChownow':
          result.hasChownow = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'clustertruck':
          result.clustertruck = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'hasClustertruck':
          result.hasClustertruck = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'addNumberRef':
          result.addNumberRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'adNumber':
          result.adNumber = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'pickupTime':
          result.pickupTime = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'deliveryTime':
          result.deliveryTime = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'deliveryFee':
          result.deliveryFee = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'curatedLists':
          result.curatedLists.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'deliveryRange':
          result.deliveryRange = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'cats':
          result.cats.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'foodMeter':
          result.foodMeter = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'serviceMeter':
          result.serviceMeter = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'cleanlinessMeter':
          result.cleanlinessMeter = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$RestaurantsRecord extends RestaurantsRecord {
  @override
  final String? restaurantName;
  @override
  final String? logo;
  @override
  final String? featuredImage;
  @override
  final LatLng? restLatLong;
  @override
  final String? city;
  @override
  final String? email;
  @override
  final String? website;
  @override
  final String? priceRange;
  @override
  final String? restSlogan;
  @override
  final String? restAddress;
  @override
  final int? reviews;
  @override
  final String? restDescription;
  @override
  final String? categories;
  @override
  final double? rating;
  @override
  final DocumentReference<Object?>? userConnection;
  @override
  final BuiltList<String>? gallery;
  @override
  final String? phoneNumber;
  @override
  final String? mondayHours;
  @override
  final String? tuesdayHours;
  @override
  final String? wednesdayHours;
  @override
  final String? thursdayHours;
  @override
  final String? fridayHours;
  @override
  final String? saturdayHours;
  @override
  final String? sundayHours;
  @override
  final BuiltList<DocumentReference<Object?>>? whoBookmarked;
  @override
  final String? highlight1;
  @override
  final String? highlight2;
  @override
  final DateTime? expiryTime;
  @override
  final bool? promotedValid;
  @override
  final bool? isSubscribed;
  @override
  final int? storyClicks;
  @override
  final int? learnMoreClicks;
  @override
  final int? phoneClicks;
  @override
  final int? websiteClicks;
  @override
  final int? mapClicks;
  @override
  final BuiltList<DocumentReference<Object?>>? menuItems;
  @override
  final BuiltList<String>? menuCourses;
  @override
  final BuiltList<DocumentReference<Object?>>? menuCourseRef;
  @override
  final String? videoTour;
  @override
  final String? onlineOrderLink;
  @override
  final int? orderNowClicks;
  @override
  final bool? delivery;
  @override
  final bool? takeout;
  @override
  final bool? wifi;
  @override
  final bool? birthdayFreebies;
  @override
  final bool? happyHour;
  @override
  final bool? reservations;
  @override
  final bool? tableService;
  @override
  final bool? mobileRewards;
  @override
  final bool? standalone;
  @override
  final int? cardClicks;
  @override
  final bool? hasAdNumber;
  @override
  final String? doordash;
  @override
  final String? grubhub;
  @override
  final String? postmates;
  @override
  final String? ubereats;
  @override
  final String? instacart;
  @override
  final String? chownow;
  @override
  final bool? hasDoordash;
  @override
  final bool? hasGrubhub;
  @override
  final bool? hasPostmates;
  @override
  final bool? hasUbereats;
  @override
  final bool? hasInstacart;
  @override
  final bool? hasChownow;
  @override
  final String? clustertruck;
  @override
  final bool? hasClustertruck;
  @override
  final DocumentReference<Object?>? addNumberRef;
  @override
  final int? adNumber;
  @override
  final int? pickupTime;
  @override
  final int? deliveryTime;
  @override
  final int? deliveryFee;
  @override
  final BuiltList<DocumentReference<Object?>>? curatedLists;
  @override
  final int? deliveryRange;
  @override
  final BuiltList<String>? cats;
  @override
  final double? foodMeter;
  @override
  final double? serviceMeter;
  @override
  final double? cleanlinessMeter;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$RestaurantsRecord(
          [void Function(RestaurantsRecordBuilder)? updates]) =>
      (new RestaurantsRecordBuilder()..update(updates))._build();

  _$RestaurantsRecord._(
      {this.restaurantName,
      this.logo,
      this.featuredImage,
      this.restLatLong,
      this.city,
      this.email,
      this.website,
      this.priceRange,
      this.restSlogan,
      this.restAddress,
      this.reviews,
      this.restDescription,
      this.categories,
      this.rating,
      this.userConnection,
      this.gallery,
      this.phoneNumber,
      this.mondayHours,
      this.tuesdayHours,
      this.wednesdayHours,
      this.thursdayHours,
      this.fridayHours,
      this.saturdayHours,
      this.sundayHours,
      this.whoBookmarked,
      this.highlight1,
      this.highlight2,
      this.expiryTime,
      this.promotedValid,
      this.isSubscribed,
      this.storyClicks,
      this.learnMoreClicks,
      this.phoneClicks,
      this.websiteClicks,
      this.mapClicks,
      this.menuItems,
      this.menuCourses,
      this.menuCourseRef,
      this.videoTour,
      this.onlineOrderLink,
      this.orderNowClicks,
      this.delivery,
      this.takeout,
      this.wifi,
      this.birthdayFreebies,
      this.happyHour,
      this.reservations,
      this.tableService,
      this.mobileRewards,
      this.standalone,
      this.cardClicks,
      this.hasAdNumber,
      this.doordash,
      this.grubhub,
      this.postmates,
      this.ubereats,
      this.instacart,
      this.chownow,
      this.hasDoordash,
      this.hasGrubhub,
      this.hasPostmates,
      this.hasUbereats,
      this.hasInstacart,
      this.hasChownow,
      this.clustertruck,
      this.hasClustertruck,
      this.addNumberRef,
      this.adNumber,
      this.pickupTime,
      this.deliveryTime,
      this.deliveryFee,
      this.curatedLists,
      this.deliveryRange,
      this.cats,
      this.foodMeter,
      this.serviceMeter,
      this.cleanlinessMeter,
      this.ffRef})
      : super._();

  @override
  RestaurantsRecord rebuild(void Function(RestaurantsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RestaurantsRecordBuilder toBuilder() =>
      new RestaurantsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RestaurantsRecord &&
        restaurantName == other.restaurantName &&
        logo == other.logo &&
        featuredImage == other.featuredImage &&
        restLatLong == other.restLatLong &&
        city == other.city &&
        email == other.email &&
        website == other.website &&
        priceRange == other.priceRange &&
        restSlogan == other.restSlogan &&
        restAddress == other.restAddress &&
        reviews == other.reviews &&
        restDescription == other.restDescription &&
        categories == other.categories &&
        rating == other.rating &&
        userConnection == other.userConnection &&
        gallery == other.gallery &&
        phoneNumber == other.phoneNumber &&
        mondayHours == other.mondayHours &&
        tuesdayHours == other.tuesdayHours &&
        wednesdayHours == other.wednesdayHours &&
        thursdayHours == other.thursdayHours &&
        fridayHours == other.fridayHours &&
        saturdayHours == other.saturdayHours &&
        sundayHours == other.sundayHours &&
        whoBookmarked == other.whoBookmarked &&
        highlight1 == other.highlight1 &&
        highlight2 == other.highlight2 &&
        expiryTime == other.expiryTime &&
        promotedValid == other.promotedValid &&
        isSubscribed == other.isSubscribed &&
        storyClicks == other.storyClicks &&
        learnMoreClicks == other.learnMoreClicks &&
        phoneClicks == other.phoneClicks &&
        websiteClicks == other.websiteClicks &&
        mapClicks == other.mapClicks &&
        menuItems == other.menuItems &&
        menuCourses == other.menuCourses &&
        menuCourseRef == other.menuCourseRef &&
        videoTour == other.videoTour &&
        onlineOrderLink == other.onlineOrderLink &&
        orderNowClicks == other.orderNowClicks &&
        delivery == other.delivery &&
        takeout == other.takeout &&
        wifi == other.wifi &&
        birthdayFreebies == other.birthdayFreebies &&
        happyHour == other.happyHour &&
        reservations == other.reservations &&
        tableService == other.tableService &&
        mobileRewards == other.mobileRewards &&
        standalone == other.standalone &&
        cardClicks == other.cardClicks &&
        hasAdNumber == other.hasAdNumber &&
        doordash == other.doordash &&
        grubhub == other.grubhub &&
        postmates == other.postmates &&
        ubereats == other.ubereats &&
        instacart == other.instacart &&
        chownow == other.chownow &&
        hasDoordash == other.hasDoordash &&
        hasGrubhub == other.hasGrubhub &&
        hasPostmates == other.hasPostmates &&
        hasUbereats == other.hasUbereats &&
        hasInstacart == other.hasInstacart &&
        hasChownow == other.hasChownow &&
        clustertruck == other.clustertruck &&
        hasClustertruck == other.hasClustertruck &&
        addNumberRef == other.addNumberRef &&
        adNumber == other.adNumber &&
        pickupTime == other.pickupTime &&
        deliveryTime == other.deliveryTime &&
        deliveryFee == other.deliveryFee &&
        curatedLists == other.curatedLists &&
        deliveryRange == other.deliveryRange &&
        cats == other.cats &&
        foodMeter == other.foodMeter &&
        serviceMeter == other.serviceMeter &&
        cleanlinessMeter == other.cleanlinessMeter &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, restaurantName.hashCode), logo.hashCode), featuredImage.hashCode), restLatLong.hashCode), city.hashCode), email.hashCode), website.hashCode), priceRange.hashCode), restSlogan.hashCode), restAddress.hashCode), reviews.hashCode), restDescription.hashCode), categories.hashCode), rating.hashCode), userConnection.hashCode), gallery.hashCode), phoneNumber.hashCode), mondayHours.hashCode), tuesdayHours.hashCode), wednesdayHours.hashCode), thursdayHours.hashCode), fridayHours.hashCode), saturdayHours.hashCode), sundayHours.hashCode), whoBookmarked.hashCode), highlight1.hashCode), highlight2.hashCode), expiryTime.hashCode), promotedValid.hashCode), isSubscribed.hashCode), storyClicks.hashCode), learnMoreClicks.hashCode), phoneClicks.hashCode), websiteClicks.hashCode), mapClicks.hashCode), menuItems.hashCode), menuCourses.hashCode), menuCourseRef.hashCode), videoTour.hashCode), onlineOrderLink.hashCode), orderNowClicks.hashCode), delivery.hashCode), takeout.hashCode), wifi.hashCode), birthdayFreebies.hashCode), happyHour.hashCode), reservations.hashCode), tableService.hashCode), mobileRewards.hashCode), standalone.hashCode), cardClicks.hashCode), hasAdNumber.hashCode), doordash.hashCode), grubhub.hashCode), postmates.hashCode), ubereats.hashCode), instacart.hashCode), chownow.hashCode), hasDoordash.hashCode),
                                                                                hasGrubhub.hashCode),
                                                                            hasPostmates.hashCode),
                                                                        hasUbereats.hashCode),
                                                                    hasInstacart.hashCode),
                                                                hasChownow.hashCode),
                                                            clustertruck.hashCode),
                                                        hasClustertruck.hashCode),
                                                    addNumberRef.hashCode),
                                                adNumber.hashCode),
                                            pickupTime.hashCode),
                                        deliveryTime.hashCode),
                                    deliveryFee.hashCode),
                                curatedLists.hashCode),
                            deliveryRange.hashCode),
                        cats.hashCode),
                    foodMeter.hashCode),
                serviceMeter.hashCode),
            cleanlinessMeter.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RestaurantsRecord')
          ..add('restaurantName', restaurantName)
          ..add('logo', logo)
          ..add('featuredImage', featuredImage)
          ..add('restLatLong', restLatLong)
          ..add('city', city)
          ..add('email', email)
          ..add('website', website)
          ..add('priceRange', priceRange)
          ..add('restSlogan', restSlogan)
          ..add('restAddress', restAddress)
          ..add('reviews', reviews)
          ..add('restDescription', restDescription)
          ..add('categories', categories)
          ..add('rating', rating)
          ..add('userConnection', userConnection)
          ..add('gallery', gallery)
          ..add('phoneNumber', phoneNumber)
          ..add('mondayHours', mondayHours)
          ..add('tuesdayHours', tuesdayHours)
          ..add('wednesdayHours', wednesdayHours)
          ..add('thursdayHours', thursdayHours)
          ..add('fridayHours', fridayHours)
          ..add('saturdayHours', saturdayHours)
          ..add('sundayHours', sundayHours)
          ..add('whoBookmarked', whoBookmarked)
          ..add('highlight1', highlight1)
          ..add('highlight2', highlight2)
          ..add('expiryTime', expiryTime)
          ..add('promotedValid', promotedValid)
          ..add('isSubscribed', isSubscribed)
          ..add('storyClicks', storyClicks)
          ..add('learnMoreClicks', learnMoreClicks)
          ..add('phoneClicks', phoneClicks)
          ..add('websiteClicks', websiteClicks)
          ..add('mapClicks', mapClicks)
          ..add('menuItems', menuItems)
          ..add('menuCourses', menuCourses)
          ..add('menuCourseRef', menuCourseRef)
          ..add('videoTour', videoTour)
          ..add('onlineOrderLink', onlineOrderLink)
          ..add('orderNowClicks', orderNowClicks)
          ..add('delivery', delivery)
          ..add('takeout', takeout)
          ..add('wifi', wifi)
          ..add('birthdayFreebies', birthdayFreebies)
          ..add('happyHour', happyHour)
          ..add('reservations', reservations)
          ..add('tableService', tableService)
          ..add('mobileRewards', mobileRewards)
          ..add('standalone', standalone)
          ..add('cardClicks', cardClicks)
          ..add('hasAdNumber', hasAdNumber)
          ..add('doordash', doordash)
          ..add('grubhub', grubhub)
          ..add('postmates', postmates)
          ..add('ubereats', ubereats)
          ..add('instacart', instacart)
          ..add('chownow', chownow)
          ..add('hasDoordash', hasDoordash)
          ..add('hasGrubhub', hasGrubhub)
          ..add('hasPostmates', hasPostmates)
          ..add('hasUbereats', hasUbereats)
          ..add('hasInstacart', hasInstacart)
          ..add('hasChownow', hasChownow)
          ..add('clustertruck', clustertruck)
          ..add('hasClustertruck', hasClustertruck)
          ..add('addNumberRef', addNumberRef)
          ..add('adNumber', adNumber)
          ..add('pickupTime', pickupTime)
          ..add('deliveryTime', deliveryTime)
          ..add('deliveryFee', deliveryFee)
          ..add('curatedLists', curatedLists)
          ..add('deliveryRange', deliveryRange)
          ..add('cats', cats)
          ..add('foodMeter', foodMeter)
          ..add('serviceMeter', serviceMeter)
          ..add('cleanlinessMeter', cleanlinessMeter)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class RestaurantsRecordBuilder
    implements Builder<RestaurantsRecord, RestaurantsRecordBuilder> {
  _$RestaurantsRecord? _$v;

  String? _restaurantName;
  String? get restaurantName => _$this._restaurantName;
  set restaurantName(String? restaurantName) =>
      _$this._restaurantName = restaurantName;

  String? _logo;
  String? get logo => _$this._logo;
  set logo(String? logo) => _$this._logo = logo;

  String? _featuredImage;
  String? get featuredImage => _$this._featuredImage;
  set featuredImage(String? featuredImage) =>
      _$this._featuredImage = featuredImage;

  LatLng? _restLatLong;
  LatLng? get restLatLong => _$this._restLatLong;
  set restLatLong(LatLng? restLatLong) => _$this._restLatLong = restLatLong;

  String? _city;
  String? get city => _$this._city;
  set city(String? city) => _$this._city = city;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _website;
  String? get website => _$this._website;
  set website(String? website) => _$this._website = website;

  String? _priceRange;
  String? get priceRange => _$this._priceRange;
  set priceRange(String? priceRange) => _$this._priceRange = priceRange;

  String? _restSlogan;
  String? get restSlogan => _$this._restSlogan;
  set restSlogan(String? restSlogan) => _$this._restSlogan = restSlogan;

  String? _restAddress;
  String? get restAddress => _$this._restAddress;
  set restAddress(String? restAddress) => _$this._restAddress = restAddress;

  int? _reviews;
  int? get reviews => _$this._reviews;
  set reviews(int? reviews) => _$this._reviews = reviews;

  String? _restDescription;
  String? get restDescription => _$this._restDescription;
  set restDescription(String? restDescription) =>
      _$this._restDescription = restDescription;

  String? _categories;
  String? get categories => _$this._categories;
  set categories(String? categories) => _$this._categories = categories;

  double? _rating;
  double? get rating => _$this._rating;
  set rating(double? rating) => _$this._rating = rating;

  DocumentReference<Object?>? _userConnection;
  DocumentReference<Object?>? get userConnection => _$this._userConnection;
  set userConnection(DocumentReference<Object?>? userConnection) =>
      _$this._userConnection = userConnection;

  ListBuilder<String>? _gallery;
  ListBuilder<String> get gallery =>
      _$this._gallery ??= new ListBuilder<String>();
  set gallery(ListBuilder<String>? gallery) => _$this._gallery = gallery;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _mondayHours;
  String? get mondayHours => _$this._mondayHours;
  set mondayHours(String? mondayHours) => _$this._mondayHours = mondayHours;

  String? _tuesdayHours;
  String? get tuesdayHours => _$this._tuesdayHours;
  set tuesdayHours(String? tuesdayHours) => _$this._tuesdayHours = tuesdayHours;

  String? _wednesdayHours;
  String? get wednesdayHours => _$this._wednesdayHours;
  set wednesdayHours(String? wednesdayHours) =>
      _$this._wednesdayHours = wednesdayHours;

  String? _thursdayHours;
  String? get thursdayHours => _$this._thursdayHours;
  set thursdayHours(String? thursdayHours) =>
      _$this._thursdayHours = thursdayHours;

  String? _fridayHours;
  String? get fridayHours => _$this._fridayHours;
  set fridayHours(String? fridayHours) => _$this._fridayHours = fridayHours;

  String? _saturdayHours;
  String? get saturdayHours => _$this._saturdayHours;
  set saturdayHours(String? saturdayHours) =>
      _$this._saturdayHours = saturdayHours;

  String? _sundayHours;
  String? get sundayHours => _$this._sundayHours;
  set sundayHours(String? sundayHours) => _$this._sundayHours = sundayHours;

  ListBuilder<DocumentReference<Object?>>? _whoBookmarked;
  ListBuilder<DocumentReference<Object?>> get whoBookmarked =>
      _$this._whoBookmarked ??= new ListBuilder<DocumentReference<Object?>>();
  set whoBookmarked(ListBuilder<DocumentReference<Object?>>? whoBookmarked) =>
      _$this._whoBookmarked = whoBookmarked;

  String? _highlight1;
  String? get highlight1 => _$this._highlight1;
  set highlight1(String? highlight1) => _$this._highlight1 = highlight1;

  String? _highlight2;
  String? get highlight2 => _$this._highlight2;
  set highlight2(String? highlight2) => _$this._highlight2 = highlight2;

  DateTime? _expiryTime;
  DateTime? get expiryTime => _$this._expiryTime;
  set expiryTime(DateTime? expiryTime) => _$this._expiryTime = expiryTime;

  bool? _promotedValid;
  bool? get promotedValid => _$this._promotedValid;
  set promotedValid(bool? promotedValid) =>
      _$this._promotedValid = promotedValid;

  bool? _isSubscribed;
  bool? get isSubscribed => _$this._isSubscribed;
  set isSubscribed(bool? isSubscribed) => _$this._isSubscribed = isSubscribed;

  int? _storyClicks;
  int? get storyClicks => _$this._storyClicks;
  set storyClicks(int? storyClicks) => _$this._storyClicks = storyClicks;

  int? _learnMoreClicks;
  int? get learnMoreClicks => _$this._learnMoreClicks;
  set learnMoreClicks(int? learnMoreClicks) =>
      _$this._learnMoreClicks = learnMoreClicks;

  int? _phoneClicks;
  int? get phoneClicks => _$this._phoneClicks;
  set phoneClicks(int? phoneClicks) => _$this._phoneClicks = phoneClicks;

  int? _websiteClicks;
  int? get websiteClicks => _$this._websiteClicks;
  set websiteClicks(int? websiteClicks) =>
      _$this._websiteClicks = websiteClicks;

  int? _mapClicks;
  int? get mapClicks => _$this._mapClicks;
  set mapClicks(int? mapClicks) => _$this._mapClicks = mapClicks;

  ListBuilder<DocumentReference<Object?>>? _menuItems;
  ListBuilder<DocumentReference<Object?>> get menuItems =>
      _$this._menuItems ??= new ListBuilder<DocumentReference<Object?>>();
  set menuItems(ListBuilder<DocumentReference<Object?>>? menuItems) =>
      _$this._menuItems = menuItems;

  ListBuilder<String>? _menuCourses;
  ListBuilder<String> get menuCourses =>
      _$this._menuCourses ??= new ListBuilder<String>();
  set menuCourses(ListBuilder<String>? menuCourses) =>
      _$this._menuCourses = menuCourses;

  ListBuilder<DocumentReference<Object?>>? _menuCourseRef;
  ListBuilder<DocumentReference<Object?>> get menuCourseRef =>
      _$this._menuCourseRef ??= new ListBuilder<DocumentReference<Object?>>();
  set menuCourseRef(ListBuilder<DocumentReference<Object?>>? menuCourseRef) =>
      _$this._menuCourseRef = menuCourseRef;

  String? _videoTour;
  String? get videoTour => _$this._videoTour;
  set videoTour(String? videoTour) => _$this._videoTour = videoTour;

  String? _onlineOrderLink;
  String? get onlineOrderLink => _$this._onlineOrderLink;
  set onlineOrderLink(String? onlineOrderLink) =>
      _$this._onlineOrderLink = onlineOrderLink;

  int? _orderNowClicks;
  int? get orderNowClicks => _$this._orderNowClicks;
  set orderNowClicks(int? orderNowClicks) =>
      _$this._orderNowClicks = orderNowClicks;

  bool? _delivery;
  bool? get delivery => _$this._delivery;
  set delivery(bool? delivery) => _$this._delivery = delivery;

  bool? _takeout;
  bool? get takeout => _$this._takeout;
  set takeout(bool? takeout) => _$this._takeout = takeout;

  bool? _wifi;
  bool? get wifi => _$this._wifi;
  set wifi(bool? wifi) => _$this._wifi = wifi;

  bool? _birthdayFreebies;
  bool? get birthdayFreebies => _$this._birthdayFreebies;
  set birthdayFreebies(bool? birthdayFreebies) =>
      _$this._birthdayFreebies = birthdayFreebies;

  bool? _happyHour;
  bool? get happyHour => _$this._happyHour;
  set happyHour(bool? happyHour) => _$this._happyHour = happyHour;

  bool? _reservations;
  bool? get reservations => _$this._reservations;
  set reservations(bool? reservations) => _$this._reservations = reservations;

  bool? _tableService;
  bool? get tableService => _$this._tableService;
  set tableService(bool? tableService) => _$this._tableService = tableService;

  bool? _mobileRewards;
  bool? get mobileRewards => _$this._mobileRewards;
  set mobileRewards(bool? mobileRewards) =>
      _$this._mobileRewards = mobileRewards;

  bool? _standalone;
  bool? get standalone => _$this._standalone;
  set standalone(bool? standalone) => _$this._standalone = standalone;

  int? _cardClicks;
  int? get cardClicks => _$this._cardClicks;
  set cardClicks(int? cardClicks) => _$this._cardClicks = cardClicks;

  bool? _hasAdNumber;
  bool? get hasAdNumber => _$this._hasAdNumber;
  set hasAdNumber(bool? hasAdNumber) => _$this._hasAdNumber = hasAdNumber;

  String? _doordash;
  String? get doordash => _$this._doordash;
  set doordash(String? doordash) => _$this._doordash = doordash;

  String? _grubhub;
  String? get grubhub => _$this._grubhub;
  set grubhub(String? grubhub) => _$this._grubhub = grubhub;

  String? _postmates;
  String? get postmates => _$this._postmates;
  set postmates(String? postmates) => _$this._postmates = postmates;

  String? _ubereats;
  String? get ubereats => _$this._ubereats;
  set ubereats(String? ubereats) => _$this._ubereats = ubereats;

  String? _instacart;
  String? get instacart => _$this._instacart;
  set instacart(String? instacart) => _$this._instacart = instacart;

  String? _chownow;
  String? get chownow => _$this._chownow;
  set chownow(String? chownow) => _$this._chownow = chownow;

  bool? _hasDoordash;
  bool? get hasDoordash => _$this._hasDoordash;
  set hasDoordash(bool? hasDoordash) => _$this._hasDoordash = hasDoordash;

  bool? _hasGrubhub;
  bool? get hasGrubhub => _$this._hasGrubhub;
  set hasGrubhub(bool? hasGrubhub) => _$this._hasGrubhub = hasGrubhub;

  bool? _hasPostmates;
  bool? get hasPostmates => _$this._hasPostmates;
  set hasPostmates(bool? hasPostmates) => _$this._hasPostmates = hasPostmates;

  bool? _hasUbereats;
  bool? get hasUbereats => _$this._hasUbereats;
  set hasUbereats(bool? hasUbereats) => _$this._hasUbereats = hasUbereats;

  bool? _hasInstacart;
  bool? get hasInstacart => _$this._hasInstacart;
  set hasInstacart(bool? hasInstacart) => _$this._hasInstacart = hasInstacart;

  bool? _hasChownow;
  bool? get hasChownow => _$this._hasChownow;
  set hasChownow(bool? hasChownow) => _$this._hasChownow = hasChownow;

  String? _clustertruck;
  String? get clustertruck => _$this._clustertruck;
  set clustertruck(String? clustertruck) => _$this._clustertruck = clustertruck;

  bool? _hasClustertruck;
  bool? get hasClustertruck => _$this._hasClustertruck;
  set hasClustertruck(bool? hasClustertruck) =>
      _$this._hasClustertruck = hasClustertruck;

  DocumentReference<Object?>? _addNumberRef;
  DocumentReference<Object?>? get addNumberRef => _$this._addNumberRef;
  set addNumberRef(DocumentReference<Object?>? addNumberRef) =>
      _$this._addNumberRef = addNumberRef;

  int? _adNumber;
  int? get adNumber => _$this._adNumber;
  set adNumber(int? adNumber) => _$this._adNumber = adNumber;

  int? _pickupTime;
  int? get pickupTime => _$this._pickupTime;
  set pickupTime(int? pickupTime) => _$this._pickupTime = pickupTime;

  int? _deliveryTime;
  int? get deliveryTime => _$this._deliveryTime;
  set deliveryTime(int? deliveryTime) => _$this._deliveryTime = deliveryTime;

  int? _deliveryFee;
  int? get deliveryFee => _$this._deliveryFee;
  set deliveryFee(int? deliveryFee) => _$this._deliveryFee = deliveryFee;

  ListBuilder<DocumentReference<Object?>>? _curatedLists;
  ListBuilder<DocumentReference<Object?>> get curatedLists =>
      _$this._curatedLists ??= new ListBuilder<DocumentReference<Object?>>();
  set curatedLists(ListBuilder<DocumentReference<Object?>>? curatedLists) =>
      _$this._curatedLists = curatedLists;

  int? _deliveryRange;
  int? get deliveryRange => _$this._deliveryRange;
  set deliveryRange(int? deliveryRange) =>
      _$this._deliveryRange = deliveryRange;

  ListBuilder<String>? _cats;
  ListBuilder<String> get cats => _$this._cats ??= new ListBuilder<String>();
  set cats(ListBuilder<String>? cats) => _$this._cats = cats;

  double? _foodMeter;
  double? get foodMeter => _$this._foodMeter;
  set foodMeter(double? foodMeter) => _$this._foodMeter = foodMeter;

  double? _serviceMeter;
  double? get serviceMeter => _$this._serviceMeter;
  set serviceMeter(double? serviceMeter) => _$this._serviceMeter = serviceMeter;

  double? _cleanlinessMeter;
  double? get cleanlinessMeter => _$this._cleanlinessMeter;
  set cleanlinessMeter(double? cleanlinessMeter) =>
      _$this._cleanlinessMeter = cleanlinessMeter;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  RestaurantsRecordBuilder() {
    RestaurantsRecord._initializeBuilder(this);
  }

  RestaurantsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _restaurantName = $v.restaurantName;
      _logo = $v.logo;
      _featuredImage = $v.featuredImage;
      _restLatLong = $v.restLatLong;
      _city = $v.city;
      _email = $v.email;
      _website = $v.website;
      _priceRange = $v.priceRange;
      _restSlogan = $v.restSlogan;
      _restAddress = $v.restAddress;
      _reviews = $v.reviews;
      _restDescription = $v.restDescription;
      _categories = $v.categories;
      _rating = $v.rating;
      _userConnection = $v.userConnection;
      _gallery = $v.gallery?.toBuilder();
      _phoneNumber = $v.phoneNumber;
      _mondayHours = $v.mondayHours;
      _tuesdayHours = $v.tuesdayHours;
      _wednesdayHours = $v.wednesdayHours;
      _thursdayHours = $v.thursdayHours;
      _fridayHours = $v.fridayHours;
      _saturdayHours = $v.saturdayHours;
      _sundayHours = $v.sundayHours;
      _whoBookmarked = $v.whoBookmarked?.toBuilder();
      _highlight1 = $v.highlight1;
      _highlight2 = $v.highlight2;
      _expiryTime = $v.expiryTime;
      _promotedValid = $v.promotedValid;
      _isSubscribed = $v.isSubscribed;
      _storyClicks = $v.storyClicks;
      _learnMoreClicks = $v.learnMoreClicks;
      _phoneClicks = $v.phoneClicks;
      _websiteClicks = $v.websiteClicks;
      _mapClicks = $v.mapClicks;
      _menuItems = $v.menuItems?.toBuilder();
      _menuCourses = $v.menuCourses?.toBuilder();
      _menuCourseRef = $v.menuCourseRef?.toBuilder();
      _videoTour = $v.videoTour;
      _onlineOrderLink = $v.onlineOrderLink;
      _orderNowClicks = $v.orderNowClicks;
      _delivery = $v.delivery;
      _takeout = $v.takeout;
      _wifi = $v.wifi;
      _birthdayFreebies = $v.birthdayFreebies;
      _happyHour = $v.happyHour;
      _reservations = $v.reservations;
      _tableService = $v.tableService;
      _mobileRewards = $v.mobileRewards;
      _standalone = $v.standalone;
      _cardClicks = $v.cardClicks;
      _hasAdNumber = $v.hasAdNumber;
      _doordash = $v.doordash;
      _grubhub = $v.grubhub;
      _postmates = $v.postmates;
      _ubereats = $v.ubereats;
      _instacart = $v.instacart;
      _chownow = $v.chownow;
      _hasDoordash = $v.hasDoordash;
      _hasGrubhub = $v.hasGrubhub;
      _hasPostmates = $v.hasPostmates;
      _hasUbereats = $v.hasUbereats;
      _hasInstacart = $v.hasInstacart;
      _hasChownow = $v.hasChownow;
      _clustertruck = $v.clustertruck;
      _hasClustertruck = $v.hasClustertruck;
      _addNumberRef = $v.addNumberRef;
      _adNumber = $v.adNumber;
      _pickupTime = $v.pickupTime;
      _deliveryTime = $v.deliveryTime;
      _deliveryFee = $v.deliveryFee;
      _curatedLists = $v.curatedLists?.toBuilder();
      _deliveryRange = $v.deliveryRange;
      _cats = $v.cats?.toBuilder();
      _foodMeter = $v.foodMeter;
      _serviceMeter = $v.serviceMeter;
      _cleanlinessMeter = $v.cleanlinessMeter;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RestaurantsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RestaurantsRecord;
  }

  @override
  void update(void Function(RestaurantsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RestaurantsRecord build() => _build();

  _$RestaurantsRecord _build() {
    _$RestaurantsRecord _$result;
    try {
      _$result = _$v ??
          new _$RestaurantsRecord._(
              restaurantName: restaurantName,
              logo: logo,
              featuredImage: featuredImage,
              restLatLong: restLatLong,
              city: city,
              email: email,
              website: website,
              priceRange: priceRange,
              restSlogan: restSlogan,
              restAddress: restAddress,
              reviews: reviews,
              restDescription: restDescription,
              categories: categories,
              rating: rating,
              userConnection: userConnection,
              gallery: _gallery?.build(),
              phoneNumber: phoneNumber,
              mondayHours: mondayHours,
              tuesdayHours: tuesdayHours,
              wednesdayHours: wednesdayHours,
              thursdayHours: thursdayHours,
              fridayHours: fridayHours,
              saturdayHours: saturdayHours,
              sundayHours: sundayHours,
              whoBookmarked: _whoBookmarked?.build(),
              highlight1: highlight1,
              highlight2: highlight2,
              expiryTime: expiryTime,
              promotedValid: promotedValid,
              isSubscribed: isSubscribed,
              storyClicks: storyClicks,
              learnMoreClicks: learnMoreClicks,
              phoneClicks: phoneClicks,
              websiteClicks: websiteClicks,
              mapClicks: mapClicks,
              menuItems: _menuItems?.build(),
              menuCourses: _menuCourses?.build(),
              menuCourseRef: _menuCourseRef?.build(),
              videoTour: videoTour,
              onlineOrderLink: onlineOrderLink,
              orderNowClicks: orderNowClicks,
              delivery: delivery,
              takeout: takeout,
              wifi: wifi,
              birthdayFreebies: birthdayFreebies,
              happyHour: happyHour,
              reservations: reservations,
              tableService: tableService,
              mobileRewards: mobileRewards,
              standalone: standalone,
              cardClicks: cardClicks,
              hasAdNumber: hasAdNumber,
              doordash: doordash,
              grubhub: grubhub,
              postmates: postmates,
              ubereats: ubereats,
              instacart: instacart,
              chownow: chownow,
              hasDoordash: hasDoordash,
              hasGrubhub: hasGrubhub,
              hasPostmates: hasPostmates,
              hasUbereats: hasUbereats,
              hasInstacart: hasInstacart,
              hasChownow: hasChownow,
              clustertruck: clustertruck,
              hasClustertruck: hasClustertruck,
              addNumberRef: addNumberRef,
              adNumber: adNumber,
              pickupTime: pickupTime,
              deliveryTime: deliveryTime,
              deliveryFee: deliveryFee,
              curatedLists: _curatedLists?.build(),
              deliveryRange: deliveryRange,
              cats: _cats?.build(),
              foodMeter: foodMeter,
              serviceMeter: serviceMeter,
              cleanlinessMeter: cleanlinessMeter,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'gallery';
        _gallery?.build();

        _$failedField = 'whoBookmarked';
        _whoBookmarked?.build();

        _$failedField = 'menuItems';
        _menuItems?.build();
        _$failedField = 'menuCourses';
        _menuCourses?.build();
        _$failedField = 'menuCourseRef';
        _menuCourseRef?.build();

        _$failedField = 'curatedLists';
        _curatedLists?.build();

        _$failedField = 'cats';
        _cats?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RestaurantsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

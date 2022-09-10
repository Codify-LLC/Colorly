// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.username;
    if (value != null) {
      result
        ..add('username')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
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
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.bio;
    if (value != null) {
      result
        ..add('bio')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.instagramUrl;
    if (value != null) {
      result
        ..add('instagram_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.facebookUrl;
    if (value != null) {
      result
        ..add('facebook_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tiktokUrl;
    if (value != null) {
      result
        ..add('tiktok_url')
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
    value = object.isRestaurant;
    if (value != null) {
      result
        ..add('isRestaurant')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.restaurantConnect;
    if (value != null) {
      result
        ..add('restaurantConnect')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.followers;
    if (value != null) {
      result
        ..add('followers')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.following;
    if (value != null) {
      result
        ..add('following')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.flavor;
    if (value != null) {
      result
        ..add('flavor')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.restConnections;
    if (value != null) {
      result
        ..add('restConnections')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.flavorTotal;
    if (value != null) {
      result
        ..add('flavorTotal')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.acceptsTerms;
    if (value != null) {
      result
        ..add('acceptsTerms')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.blockedUsers;
    if (value != null) {
      result
        ..add('blockedUsers')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.bookmarked;
    if (value != null) {
      result
        ..add('bookmarked')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.isFlagged;
    if (value != null) {
      result
        ..add('isFlagged')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.whoFollowed;
    if (value != null) {
      result
        ..add('whoFollowed')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.superAdmin;
    if (value != null) {
      result
        ..add('superAdmin')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.city;
    if (value != null) {
      result
        ..add('city')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.orders;
    if (value != null) {
      result
        ..add('orders')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.order;
    if (value != null) {
      result
        ..add('order')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.currentOrder;
    if (value != null) {
      result
        ..add('currentOrder')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isPremium;
    if (value != null) {
      result
        ..add('isPremium')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.shoppingCart;
    if (value != null) {
      result
        ..add('shoppingCart')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.deals;
    if (value != null) {
      result
        ..add('deals')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.usedDeals;
    if (value != null) {
      result
        ..add('usedDeals')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.hasFacebook;
    if (value != null) {
      result
        ..add('hasFacebook')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.hasInstagram;
    if (value != null) {
      result
        ..add('hasInstagram')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.hasTikTok;
    if (value != null) {
      result
        ..add('hasTikTok')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.hasLink;
    if (value != null) {
      result
        ..add('hasLink')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.fizzzCoin;
    if (value != null) {
      result
        ..add('fizzzCoin')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.fizzzMonthly;
    if (value != null) {
      result
        ..add('fizzzMonthly')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.savedPosts;
    if (value != null) {
      result
        ..add('savedPosts')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.adventureRef;
    if (value != null) {
      result
        ..add('adventureRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.hasAdventure;
    if (value != null) {
      result
        ..add('hasAdventure')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.qrCode;
    if (value != null) {
      result
        ..add('qrCode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.addNumberRef;
    if (value != null) {
      result
        ..add('addNumberRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.orderingRestaurant;
    if (value != null) {
      result
        ..add('orderingRestaurant')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.hasOrderingRestaurant;
    if (value != null) {
      result
        ..add('hasOrderingRestaurant')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.shoppingBag;
    if (value != null) {
      result
        ..add('shoppingBag')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.locationDelivery;
    if (value != null) {
      result
        ..add('locationDelivery')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.reviews;
    if (value != null) {
      result
        ..add('reviews')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.distanceToRestaurant;
    if (value != null) {
      result
        ..add('distanceToRestaurant')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  UsersRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'bio':
          result.bio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'instagram_url':
          result.instagramUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'facebook_url':
          result.facebookUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tiktok_url':
          result.tiktokUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'website':
          result.website = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isRestaurant':
          result.isRestaurant = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'restaurantConnect':
          result.restaurantConnect = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'followers':
          result.followers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'following':
          result.following.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'flavor':
          result.flavor.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'restConnections':
          result.restConnections.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'flavorTotal':
          result.flavorTotal = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'acceptsTerms':
          result.acceptsTerms = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'blockedUsers':
          result.blockedUsers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'bookmarked':
          result.bookmarked.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'isFlagged':
          result.isFlagged.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'whoFollowed':
          result.whoFollowed.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'superAdmin':
          result.superAdmin = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'city':
          result.city.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'orders':
          result.orders.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'order':
          result.order = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'currentOrder':
          result.currentOrder = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'isPremium':
          result.isPremium = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'shoppingCart':
          result.shoppingCart.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'deals':
          result.deals.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'usedDeals':
          result.usedDeals.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'hasFacebook':
          result.hasFacebook = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'hasInstagram':
          result.hasInstagram = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'hasTikTok':
          result.hasTikTok = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'hasLink':
          result.hasLink = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'fizzzCoin':
          result.fizzzCoin = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'fizzzMonthly':
          result.fizzzMonthly = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'savedPosts':
          result.savedPosts.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'adventureRef':
          result.adventureRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'hasAdventure':
          result.hasAdventure = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'qrCode':
          result.qrCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'addNumberRef':
          result.addNumberRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'orderingRestaurant':
          result.orderingRestaurant = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'hasOrderingRestaurant':
          result.hasOrderingRestaurant = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'shoppingBag':
          result.shoppingBag = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'locationDelivery':
          result.locationDelivery = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'reviews':
          result.reviews = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'distanceToRestaurant':
          result.distanceToRestaurant = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$UsersRecord extends UsersRecord {
  @override
  final String? uid;
  @override
  final String? displayName;
  @override
  final String? username;
  @override
  final String? photoUrl;
  @override
  final String? email;
  @override
  final String? phoneNumber;
  @override
  final DateTime? createdTime;
  @override
  final String? bio;
  @override
  final String? instagramUrl;
  @override
  final String? facebookUrl;
  @override
  final String? tiktokUrl;
  @override
  final String? website;
  @override
  final bool? isRestaurant;
  @override
  final DocumentReference<Object?>? restaurantConnect;
  @override
  final BuiltList<DocumentReference<Object?>>? followers;
  @override
  final BuiltList<DocumentReference<Object?>>? following;
  @override
  final BuiltList<int>? flavor;
  @override
  final BuiltList<DocumentReference<Object?>>? restConnections;
  @override
  final int? flavorTotal;
  @override
  final bool? acceptsTerms;
  @override
  final BuiltList<DocumentReference<Object?>>? blockedUsers;
  @override
  final BuiltList<DocumentReference<Object?>>? bookmarked;
  @override
  final BuiltList<DocumentReference<Object?>>? isFlagged;
  @override
  final BuiltList<DocumentReference<Object?>>? whoFollowed;
  @override
  final bool? superAdmin;
  @override
  final BuiltList<String>? city;
  @override
  final BuiltList<DocumentReference<Object?>>? orders;
  @override
  final DocumentReference<Object?>? order;
  @override
  final bool? currentOrder;
  @override
  final bool? isPremium;
  @override
  final BuiltList<DocumentReference<Object?>>? shoppingCart;
  @override
  final BuiltList<DocumentReference<Object?>>? deals;
  @override
  final BuiltList<DocumentReference<Object?>>? usedDeals;
  @override
  final bool? hasFacebook;
  @override
  final bool? hasInstagram;
  @override
  final bool? hasTikTok;
  @override
  final bool? hasLink;
  @override
  final int? fizzzCoin;
  @override
  final int? fizzzMonthly;
  @override
  final BuiltList<DocumentReference<Object?>>? savedPosts;
  @override
  final DocumentReference<Object?>? adventureRef;
  @override
  final bool? hasAdventure;
  @override
  final String? qrCode;
  @override
  final DocumentReference<Object?>? addNumberRef;
  @override
  final DocumentReference<Object?>? orderingRestaurant;
  @override
  final bool? hasOrderingRestaurant;
  @override
  final DocumentReference<Object?>? shoppingBag;
  @override
  final String? address;
  @override
  final LatLng? locationDelivery;
  @override
  final int? reviews;
  @override
  final int? distanceToRestaurant;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UsersRecord([void Function(UsersRecordBuilder)? updates]) =>
      (new UsersRecordBuilder()..update(updates))._build();

  _$UsersRecord._(
      {this.uid,
      this.displayName,
      this.username,
      this.photoUrl,
      this.email,
      this.phoneNumber,
      this.createdTime,
      this.bio,
      this.instagramUrl,
      this.facebookUrl,
      this.tiktokUrl,
      this.website,
      this.isRestaurant,
      this.restaurantConnect,
      this.followers,
      this.following,
      this.flavor,
      this.restConnections,
      this.flavorTotal,
      this.acceptsTerms,
      this.blockedUsers,
      this.bookmarked,
      this.isFlagged,
      this.whoFollowed,
      this.superAdmin,
      this.city,
      this.orders,
      this.order,
      this.currentOrder,
      this.isPremium,
      this.shoppingCart,
      this.deals,
      this.usedDeals,
      this.hasFacebook,
      this.hasInstagram,
      this.hasTikTok,
      this.hasLink,
      this.fizzzCoin,
      this.fizzzMonthly,
      this.savedPosts,
      this.adventureRef,
      this.hasAdventure,
      this.qrCode,
      this.addNumberRef,
      this.orderingRestaurant,
      this.hasOrderingRestaurant,
      this.shoppingBag,
      this.address,
      this.locationDelivery,
      this.reviews,
      this.distanceToRestaurant,
      this.ffRef})
      : super._();

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        uid == other.uid &&
        displayName == other.displayName &&
        username == other.username &&
        photoUrl == other.photoUrl &&
        email == other.email &&
        phoneNumber == other.phoneNumber &&
        createdTime == other.createdTime &&
        bio == other.bio &&
        instagramUrl == other.instagramUrl &&
        facebookUrl == other.facebookUrl &&
        tiktokUrl == other.tiktokUrl &&
        website == other.website &&
        isRestaurant == other.isRestaurant &&
        restaurantConnect == other.restaurantConnect &&
        followers == other.followers &&
        following == other.following &&
        flavor == other.flavor &&
        restConnections == other.restConnections &&
        flavorTotal == other.flavorTotal &&
        acceptsTerms == other.acceptsTerms &&
        blockedUsers == other.blockedUsers &&
        bookmarked == other.bookmarked &&
        isFlagged == other.isFlagged &&
        whoFollowed == other.whoFollowed &&
        superAdmin == other.superAdmin &&
        city == other.city &&
        orders == other.orders &&
        order == other.order &&
        currentOrder == other.currentOrder &&
        isPremium == other.isPremium &&
        shoppingCart == other.shoppingCart &&
        deals == other.deals &&
        usedDeals == other.usedDeals &&
        hasFacebook == other.hasFacebook &&
        hasInstagram == other.hasInstagram &&
        hasTikTok == other.hasTikTok &&
        hasLink == other.hasLink &&
        fizzzCoin == other.fizzzCoin &&
        fizzzMonthly == other.fizzzMonthly &&
        savedPosts == other.savedPosts &&
        adventureRef == other.adventureRef &&
        hasAdventure == other.hasAdventure &&
        qrCode == other.qrCode &&
        addNumberRef == other.addNumberRef &&
        orderingRestaurant == other.orderingRestaurant &&
        hasOrderingRestaurant == other.hasOrderingRestaurant &&
        shoppingBag == other.shoppingBag &&
        address == other.address &&
        locationDelivery == other.locationDelivery &&
        reviews == other.reviews &&
        distanceToRestaurant == other.distanceToRestaurant &&
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
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, uid.hashCode), displayName.hashCode), username.hashCode), photoUrl.hashCode), email.hashCode), phoneNumber.hashCode), createdTime.hashCode), bio.hashCode), instagramUrl.hashCode), facebookUrl.hashCode), tiktokUrl.hashCode), website.hashCode), isRestaurant.hashCode), restaurantConnect.hashCode), followers.hashCode), following.hashCode), flavor.hashCode), restConnections.hashCode), flavorTotal.hashCode), acceptsTerms.hashCode), blockedUsers.hashCode), bookmarked.hashCode), isFlagged.hashCode), whoFollowed.hashCode), superAdmin.hashCode), city.hashCode), orders.hashCode), order.hashCode), currentOrder.hashCode), isPremium.hashCode), shoppingCart.hashCode), deals.hashCode), usedDeals.hashCode),
                                                                                hasFacebook.hashCode),
                                                                            hasInstagram.hashCode),
                                                                        hasTikTok.hashCode),
                                                                    hasLink.hashCode),
                                                                fizzzCoin.hashCode),
                                                            fizzzMonthly.hashCode),
                                                        savedPosts.hashCode),
                                                    adventureRef.hashCode),
                                                hasAdventure.hashCode),
                                            qrCode.hashCode),
                                        addNumberRef.hashCode),
                                    orderingRestaurant.hashCode),
                                hasOrderingRestaurant.hashCode),
                            shoppingBag.hashCode),
                        address.hashCode),
                    locationDelivery.hashCode),
                reviews.hashCode),
            distanceToRestaurant.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersRecord')
          ..add('uid', uid)
          ..add('displayName', displayName)
          ..add('username', username)
          ..add('photoUrl', photoUrl)
          ..add('email', email)
          ..add('phoneNumber', phoneNumber)
          ..add('createdTime', createdTime)
          ..add('bio', bio)
          ..add('instagramUrl', instagramUrl)
          ..add('facebookUrl', facebookUrl)
          ..add('tiktokUrl', tiktokUrl)
          ..add('website', website)
          ..add('isRestaurant', isRestaurant)
          ..add('restaurantConnect', restaurantConnect)
          ..add('followers', followers)
          ..add('following', following)
          ..add('flavor', flavor)
          ..add('restConnections', restConnections)
          ..add('flavorTotal', flavorTotal)
          ..add('acceptsTerms', acceptsTerms)
          ..add('blockedUsers', blockedUsers)
          ..add('bookmarked', bookmarked)
          ..add('isFlagged', isFlagged)
          ..add('whoFollowed', whoFollowed)
          ..add('superAdmin', superAdmin)
          ..add('city', city)
          ..add('orders', orders)
          ..add('order', order)
          ..add('currentOrder', currentOrder)
          ..add('isPremium', isPremium)
          ..add('shoppingCart', shoppingCart)
          ..add('deals', deals)
          ..add('usedDeals', usedDeals)
          ..add('hasFacebook', hasFacebook)
          ..add('hasInstagram', hasInstagram)
          ..add('hasTikTok', hasTikTok)
          ..add('hasLink', hasLink)
          ..add('fizzzCoin', fizzzCoin)
          ..add('fizzzMonthly', fizzzMonthly)
          ..add('savedPosts', savedPosts)
          ..add('adventureRef', adventureRef)
          ..add('hasAdventure', hasAdventure)
          ..add('qrCode', qrCode)
          ..add('addNumberRef', addNumberRef)
          ..add('orderingRestaurant', orderingRestaurant)
          ..add('hasOrderingRestaurant', hasOrderingRestaurant)
          ..add('shoppingBag', shoppingBag)
          ..add('address', address)
          ..add('locationDelivery', locationDelivery)
          ..add('reviews', reviews)
          ..add('distanceToRestaurant', distanceToRestaurant)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord? _$v;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _bio;
  String? get bio => _$this._bio;
  set bio(String? bio) => _$this._bio = bio;

  String? _instagramUrl;
  String? get instagramUrl => _$this._instagramUrl;
  set instagramUrl(String? instagramUrl) => _$this._instagramUrl = instagramUrl;

  String? _facebookUrl;
  String? get facebookUrl => _$this._facebookUrl;
  set facebookUrl(String? facebookUrl) => _$this._facebookUrl = facebookUrl;

  String? _tiktokUrl;
  String? get tiktokUrl => _$this._tiktokUrl;
  set tiktokUrl(String? tiktokUrl) => _$this._tiktokUrl = tiktokUrl;

  String? _website;
  String? get website => _$this._website;
  set website(String? website) => _$this._website = website;

  bool? _isRestaurant;
  bool? get isRestaurant => _$this._isRestaurant;
  set isRestaurant(bool? isRestaurant) => _$this._isRestaurant = isRestaurant;

  DocumentReference<Object?>? _restaurantConnect;
  DocumentReference<Object?>? get restaurantConnect =>
      _$this._restaurantConnect;
  set restaurantConnect(DocumentReference<Object?>? restaurantConnect) =>
      _$this._restaurantConnect = restaurantConnect;

  ListBuilder<DocumentReference<Object?>>? _followers;
  ListBuilder<DocumentReference<Object?>> get followers =>
      _$this._followers ??= new ListBuilder<DocumentReference<Object?>>();
  set followers(ListBuilder<DocumentReference<Object?>>? followers) =>
      _$this._followers = followers;

  ListBuilder<DocumentReference<Object?>>? _following;
  ListBuilder<DocumentReference<Object?>> get following =>
      _$this._following ??= new ListBuilder<DocumentReference<Object?>>();
  set following(ListBuilder<DocumentReference<Object?>>? following) =>
      _$this._following = following;

  ListBuilder<int>? _flavor;
  ListBuilder<int> get flavor => _$this._flavor ??= new ListBuilder<int>();
  set flavor(ListBuilder<int>? flavor) => _$this._flavor = flavor;

  ListBuilder<DocumentReference<Object?>>? _restConnections;
  ListBuilder<DocumentReference<Object?>> get restConnections =>
      _$this._restConnections ??= new ListBuilder<DocumentReference<Object?>>();
  set restConnections(
          ListBuilder<DocumentReference<Object?>>? restConnections) =>
      _$this._restConnections = restConnections;

  int? _flavorTotal;
  int? get flavorTotal => _$this._flavorTotal;
  set flavorTotal(int? flavorTotal) => _$this._flavorTotal = flavorTotal;

  bool? _acceptsTerms;
  bool? get acceptsTerms => _$this._acceptsTerms;
  set acceptsTerms(bool? acceptsTerms) => _$this._acceptsTerms = acceptsTerms;

  ListBuilder<DocumentReference<Object?>>? _blockedUsers;
  ListBuilder<DocumentReference<Object?>> get blockedUsers =>
      _$this._blockedUsers ??= new ListBuilder<DocumentReference<Object?>>();
  set blockedUsers(ListBuilder<DocumentReference<Object?>>? blockedUsers) =>
      _$this._blockedUsers = blockedUsers;

  ListBuilder<DocumentReference<Object?>>? _bookmarked;
  ListBuilder<DocumentReference<Object?>> get bookmarked =>
      _$this._bookmarked ??= new ListBuilder<DocumentReference<Object?>>();
  set bookmarked(ListBuilder<DocumentReference<Object?>>? bookmarked) =>
      _$this._bookmarked = bookmarked;

  ListBuilder<DocumentReference<Object?>>? _isFlagged;
  ListBuilder<DocumentReference<Object?>> get isFlagged =>
      _$this._isFlagged ??= new ListBuilder<DocumentReference<Object?>>();
  set isFlagged(ListBuilder<DocumentReference<Object?>>? isFlagged) =>
      _$this._isFlagged = isFlagged;

  ListBuilder<DocumentReference<Object?>>? _whoFollowed;
  ListBuilder<DocumentReference<Object?>> get whoFollowed =>
      _$this._whoFollowed ??= new ListBuilder<DocumentReference<Object?>>();
  set whoFollowed(ListBuilder<DocumentReference<Object?>>? whoFollowed) =>
      _$this._whoFollowed = whoFollowed;

  bool? _superAdmin;
  bool? get superAdmin => _$this._superAdmin;
  set superAdmin(bool? superAdmin) => _$this._superAdmin = superAdmin;

  ListBuilder<String>? _city;
  ListBuilder<String> get city => _$this._city ??= new ListBuilder<String>();
  set city(ListBuilder<String>? city) => _$this._city = city;

  ListBuilder<DocumentReference<Object?>>? _orders;
  ListBuilder<DocumentReference<Object?>> get orders =>
      _$this._orders ??= new ListBuilder<DocumentReference<Object?>>();
  set orders(ListBuilder<DocumentReference<Object?>>? orders) =>
      _$this._orders = orders;

  DocumentReference<Object?>? _order;
  DocumentReference<Object?>? get order => _$this._order;
  set order(DocumentReference<Object?>? order) => _$this._order = order;

  bool? _currentOrder;
  bool? get currentOrder => _$this._currentOrder;
  set currentOrder(bool? currentOrder) => _$this._currentOrder = currentOrder;

  bool? _isPremium;
  bool? get isPremium => _$this._isPremium;
  set isPremium(bool? isPremium) => _$this._isPremium = isPremium;

  ListBuilder<DocumentReference<Object?>>? _shoppingCart;
  ListBuilder<DocumentReference<Object?>> get shoppingCart =>
      _$this._shoppingCart ??= new ListBuilder<DocumentReference<Object?>>();
  set shoppingCart(ListBuilder<DocumentReference<Object?>>? shoppingCart) =>
      _$this._shoppingCart = shoppingCart;

  ListBuilder<DocumentReference<Object?>>? _deals;
  ListBuilder<DocumentReference<Object?>> get deals =>
      _$this._deals ??= new ListBuilder<DocumentReference<Object?>>();
  set deals(ListBuilder<DocumentReference<Object?>>? deals) =>
      _$this._deals = deals;

  ListBuilder<DocumentReference<Object?>>? _usedDeals;
  ListBuilder<DocumentReference<Object?>> get usedDeals =>
      _$this._usedDeals ??= new ListBuilder<DocumentReference<Object?>>();
  set usedDeals(ListBuilder<DocumentReference<Object?>>? usedDeals) =>
      _$this._usedDeals = usedDeals;

  bool? _hasFacebook;
  bool? get hasFacebook => _$this._hasFacebook;
  set hasFacebook(bool? hasFacebook) => _$this._hasFacebook = hasFacebook;

  bool? _hasInstagram;
  bool? get hasInstagram => _$this._hasInstagram;
  set hasInstagram(bool? hasInstagram) => _$this._hasInstagram = hasInstagram;

  bool? _hasTikTok;
  bool? get hasTikTok => _$this._hasTikTok;
  set hasTikTok(bool? hasTikTok) => _$this._hasTikTok = hasTikTok;

  bool? _hasLink;
  bool? get hasLink => _$this._hasLink;
  set hasLink(bool? hasLink) => _$this._hasLink = hasLink;

  int? _fizzzCoin;
  int? get fizzzCoin => _$this._fizzzCoin;
  set fizzzCoin(int? fizzzCoin) => _$this._fizzzCoin = fizzzCoin;

  int? _fizzzMonthly;
  int? get fizzzMonthly => _$this._fizzzMonthly;
  set fizzzMonthly(int? fizzzMonthly) => _$this._fizzzMonthly = fizzzMonthly;

  ListBuilder<DocumentReference<Object?>>? _savedPosts;
  ListBuilder<DocumentReference<Object?>> get savedPosts =>
      _$this._savedPosts ??= new ListBuilder<DocumentReference<Object?>>();
  set savedPosts(ListBuilder<DocumentReference<Object?>>? savedPosts) =>
      _$this._savedPosts = savedPosts;

  DocumentReference<Object?>? _adventureRef;
  DocumentReference<Object?>? get adventureRef => _$this._adventureRef;
  set adventureRef(DocumentReference<Object?>? adventureRef) =>
      _$this._adventureRef = adventureRef;

  bool? _hasAdventure;
  bool? get hasAdventure => _$this._hasAdventure;
  set hasAdventure(bool? hasAdventure) => _$this._hasAdventure = hasAdventure;

  String? _qrCode;
  String? get qrCode => _$this._qrCode;
  set qrCode(String? qrCode) => _$this._qrCode = qrCode;

  DocumentReference<Object?>? _addNumberRef;
  DocumentReference<Object?>? get addNumberRef => _$this._addNumberRef;
  set addNumberRef(DocumentReference<Object?>? addNumberRef) =>
      _$this._addNumberRef = addNumberRef;

  DocumentReference<Object?>? _orderingRestaurant;
  DocumentReference<Object?>? get orderingRestaurant =>
      _$this._orderingRestaurant;
  set orderingRestaurant(DocumentReference<Object?>? orderingRestaurant) =>
      _$this._orderingRestaurant = orderingRestaurant;

  bool? _hasOrderingRestaurant;
  bool? get hasOrderingRestaurant => _$this._hasOrderingRestaurant;
  set hasOrderingRestaurant(bool? hasOrderingRestaurant) =>
      _$this._hasOrderingRestaurant = hasOrderingRestaurant;

  DocumentReference<Object?>? _shoppingBag;
  DocumentReference<Object?>? get shoppingBag => _$this._shoppingBag;
  set shoppingBag(DocumentReference<Object?>? shoppingBag) =>
      _$this._shoppingBag = shoppingBag;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  LatLng? _locationDelivery;
  LatLng? get locationDelivery => _$this._locationDelivery;
  set locationDelivery(LatLng? locationDelivery) =>
      _$this._locationDelivery = locationDelivery;

  int? _reviews;
  int? get reviews => _$this._reviews;
  set reviews(int? reviews) => _$this._reviews = reviews;

  int? _distanceToRestaurant;
  int? get distanceToRestaurant => _$this._distanceToRestaurant;
  set distanceToRestaurant(int? distanceToRestaurant) =>
      _$this._distanceToRestaurant = distanceToRestaurant;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _displayName = $v.displayName;
      _username = $v.username;
      _photoUrl = $v.photoUrl;
      _email = $v.email;
      _phoneNumber = $v.phoneNumber;
      _createdTime = $v.createdTime;
      _bio = $v.bio;
      _instagramUrl = $v.instagramUrl;
      _facebookUrl = $v.facebookUrl;
      _tiktokUrl = $v.tiktokUrl;
      _website = $v.website;
      _isRestaurant = $v.isRestaurant;
      _restaurantConnect = $v.restaurantConnect;
      _followers = $v.followers?.toBuilder();
      _following = $v.following?.toBuilder();
      _flavor = $v.flavor?.toBuilder();
      _restConnections = $v.restConnections?.toBuilder();
      _flavorTotal = $v.flavorTotal;
      _acceptsTerms = $v.acceptsTerms;
      _blockedUsers = $v.blockedUsers?.toBuilder();
      _bookmarked = $v.bookmarked?.toBuilder();
      _isFlagged = $v.isFlagged?.toBuilder();
      _whoFollowed = $v.whoFollowed?.toBuilder();
      _superAdmin = $v.superAdmin;
      _city = $v.city?.toBuilder();
      _orders = $v.orders?.toBuilder();
      _order = $v.order;
      _currentOrder = $v.currentOrder;
      _isPremium = $v.isPremium;
      _shoppingCart = $v.shoppingCart?.toBuilder();
      _deals = $v.deals?.toBuilder();
      _usedDeals = $v.usedDeals?.toBuilder();
      _hasFacebook = $v.hasFacebook;
      _hasInstagram = $v.hasInstagram;
      _hasTikTok = $v.hasTikTok;
      _hasLink = $v.hasLink;
      _fizzzCoin = $v.fizzzCoin;
      _fizzzMonthly = $v.fizzzMonthly;
      _savedPosts = $v.savedPosts?.toBuilder();
      _adventureRef = $v.adventureRef;
      _hasAdventure = $v.hasAdventure;
      _qrCode = $v.qrCode;
      _addNumberRef = $v.addNumberRef;
      _orderingRestaurant = $v.orderingRestaurant;
      _hasOrderingRestaurant = $v.hasOrderingRestaurant;
      _shoppingBag = $v.shoppingBag;
      _address = $v.address;
      _locationDelivery = $v.locationDelivery;
      _reviews = $v.reviews;
      _distanceToRestaurant = $v.distanceToRestaurant;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersRecord build() => _build();

  _$UsersRecord _build() {
    _$UsersRecord _$result;
    try {
      _$result = _$v ??
          new _$UsersRecord._(
              uid: uid,
              displayName: displayName,
              username: username,
              photoUrl: photoUrl,
              email: email,
              phoneNumber: phoneNumber,
              createdTime: createdTime,
              bio: bio,
              instagramUrl: instagramUrl,
              facebookUrl: facebookUrl,
              tiktokUrl: tiktokUrl,
              website: website,
              isRestaurant: isRestaurant,
              restaurantConnect: restaurantConnect,
              followers: _followers?.build(),
              following: _following?.build(),
              flavor: _flavor?.build(),
              restConnections: _restConnections?.build(),
              flavorTotal: flavorTotal,
              acceptsTerms: acceptsTerms,
              blockedUsers: _blockedUsers?.build(),
              bookmarked: _bookmarked?.build(),
              isFlagged: _isFlagged?.build(),
              whoFollowed: _whoFollowed?.build(),
              superAdmin: superAdmin,
              city: _city?.build(),
              orders: _orders?.build(),
              order: order,
              currentOrder: currentOrder,
              isPremium: isPremium,
              shoppingCart: _shoppingCart?.build(),
              deals: _deals?.build(),
              usedDeals: _usedDeals?.build(),
              hasFacebook: hasFacebook,
              hasInstagram: hasInstagram,
              hasTikTok: hasTikTok,
              hasLink: hasLink,
              fizzzCoin: fizzzCoin,
              fizzzMonthly: fizzzMonthly,
              savedPosts: _savedPosts?.build(),
              adventureRef: adventureRef,
              hasAdventure: hasAdventure,
              qrCode: qrCode,
              addNumberRef: addNumberRef,
              orderingRestaurant: orderingRestaurant,
              hasOrderingRestaurant: hasOrderingRestaurant,
              shoppingBag: shoppingBag,
              address: address,
              locationDelivery: locationDelivery,
              reviews: reviews,
              distanceToRestaurant: distanceToRestaurant,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'followers';
        _followers?.build();
        _$failedField = 'following';
        _following?.build();
        _$failedField = 'flavor';
        _flavor?.build();
        _$failedField = 'restConnections';
        _restConnections?.build();

        _$failedField = 'blockedUsers';
        _blockedUsers?.build();
        _$failedField = 'bookmarked';
        _bookmarked?.build();
        _$failedField = 'isFlagged';
        _isFlagged?.build();
        _$failedField = 'whoFollowed';
        _whoFollowed?.build();

        _$failedField = 'city';
        _city?.build();
        _$failedField = 'orders';
        _orders?.build();

        _$failedField = 'shoppingCart';
        _shoppingCart?.build();
        _$failedField = 'deals';
        _deals?.build();
        _$failedField = 'usedDeals';
        _usedDeals?.build();

        _$failedField = 'savedPosts';
        _savedPosts?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UsersRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

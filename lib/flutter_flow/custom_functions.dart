import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

bool hasUploadedMedia(String? mediaPath) {
  return mediaPath != null && mediaPath.isNotEmpty;
}

int likes(PostsRecord? post) {
  return post!.likes!.length;
}

String getMapUrl(LatLng? restLatLong) {
  return 'https://www.google.com/maps/search/?api=1&'
      'query=${restLatLong!.latitude},${restLatLong.longitude}';
}

String getAverageRating(List<PostsRecord>? posts) {
  if (posts!.isEmpty) {
    return '-';
  }
  var ratingsSum = 0.0;
  for (final post in posts) {
    ratingsSum += post.userRating!;
  }
  return '${(ratingsSum / posts.length).toStringAsFixed(1)}';
}

String getAverageRatingCopy(List<PostsRecord>? posts) {
  if (posts!.isEmpty) {
    return '-';
  }
  var ratingsSum = 0.0;
  for (final post in posts) {
    ratingsSum += post.userRating!;
  }
  return '${(ratingsSum / posts.length).toStringAsFixed(1)}';
}

LatLng getInitialMapLocation(LatLng? userLocation) {
  if (userLocation == null ||
      (userLocation.latitude == 0 && userLocation.longitude == 0)) {
    return LatLng(40.8295538, -73.9386429);
  }
  return userLocation;
}

bool checkPromotedExpiry(
  DateTime? expiryTime,
  DateTime? currentTime,
  bool? promotedValid,
) {
  var result;
  if (promotedValid == true) {
    if (expiryTime!.isBefore(currentTime!)) {
      result = false;
    } else {
      result = true;
    }
  } else {
    result = false;
  }

  return (result);
}

String randomOrderNumber(OrderRecord? order) {
  // generate a random order number
  var codeUnits = List.generate(8, (index) {
    return (math.Random().nextInt(26) + 65).toRadixString(36);
  });
  return '${DateTime.now().toString().split('.')[0]}-${codeUnits.join('')}';
}

double distance(
  LatLng? restLatLong,
  LatLng? userLoc,
) {
  // get the distance between two point in miles and round to 1 decimal place
  const R = 6371000; // radius of the Earth in m
  final latitudeArc = (restLatLong!.latitude - userLoc!.latitude).abs();
  final longitudeArc = (restLatLong.longitude - userLoc.longitude).abs();
  final a = latitudeArc / 180 * math.pi;
  final b = longitudeArc / 180 * math.pi;
  final s = 2 *
      math.asin(math.sqrt(math.sin(a / 2) * math.sin(a / 2) +
          math.cos(userLoc.latitude) *
              math.cos(restLatLong.latitude) *
              math.sin(b / 2) *
              math.sin(b / 2)));

  return ((R * s)).roundToDouble();
}

double countPriceQuantity(
  double? price,
  double? quantity,
) {
  quantity = quantity! * price!;
  return quantity;
}

double cartItemPrice(
  double? itemPrice,
  List<double>? optionsPrices,
) {
  // add an array of doubles to one double
  double? _price = itemPrice;
  optionsPrices!.forEach((price) {
    _price = price;
  });
  return _price!;
}

String getDistance(
  LatLng? userLoc,
  LatLng? restLoc,
) {
  // get distance between two locations in miles 2 decimal places
  double su = math.pi / 180;
  double fu = 52.00000;
  double us = userLoc!.latitude * su;
  double rl = restLoc!.latitude * su;
  double fe = userLoc.longitude * su;
  double re = restLoc.longitude * su;
  double c = math.sin(us) * math.sin(rl) +
      math.cos(us) * math.cos(rl) * math.cos(fe - re);
  c = math.acos(c);
  c = c / su;
  double dis = c * 60 * 1.1515 * 1.609344;
  return dis.toStringAsFixed(2);
}

double getFizzzPercent(
  int? goal,
  int? monthFizzz,
) {
  //  get percentage of two integers and return a double with 0 decimal places
  if (goal == 0) {
    return 0;
  }
  ;
  double percentFizzz = monthFizzz! / goal! * 100; //
  return double.parse(percentFizzz.toStringAsFixed(0));
}

double getFizzzPercentCopy(
  int? goal,
  int? monthFizzz,
) {
  //  get percentage of two integers and return a double with 0 decimal places
  if (goal == 0) {
    return 0;
  }
  ;
  double percentFizzz = monthFizzz! / goal! * 100; //
  return double.parse(percentFizzz.toStringAsFixed(0)) / 100;
}

int getMonthlyFizzz(int? fizzzCount) {
  // reset the amount of something to zero at the first of each month
  var today = new DateTime.now();
  var firstDayMonth = new DateTime(today.year, today.month, 1);
  if (fizzzCount != null && firstDayMonth.difference(today).inDays == 0) {
    return 0;
  } else {
    return fizzzCount!;
  }
}

int addToFizzz(
  int? amount,
  int? fizzz,
) {
  // add two integers together
  return amount! + fizzz!;
}

double totalCartPrice(List<double>? inCartItemsPrice) {
  //  add list of doubles together with two decimal places
  if (inCartItemsPrice == null) return 0.0;
  double totalPrice = 0.0;
  inCartItemsPrice.forEach((element) => totalPrice += element);

  return double.parse((totalPrice).toStringAsFixed(2));
}

double subtotalTax(
  List<double>? inCartItemsTotal,
  double? tax,
) {
  // multiply a list of doubles by percentage to two decimal places
  return double.parse(
    ((inCartItemsTotal!.fold(0, (dynamic a, b) => a + b) * (tax! / 100))
        .toStringAsFixed(2)),
  );
}

double orderTotal(
  double? subtotal,
  double? tax,
  double? delivery,
) {
  // add doubles together and multiply by 100 no decimal places
  double subtotalMultiply = subtotal! * 100;
  double taxMultiply = tax! * 100;
  double deliveryMulptly = delivery! * 100;

  double orderTotal = subtotalMultiply + taxMultiply + deliveryMulptly;
  double orderTotalEnd = orderTotal;
  return orderTotalEnd;
}

double orderTotalCopy(
  double? subtotal,
  double? tax,
  double? delivery,
) {
  // add doubles together
  return double.parse((subtotal! + tax! + delivery!).toStringAsFixed(2));
  ;
}

bool showSearchResult(
  String? textSearchFor,
  String? textSearchIn,
) {
  // Add your function code here!
  return textSearchIn!.contains(textSearchFor!);
}

int distanceInteger(
  LatLng? locationUser,
  LatLng? locationRestaurant,
) {
  // get distance between 2 locations in miles and convert result to integer
  var p = 0.017453292519943295;
  var c = math.cos;
  var a = 0.5 -
      c((locationRestaurant!.latitude - locationUser!.latitude) * p) / 2 +
      c(locationUser.latitude * p) *
          c(locationRestaurant.latitude * p) *
          (1 - c((locationRestaurant.longitude - locationUser.longitude) * p)) /
          2;
  return (12742 * math.asin(math.sqrt(a))).ceil();
}

bool filterFollowing(
  List<DocumentReference>? searchFollowing,
  DocumentReference? user,
) {
  // return user record if in user collection
  bool result = false;
  searchFollowing?.forEach(
    (
      otherUser,
    ) {
      if (user == otherUser) {
        result = true;
      }
    },
  );
  return result;
}

List<RestaurantsRecord>? getPlacesMaximumDistanceCopy(
  List<RestaurantsRecord> places,
  LatLng userGeo,
  double maxDistance,
) {
  // First create some emptyList
  List<RestaurantsRecord> placesList = [];
  List<double> listKm = [];
  double lat1 = userGeo.latitude;
  double lon1 = userGeo.longitude;
  // This iterates through the single documents "places" in the List
  for (RestaurantsRecord place in places) {
    double lat2 = place.restLatLong!.latitude;
    double lon2 = place.restLatLong!.longitude;
    // This is doing math for distance calculations on the surface of a spheroid
    var c = math.cos;
    var p = 0.017453292519943295;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    // This is getting us the distance
    var d = (12742 * math.asin(math.sqrt(a)));
    String inString = d.toStringAsFixed(2); // '2.35'
    double inDouble = double.parse(inString);
    listKm.add(inDouble);
    // Sort the documents that will be returned by distance
    listKm.sort();
    int listKmIndex = listKm.indexWhere((dist) => dist == inDouble);
    // Check if the document we are currently processing is no farther away from userGeo than we defined as max.
    if (inDouble <= maxDistance!) {
      // If its within our radius, add it to the list of places documents that will be returned
      placesList.insert(listKmIndex, place);
    }
  }
  return placesList;
}

double percentage(
  double? smallNumber,
  double? bigNumber,
) {
  // divide two doubles
  if (smallNumber != null && bigNumber != null) {
    return smallNumber * 100 / bigNumber;
  }
  return -1;
}

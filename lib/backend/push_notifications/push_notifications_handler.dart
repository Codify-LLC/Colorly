import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    setState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Builder(
            builder: (context) => Image.asset(
              'assets/images/login_screen_1.png',
              fit: BoxFit.cover,
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'login': (data) async => LoginWidget(),
  'searchResults': (data) async => SearchResultsWidget(),
  'explore': (data) async => hasMatchingParameters(
          data, {'restaurants', 'posts', 'addNumber', 'addNumberRef'})
      ? ExploreWidget(
          restaurants: await getDocumentParameter(
              data, 'restaurants', RestaurantsRecord.serializer),
          posts:
              await getDocumentParameter(data, 'posts', PostsRecord.serializer),
          addNumber: await getDocumentParameter(
              data, 'addNumber', AddNumberRecord.serializer),
          addNumberRef: getParameter(data, 'addNumberRef'),
        )
      : NavBarPage(initialPage: 'explore'),
  'createAccount': (data) async => CreateAccountWidget(),
  'restaurantDetails': (data) async => RestaurantDetailsWidget(
        restaurant: getParameter(data, 'restaurant'),
        posts:
            await getDocumentParameter(data, 'posts', PostsRecord.serializer),
        user: await getDocumentParameter(data, 'user', UsersRecord.serializer),
        menuitems: await getDocumentParameter(
            data, 'menuitems', MenuItemRecord.serializer),
        authUser: getParameter(data, 'authUser'),
        menuCourse: await getDocumentParameter(
            data, 'menuCourse', MenuCourseRecord.serializer),
        menuCourses: getParameter(data, 'menuCourses'),
        restaurantrec: await getDocumentParameter(
            data, 'restaurantrec', RestaurantsRecord.serializer),
        integer: getParameter(data, 'integer'),
        initialIndex: getParameter(data, 'initialIndex'),
      ),
  'addStoryPage': (data) async => AddStoryPageWidget(
        user: await getDocumentParameter(data, 'user', UsersRecord.serializer),
        restaurant: await getDocumentParameter(
            data, 'restaurant', RestaurantsRecord.serializer),
      ),
  'userProfile': (data) async => hasMatchingParameters(
          data, {'posts', 'user', 'friends', 'post', 'likes'})
      ? UserProfileWidget(
          posts: getParameter(data, 'posts'),
          user:
              await getDocumentParameter(data, 'user', UsersRecord.serializer),
          friends: await getDocumentParameter(
              data, 'friends', FriendsRecord.serializer),
          post:
              await getDocumentParameter(data, 'post', PostsRecord.serializer),
          likes:
              await getDocumentParameter(data, 'likes', LikesRecord.serializer),
        )
      : NavBarPage(initialPage: 'userProfile'),
  'viewProfileOther': (data) async => ViewProfileOtherWidget(
        otherUser: getParameter(data, 'otherUser'),
        user: await getDocumentParameter(data, 'user', UsersRecord.serializer),
        friends: await getDocumentParameter(
            data, 'friends', FriendsRecord.serializer),
      ),
  'editProfile': (data) async => EditProfileWidget(
        user: await getDocumentParameter(data, 'user', UsersRecord.serializer),
      ),
  'addProfileInfo': (data) async => AddProfileInfoWidget(),
  'videoScreen': (data) async => VideoScreenWidget(
        initialStoryIndex: getParameter(data, 'initialStoryIndex'),
        restaurant: await getDocumentParameter(
            data, 'restaurant', RestaurantsRecord.serializer),
        user: await getDocumentParameter(data, 'user', UsersRecord.serializer),
        post: getParameter(data, 'post'),
      ),
  'onboarding': (data) async => OnboardingWidget(),
  'storyDetails': (data) async => StoryDetailsWidget(
        initialStoryIndex: getParameter(data, 'initialStoryIndex'),
        restaurant: await getDocumentParameter(
            data, 'restaurant', RestaurantsRecord.serializer),
        user: await getDocumentParameter(data, 'user', UsersRecord.serializer),
        stories: await getDocumentParameter(
            data, 'stories', StoriesRecord.serializer),
        storyRef: getParameter(data, 'storyRef'),
      ),
  'chatUser': (data) async => ChatUserWidget(
        chatUser: await getDocumentParameter(
            data, 'chatUser', UsersRecord.serializer),
        chatRef: getParameter(data, 'chatRef'),
      ),
  'chatMain': (data) async => hasMatchingParameters(data, {'user'})
      ? ChatMainWidget(
          user:
              await getDocumentParameter(data, 'user', UsersRecord.serializer),
        )
      : NavBarPage(initialPage: 'chatMain'),
  'searchUsers': (data) async => NavBarPage(initialPage: 'searchUsers'),
  'following': (data) async => FollowingWidget(
        friends: await getDocumentParameter(
            data, 'friends', FriendsRecord.serializer),
        user: await getDocumentParameter(data, 'user', UsersRecord.serializer),
      ),
  'mapResultsPage': (data) async => MapResultsPageWidget(
        restaurant: getParameter(data, 'restaurant'),
      ),
  'editRestaurant': (data) async => EditRestaurantWidget(
        user: await getDocumentParameter(data, 'user', UsersRecord.serializer),
        restaurant: await getDocumentParameter(
            data, 'restaurant', RestaurantsRecord.serializer),
      ),
  'restaurantReviewsList': (data) async => RestaurantReviewsListWidget(
        initialStoryIndex: getParameter(data, 'initialStoryIndex'),
        restaurant: await getDocumentParameter(
            data, 'restaurant', RestaurantsRecord.serializer),
        user: await getDocumentParameter(data, 'user', UsersRecord.serializer),
        post: getParameter(data, 'post'),
        hgcvk: getParameter(data, 'hgcvk'),
        share: getParameter(data, 'share'),
      ),
  'restProfilePageCopy': (data) async => RestProfilePageCopyWidget(
        restaurant: getParameter(data, 'restaurant'),
        user: await getDocumentParameter(data, 'user', UsersRecord.serializer),
        story:
            await getDocumentParameter(data, 'story', StoriesRecord.serializer),
        menuItems: await getDocumentParameter(
            data, 'menuItems', MenuItemRecord.serializer),
      ),
  'phoneSignIn': (data) async => PhoneSignInWidget(),
  'phoneVerification': (data) async => PhoneVerificationWidget(),
  'blockedUsers': (data) async => BlockedUsersWidget(
        friends: await getDocumentParameter(
            data, 'friends', FriendsRecord.serializer),
        user: await getDocumentParameter(data, 'user', UsersRecord.serializer),
      ),
  'storyDetailsCopy': (data) async => StoryDetailsCopyWidget(
        initialStoryIndex: getParameter(data, 'initialStoryIndex'),
        restaurant: await getDocumentParameter(
            data, 'restaurant', RestaurantsRecord.serializer),
        user: await getDocumentParameter(data, 'user', UsersRecord.serializer),
        stories: await getDocumentParameter(
            data, 'stories', StoriesRecord.serializer),
      ),
  'bookmarked': (data) async => BookmarkedWidget(
        restaurants: await getDocumentParameter(
            data, 'restaurants', RestaurantsRecord.serializer),
        user: await getDocumentParameter(data, 'user', UsersRecord.serializer),
      ),
  'videoFind': (data) async => VideoFindWidget(
        posts:
            await getDocumentParameter(data, 'posts', PostsRecord.serializer),
        index: getParameter(data, 'index'),
      ),
  'videoFindSearch': (data) async => VideoFindSearchWidget(
        posts:
            await getDocumentParameter(data, 'posts', PostsRecord.serializer),
      ),
  'singleVideoPage': (data) async => SingleVideoPageWidget(
        initialStoryIndex: getParameter(data, 'initialStoryIndex'),
        restaurant: await getDocumentParameter(
            data, 'restaurant', RestaurantsRecord.serializer),
        user: await getDocumentParameter(data, 'user', UsersRecord.serializer),
        post: await getDocumentParameter(data, 'post', PostsRecord.serializer),
      ),
  'menuItemsPage': (data) async => MenuItemsPageWidget(
        menuItem: await getDocumentParameter(
            data, 'menuItem', MenuItemRecord.serializer),
        restaurant: await getDocumentParameter(
            data, 'restaurant', RestaurantsRecord.serializer),
        menuCourse: await getDocumentParameter(
            data, 'menuCourse', MenuCourseRecord.serializer),
      ),
  'videoTour': (data) async => VideoTourWidget(
        restaurant: await getDocumentParameter(
            data, 'restaurant', RestaurantsRecord.serializer),
      ),
  'submitReviewPage': (data) async => SubmitReviewPageWidget(
        restaurant: await getDocumentParameter(
            data, 'restaurant', RestaurantsRecord.serializer),
      ),
  'singleItem': (data) async => SingleItemWidget(
        menuItem: await getDocumentParameter(
            data, 'menuItem', MenuItemRecord.serializer),
        restaurant: await getDocumentParameter(
            data, 'restaurant', RestaurantsRecord.serializer),
      ),
  'reviewRating': (data) async => ReviewRatingWidget(
        user: await getDocumentParameter(data, 'user', UsersRecord.serializer),
        restaurant: await getDocumentParameter(
            data, 'restaurant', RestaurantsRecord.serializer),
        menuItem: await getDocumentParameter(
            data, 'menuItem', MenuItemRecord.serializer),
      ),
  'groupChatPage': (data) async => GroupChatPageWidget(
        users:
            await getDocumentParameter(data, 'users', UsersRecord.serializer),
      ),
  'addChatUsers': (data) async => AddChatUsersWidget(
        chat: await getDocumentParameter(data, 'chat', ChatsRecord.serializer),
      ),
  'statsPage': (data) async => StatsPageWidget(
        restaurant: await getDocumentParameter(
            data, 'restaurant', RestaurantsRecord.serializer),
      ),
  'shoppingCart': (data) async => ShoppingCartWidget(),
  'addMenuItem': (data) async => AddMenuItemWidget(
        restaurant: await getDocumentParameter(
            data, 'restaurant', RestaurantsRecord.serializer),
        menuItem: await getDocumentParameter(
            data, 'menuItem', MenuItemRecord.serializer),
        modifiers: await getDocumentParameter(
            data, 'modifiers', ModifiersRecord.serializer),
        menuCourse: await getDocumentParameter(
            data, 'menuCourse', MenuCourseRecord.serializer),
      ),
  'addModifier': (data) async => AddModifierWidget(
        menuItem: await getDocumentParameter(
            data, 'menuItem', MenuItemRecord.serializer),
        restaurant: await getDocumentParameter(
            data, 'restaurant', RestaurantsRecord.serializer),
      ),
  'addOption': (data) async => AddOptionWidget(
        menuItem: await getDocumentParameter(
            data, 'menuItem', MenuItemRecord.serializer),
        restaurant: await getDocumentParameter(
            data, 'restaurant', RestaurantsRecord.serializer),
      ),
  'order': (data) async => OrderWidget(
        restaurant: await getDocumentParameter(
            data, 'restaurant', RestaurantsRecord.serializer),
      ),
  'dealPage': (data) async => DealPageWidget(),
  'restDealPage': (data) async => RestDealPageWidget(
        restaurant: await getDocumentParameter(
            data, 'restaurant', RestaurantsRecord.serializer),
      ),
  'storySuccess': (data) async => StorySuccessWidget(
        story:
            await getDocumentParameter(data, 'story', StoriesRecord.serializer),
        restaurant: await getDocumentParameter(
            data, 'restaurant', RestaurantsRecord.serializer),
      ),
  'nearbyVideoPage': (data) async => NearbyVideoPageWidget(
        initialStoryIndex: getParameter(data, 'initialStoryIndex'),
        restaurant: await getDocumentParameter(
            data, 'restaurant', RestaurantsRecord.serializer),
        user: await getDocumentParameter(data, 'user', UsersRecord.serializer),
        post: await getDocumentParameter(data, 'post', PostsRecord.serializer),
      ),
  'adventurePage': (data) async => AdventurePageWidget(
        adventure: await getDocumentParameter(
            data, 'adventure', AdventuresRecord.serializer),
      ),
  'searchMenuItems': (data) async => SearchMenuItemsWidget(
        menuItem: await getDocumentParameter(
            data, 'menuItem', MenuItemRecord.serializer),
        restaurant: await getDocumentParameter(
            data, 'restaurant', RestaurantsRecord.serializer),
        menuCourse: await getDocumentParameter(
            data, 'menuCourse', MenuCourseRecord.serializer),
      ),
  'likedVideos': (data) async => LikedVideosWidget(),
  'createRestaurant': (data) async => CreateRestaurantWidget(),
  'inAppStartOrder': (data) async => InAppStartOrderWidget(
        restaurant: await getDocumentParameter(
            data, 'restaurant', RestaurantsRecord.serializer),
        user: await getDocumentParameter(data, 'user', UsersRecord.serializer),
      ),
  'curatedListSwipe': (data) async => CuratedListSwipeWidget(
        curatedList: await getDocumentParameter(
            data, 'curatedList', CuratedListsRecord.serializer),
      ),
  'curatedListPage': (data) async => CuratedListPageWidget(),
  'nearbyRestaurants': (data) async => NearbyRestaurantsWidget(),
  'restaurantOrders': (data) async => RestaurantOrdersWidget(
        restaurant: await getDocumentParameter(
            data, 'restaurant', RestaurantsRecord.serializer),
      ),
  'wallet': (data) async => WalletWidget(),
  'draftVideos': (data) async => DraftVideosWidget(),
  'orderTransactions': (data) async => OrderTransactionsWidget(),
  'orderStatus': (data) async => OrderStatusWidget(
        order:
            await getDocumentParameter(data, 'order', OrderRecord.serializer),
      ),
  'orderSuccess': (data) async => OrderSuccessWidget(),
  'StreamsPage': (data) async => StreamsPageWidget(),
  'BroadcastPage': (data) async => BroadcastPageWidget(),
  'LiveVideoPage': (data) async => LiveVideoPageWidget(
        stream: await getDocumentParameter(
            data, 'stream', StreamsRecord.serializer),
      ),
  'postCollage': (data) async => PostCollageWidget(
        user: await getDocumentParameter(data, 'user', UsersRecord.serializer),
      ),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}

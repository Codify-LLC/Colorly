import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '../../backend/backend.dart';

import '../../auth/firebase_user_provider.dart';

import '../../backend/firebase_dynamic_links/firebase_dynamic_links.dart'
    show DynamicLinksHandler;
import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';
export '../../backend/firebase_dynamic_links/firebase_dynamic_links.dart'
    show generateCurrentPageLink;

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  ColorlyBackupFirebaseUser? initialUser;
  ColorlyBackupFirebaseUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(ColorlyBackupFirebaseUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) =>
          appStateNotifier.loggedIn ? NavBarPage() : LoginWidget(),
      navigatorBuilder: (_, __, child) => DynamicLinksHandler(child: child),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : LoginWidget(),
          routes: [
            FFRoute(
              name: 'login',
              path: 'login',
              builder: (context, params) => LoginWidget(),
            ),
            FFRoute(
              name: 'createAccount',
              path: 'createAccount',
              builder: (context, params) => CreateAccountWidget(),
            ),
            FFRoute(
              name: 'searchResults',
              path: 'searchResults',
              requireAuth: true,
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: SearchResultsWidget(),
              ),
            ),
            FFRoute(
              name: 'homePage',
              path: 'homePage',
              requireAuth: true,
              asyncParams: {
                'user': getDoc(['users'], UsersRecord.serializer),
                'posts': getDoc(['posts'], PostsRecord.serializer),
              },
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'homePage')
                  : HomePageWidget(
                      numLikes: params.getParam('numLikes', ParamType.int),
                      user: params.getParam('user', ParamType.Document),
                      posts: params.getParam('posts', ParamType.Document),
                      users: params.getParam('users',
                          ParamType.DocumentReference, false, ['users']),
                    ),
            ),
            FFRoute(
              name: 'explore',
              path: 'explore',
              asyncParams: {
                'restaurants':
                    getDoc(['restaurants'], RestaurantsRecord.serializer),
                'posts': getDoc(['posts'], PostsRecord.serializer),
                'addNumber': getDoc(['addNumber'], AddNumberRecord.serializer),
              },
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'explore')
                  : ExploreWidget(
                      restaurants:
                          params.getParam('restaurants', ParamType.Document),
                      posts: params.getParam('posts', ParamType.Document),
                      addNumber:
                          params.getParam('addNumber', ParamType.Document),
                      addNumberRef: params.getParam('addNumberRef',
                          ParamType.DocumentReference, false, ['addNumber']),
                    ),
            ),
            FFRoute(
              name: 'storySuccess',
              path: 'storySuccess',
              requireAuth: true,
              asyncParams: {
                'story': getDoc(['stories'], StoriesRecord.serializer),
                'restaurant':
                    getDoc(['restaurants'], RestaurantsRecord.serializer),
              },
              builder: (context, params) => StorySuccessWidget(
                story: params.getParam('story', ParamType.Document),
                restaurant: params.getParam('restaurant', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'addStoryPage',
              path: 'addStoryPage',
              requireAuth: true,
              asyncParams: {
                'user': getDoc(['users'], UsersRecord.serializer),
                'restaurant':
                    getDoc(['restaurants'], RestaurantsRecord.serializer),
              },
              builder: (context, params) => AddStoryPageWidget(
                user: params.getParam('user', ParamType.Document),
                restaurant: params.getParam('restaurant', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'userProfile',
              path: 'userProfile',
              requireAuth: true,
              asyncParams: {
                'user': getDoc(['users'], UsersRecord.serializer),
                'friends': getDoc(['friends'], FriendsRecord.serializer),
                'post': getDoc(['posts'], PostsRecord.serializer),
                'likes': getDoc(['likes'], LikesRecord.serializer),
              },
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'userProfile')
                  : UserProfileWidget(
                      posts: params.getParam('posts',
                          ParamType.DocumentReference, false, ['posts']),
                      user: params.getParam('user', ParamType.Document),
                      friends: params.getParam('friends', ParamType.Document),
                      post: params.getParam('post', ParamType.Document),
                      likes: params.getParam('likes', ParamType.Document),
                    ),
            ),
            FFRoute(
              name: 'viewProfileOther',
              path: 'viewProfileOther',
              requireAuth: true,
              asyncParams: {
                'user': getDoc(['users'], UsersRecord.serializer),
                'friends': getDoc(['friends'], FriendsRecord.serializer),
              },
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: ViewProfileOtherWidget(
                  otherUser: params.getParam('otherUser',
                      ParamType.DocumentReference, false, ['users']),
                  user: params.getParam('user', ParamType.Document),
                  friends: params.getParam('friends', ParamType.Document),
                ),
              ),
            ),
            FFRoute(
              name: 'editProfile',
              path: 'editProfile',
              requireAuth: true,
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: EditProfileWidget(),
              ),
            ),
            FFRoute(
              name: 'addProfileInfo',
              path: 'addProfileInfo',
              requireAuth: true,
              builder: (context, params) => AddProfileInfoWidget(),
            ),
            FFRoute(
              name: 'videoScreen',
              path: 'videoScreen',
              requireAuth: true,
              asyncParams: {
                'restaurant':
                    getDoc(['restaurants'], RestaurantsRecord.serializer),
                'user': getDoc(['users'], UsersRecord.serializer),
              },
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: VideoScreenWidget(
                  initialStoryIndex:
                      params.getParam('initialStoryIndex', ParamType.int),
                  restaurant: params.getParam('restaurant', ParamType.Document),
                  user: params.getParam('user', ParamType.Document),
                  post: params.getParam(
                      'post', ParamType.DocumentReference, false, ['posts']),
                ),
              ),
            ),
            FFRoute(
              name: 'onboarding',
              path: 'onboarding',
              requireAuth: true,
              builder: (context, params) => OnboardingWidget(),
            ),
            FFRoute(
              name: 'storyDetails',
              path: 'storyDetails',
              requireAuth: true,
              asyncParams: {
                'restaurant':
                    getDoc(['restaurants'], RestaurantsRecord.serializer),
                'user': getDoc(['users'], UsersRecord.serializer),
                'stories': getDoc(['stories'], StoriesRecord.serializer),
              },
              builder: (context, params) => StoryDetailsWidget(
                initialStoryIndex:
                    params.getParam('initialStoryIndex', ParamType.int),
                restaurant: params.getParam('restaurant', ParamType.Document),
                user: params.getParam('user', ParamType.Document),
                stories: params.getParam('stories', ParamType.Document),
                storyRef: params.getParam('storyRef',
                    ParamType.DocumentReference, false, ['stories']),
              ),
            ),
            FFRoute(
              name: 'chatUser',
              path: 'chatUser',
              requireAuth: true,
              asyncParams: {
                'chatUser': getDoc(['users'], UsersRecord.serializer),
              },
              builder: (context, params) => ChatUserWidget(
                chatUser: params.getParam('chatUser', ParamType.Document),
                chatRef: params.getParam(
                    'chatRef', ParamType.DocumentReference, false, ['chats']),
              ),
            ),
            FFRoute(
              name: 'chatMain',
              path: 'chatMain',
              requireAuth: true,
              asyncParams: {
                'user': getDoc(['users'], UsersRecord.serializer),
              },
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'chatMain')
                  : ChatMainWidget(
                      user: params.getParam('user', ParamType.Document),
                    ),
            ),
            FFRoute(
              name: 'searchUsers',
              path: 'searchUsers',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'searchUsers')
                  : SearchUsersWidget(),
            ),
            FFRoute(
              name: 'following',
              path: 'following',
              requireAuth: true,
              asyncParams: {
                'user': getDoc(['users'], UsersRecord.serializer),
              },
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: FollowingWidget(
                  user: params.getParam('user', ParamType.Document),
                ),
              ),
            ),
            FFRoute(
              name: 'editRestaurant',
              path: 'editRestaurant',
              requireAuth: true,
              asyncParams: {
                'user': getDoc(['users'], UsersRecord.serializer),
                'restaurant':
                    getDoc(['restaurants'], RestaurantsRecord.serializer),
              },
              builder: (context, params) => EditRestaurantWidget(
                user: params.getParam('user', ParamType.Document),
                restaurant: params.getParam('restaurant', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'restaurantReviewsList',
              path: 'restaurantReviewsList',
              requireAuth: true,
              asyncParams: {
                'restaurant':
                    getDoc(['restaurants'], RestaurantsRecord.serializer),
                'user': getDoc(['users'], UsersRecord.serializer),
              },
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: RestaurantReviewsListWidget(
                  initialStoryIndex:
                      params.getParam('initialStoryIndex', ParamType.int),
                  restaurant: params.getParam('restaurant', ParamType.Document),
                  user: params.getParam('user', ParamType.Document),
                  post: params.getParam(
                      'post', ParamType.DocumentReference, false, ['posts']),
                  hgcvk: params.getParam('hgcvk', ParamType.String),
                  share: params.getParam('share', ParamType.String),
                ),
              ),
            ),
            FFRoute(
              name: 'restProfilePageCopy',
              path: 'restProfilePageCopy',
              requireAuth: true,
              asyncParams: {
                'user': getDoc(['users'], UsersRecord.serializer),
                'story': getDoc(['stories'], StoriesRecord.serializer),
                'menuItems': getDoc(['menuItem'], MenuItemRecord.serializer),
              },
              builder: (context, params) => RestProfilePageCopyWidget(
                restaurant: params.getParam('restaurant',
                    ParamType.DocumentReference, false, ['restaurants']),
                user: params.getParam('user', ParamType.Document),
                story: params.getParam('story', ParamType.Document),
                menuItems: params.getParam('menuItems', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'phoneSignIn',
              path: 'phoneSignIn',
              builder: (context, params) => PhoneSignInWidget(),
            ),
            FFRoute(
              name: 'phoneVerification',
              path: 'phoneVerification',
              builder: (context, params) => PhoneVerificationWidget(),
            ),
            FFRoute(
              name: 'blockedUsers',
              path: 'blockedUsers',
              requireAuth: true,
              asyncParams: {
                'friends': getDoc(['friends'], FriendsRecord.serializer),
                'user': getDoc(['users'], UsersRecord.serializer),
              },
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: BlockedUsersWidget(
                  friends: params.getParam('friends', ParamType.Document),
                  user: params.getParam('user', ParamType.Document),
                ),
              ),
            ),
            FFRoute(
              name: 'storyDetailsCopy',
              path: 'storyDetailsCopy',
              requireAuth: true,
              asyncParams: {
                'restaurant':
                    getDoc(['restaurants'], RestaurantsRecord.serializer),
                'user': getDoc(['users'], UsersRecord.serializer),
                'stories': getDoc(['stories'], StoriesRecord.serializer),
              },
              builder: (context, params) => StoryDetailsCopyWidget(
                initialStoryIndex:
                    params.getParam('initialStoryIndex', ParamType.int),
                restaurant: params.getParam('restaurant', ParamType.Document),
                user: params.getParam('user', ParamType.Document),
                stories: params.getParam('stories', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'bookmarked',
              path: 'bookmarked',
              requireAuth: true,
              asyncParams: {
                'restaurants':
                    getDoc(['restaurants'], RestaurantsRecord.serializer),
                'user': getDoc(['users'], UsersRecord.serializer),
              },
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: BookmarkedWidget(
                  restaurants:
                      params.getParam('restaurants', ParamType.Document),
                  user: params.getParam('user', ParamType.Document),
                ),
              ),
            ),
            FFRoute(
              name: 'videoFind',
              path: 'videoFind',
              requireAuth: true,
              asyncParams: {
                'posts': getDoc(['posts'], PostsRecord.serializer),
              },
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: VideoFindWidget(
                  posts: params.getParam('posts', ParamType.Document),
                  index: params.getParam('index', ParamType.int),
                ),
              ),
            ),
            FFRoute(
              name: 'videoFindSearch',
              path: 'videoFindSearch',
              requireAuth: true,
              asyncParams: {
                'posts': getDoc(['posts'], PostsRecord.serializer),
              },
              builder: (context, params) => VideoFindSearchWidget(
                posts: params.getParam('posts', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'menuItemsPage',
              path: 'menuItemsPage',
              requireAuth: true,
              asyncParams: {
                'menuItem': getDoc(['menuItem'], MenuItemRecord.serializer),
                'restaurant':
                    getDoc(['restaurants'], RestaurantsRecord.serializer),
                'menuCourse':
                    getDoc(['menuCourse'], MenuCourseRecord.serializer),
              },
              builder: (context, params) => MenuItemsPageWidget(
                menuItem: params.getParam('menuItem', ParamType.Document),
                restaurant: params.getParam('restaurant', ParamType.Document),
                menuCourse: params.getParam('menuCourse', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'videoTour',
              path: 'videoTour',
              requireAuth: true,
              asyncParams: {
                'restaurant':
                    getDoc(['restaurants'], RestaurantsRecord.serializer),
              },
              builder: (context, params) => VideoTourWidget(
                restaurant: params.getParam('restaurant', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'submitReviewPage',
              path: 'submitReviewPage',
              requireAuth: true,
              asyncParams: {
                'restaurant':
                    getDoc(['restaurants'], RestaurantsRecord.serializer),
              },
              builder: (context, params) => SubmitReviewPageWidget(
                restaurant: params.getParam('restaurant', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'singleItem',
              path: 'singleItem',
              requireAuth: true,
              asyncParams: {
                'menuItem': getDoc(['menuItem'], MenuItemRecord.serializer),
                'restaurant':
                    getDoc(['restaurants'], RestaurantsRecord.serializer),
              },
              builder: (context, params) => SingleItemWidget(
                menuItem: params.getParam('menuItem', ParamType.Document),
                restaurant: params.getParam('restaurant', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'reviewRating',
              path: 'reviewRating',
              requireAuth: true,
              asyncParams: {
                'user': getDoc(['users'], UsersRecord.serializer),
                'restaurant':
                    getDoc(['restaurants'], RestaurantsRecord.serializer),
                'menuItem': getDoc(['menuItem'], MenuItemRecord.serializer),
              },
              builder: (context, params) => ReviewRatingWidget(
                user: params.getParam('user', ParamType.Document),
                restaurant: params.getParam('restaurant', ParamType.Document),
                menuItem: params.getParam('menuItem', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'groupChatPage',
              path: 'groupChatPage',
              requireAuth: true,
              asyncParams: {
                'users': getDoc(['users'], UsersRecord.serializer),
              },
              builder: (context, params) => GroupChatPageWidget(
                users: params.getParam('users', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'addChatUsers',
              path: 'addChatUsers',
              requireAuth: true,
              asyncParams: {
                'chat': getDoc(['chats'], ChatsRecord.serializer),
              },
              builder: (context, params) => AddChatUsersWidget(
                chat: params.getParam('chat', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'statsPage',
              path: 'statsPage',
              requireAuth: true,
              asyncParams: {
                'restaurant':
                    getDoc(['restaurants'], RestaurantsRecord.serializer),
              },
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: StatsPageWidget(
                  restaurant: params.getParam('restaurant', ParamType.Document),
                ),
              ),
            ),
            FFRoute(
              name: 'shoppingCart',
              path: 'shoppingCart',
              requireAuth: true,
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: ShoppingCartWidget(),
              ),
            ),
            FFRoute(
              name: 'addMenuItem',
              path: 'addMenuItem',
              requireAuth: true,
              asyncParams: {
                'restaurant':
                    getDoc(['restaurants'], RestaurantsRecord.serializer),
                'menuItem': getDoc(['menuItem'], MenuItemRecord.serializer),
                'modifiers': getDoc(['modifiers'], ModifiersRecord.serializer),
                'menuCourse':
                    getDoc(['menuCourse'], MenuCourseRecord.serializer),
              },
              builder: (context, params) => AddMenuItemWidget(
                restaurant: params.getParam('restaurant', ParamType.Document),
                menuItem: params.getParam('menuItem', ParamType.Document),
                modifiers: params.getParam('modifiers', ParamType.Document),
                menuCourse: params.getParam('menuCourse', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'addModifier',
              path: 'addModifier',
              requireAuth: true,
              asyncParams: {
                'menuItem': getDoc(['menuItem'], MenuItemRecord.serializer),
                'restaurant':
                    getDoc(['restaurants'], RestaurantsRecord.serializer),
              },
              builder: (context, params) => AddModifierWidget(
                menuItem: params.getParam('menuItem', ParamType.Document),
                restaurant: params.getParam('restaurant', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'addOption',
              path: 'addOption',
              requireAuth: true,
              asyncParams: {
                'menuItem': getDoc(['menuItem'], MenuItemRecord.serializer),
                'restaurant':
                    getDoc(['restaurants'], RestaurantsRecord.serializer),
              },
              builder: (context, params) => AddOptionWidget(
                menuItem: params.getParam('menuItem', ParamType.Document),
                restaurant: params.getParam('restaurant', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'order',
              path: 'order',
              requireAuth: true,
              asyncParams: {
                'restaurant':
                    getDoc(['restaurants'], RestaurantsRecord.serializer),
              },
              builder: (context, params) => OrderWidget(
                restaurant: params.getParam('restaurant', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'dealPage',
              path: 'dealPage',
              requireAuth: true,
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: DealPageWidget(),
              ),
            ),
            FFRoute(
              name: 'restDealPage',
              path: 'restDealPage',
              requireAuth: true,
              asyncParams: {
                'restaurant':
                    getDoc(['restaurants'], RestaurantsRecord.serializer),
              },
              builder: (context, params) => RestDealPageWidget(
                restaurant: params.getParam('restaurant', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'nearbyVideoPage',
              path: 'nearbyVideoPage',
              requireAuth: true,
              asyncParams: {
                'restaurant':
                    getDoc(['restaurants'], RestaurantsRecord.serializer),
                'user': getDoc(['users'], UsersRecord.serializer),
                'post': getDoc(['posts'], PostsRecord.serializer),
              },
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: NearbyVideoPageWidget(
                  initialStoryIndex:
                      params.getParam('initialStoryIndex', ParamType.int),
                  restaurant: params.getParam('restaurant', ParamType.Document),
                  user: params.getParam('user', ParamType.Document),
                  post: params.getParam('post', ParamType.Document),
                ),
              ),
            ),
            FFRoute(
              name: 'singleVideoPage',
              path: 'singleVideoPage',
              requireAuth: true,
              asyncParams: {
                'restaurant':
                    getDoc(['restaurants'], RestaurantsRecord.serializer),
                'user': getDoc(['users'], UsersRecord.serializer),
                'post': getDoc(['posts'], PostsRecord.serializer),
              },
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: SingleVideoPageWidget(
                  initialStoryIndex:
                      params.getParam('initialStoryIndex', ParamType.int),
                  restaurant: params.getParam('restaurant', ParamType.Document),
                  user: params.getParam('user', ParamType.Document),
                  post: params.getParam('post', ParamType.Document),
                ),
              ),
            ),
            FFRoute(
              name: 'searchMenuItems',
              path: 'searchMenuItems',
              requireAuth: true,
              asyncParams: {
                'menuItem': getDoc(['menuItem'], MenuItemRecord.serializer),
                'restaurant':
                    getDoc(['restaurants'], RestaurantsRecord.serializer),
                'menuCourse':
                    getDoc(['menuCourse'], MenuCourseRecord.serializer),
              },
              builder: (context, params) => SearchMenuItemsWidget(
                menuItem: params.getParam('menuItem', ParamType.Document),
                restaurant: params.getParam('restaurant', ParamType.Document),
                menuCourse: params.getParam('menuCourse', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'likedVideos',
              path: 'likedVideos',
              requireAuth: true,
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: LikedVideosWidget(),
              ),
            ),
            FFRoute(
              name: 'createRestaurant',
              path: 'createRestaurant',
              requireAuth: true,
              builder: (context, params) => CreateRestaurantWidget(),
            ),
            FFRoute(
              name: 'inAppStartOrder',
              path: 'inAppStartOrder',
              requireAuth: true,
              asyncParams: {
                'restaurant':
                    getDoc(['restaurants'], RestaurantsRecord.serializer),
                'user': getDoc(['users'], UsersRecord.serializer),
              },
              builder: (context, params) => InAppStartOrderWidget(
                restaurant: params.getParam('restaurant', ParamType.Document),
                user: params.getParam('user', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'curatedListSwipe',
              path: 'curatedListSwipe',
              requireAuth: true,
              asyncParams: {
                'curatedList':
                    getDoc(['curatedLists'], CuratedListsRecord.serializer),
              },
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: CuratedListSwipeWidget(
                  curatedList:
                      params.getParam('curatedList', ParamType.Document),
                ),
              ),
            ),
            FFRoute(
              name: 'nearbyRestaurants',
              path: 'nearbyRestaurants',
              requireAuth: true,
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: NearbyRestaurantsWidget(),
              ),
            ),
            FFRoute(
              name: 'curatedListPage',
              path: 'curatedListPage',
              requireAuth: true,
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: CuratedListPageWidget(),
              ),
            ),
            FFRoute(
              name: 'restaurantOrders',
              path: 'restaurantOrders',
              requireAuth: true,
              asyncParams: {
                'restaurant':
                    getDoc(['restaurants'], RestaurantsRecord.serializer),
              },
              builder: (context, params) => RestaurantOrdersWidget(
                restaurant: params.getParam('restaurant', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'orderTransactions',
              path: 'orderTransactions',
              requireAuth: true,
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: OrderTransactionsWidget(),
              ),
            ),
            FFRoute(
              name: 'wallet',
              path: 'wallet',
              requireAuth: true,
              builder: (context, params) => WalletWidget(),
            ),
            FFRoute(
              name: 'orderStatus',
              path: 'orderStatus',
              requireAuth: true,
              asyncParams: {
                'order': getDoc(['order'], OrderRecord.serializer),
              },
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: OrderStatusWidget(
                  order: params.getParam('order', ParamType.Document),
                ),
              ),
            ),
            FFRoute(
              name: 'orderSuccess',
              path: 'orderSuccess',
              requireAuth: true,
              builder: (context, params) => OrderSuccessWidget(),
            ),
            FFRoute(
              name: 'StreamsPage',
              path: 'streamsPage',
              requireAuth: true,
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: StreamsPageWidget(),
              ),
            ),
            FFRoute(
              name: 'postCollage',
              path: 'postCollage',
              requireAuth: true,
              asyncParams: {
                'user': getDoc(['users'], UsersRecord.serializer),
              },
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: PostCollageWidget(
                  user: params.getParam('user', ParamType.Document),
                ),
              ),
            ),
            FFRoute(
              name: 'gallery',
              path: 'gallery',
              requireAuth: true,
              asyncParams: {
                'restaurant':
                    getDoc(['restaurants'], RestaurantsRecord.serializer),
              },
              builder: (context, params) => GalleryWidget(
                restaurant: params.getParam('restaurant', ParamType.Document),
                restaurantRef: params.getParam('restaurantRef',
                    ParamType.DocumentReference, false, ['restaurants']),
              ),
            ),
            FFRoute(
              name: 'homePageTest',
              path: 'homePageTest',
              requireAuth: true,
              asyncParams: {
                'user': getDoc(['users'], UsersRecord.serializer),
                'posts': getDoc(['posts'], PostsRecord.serializer),
              },
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'homePageTest')
                  : HomePageTestWidget(
                      numLikes: params.getParam('numLikes', ParamType.int),
                      user: params.getParam('user', ParamType.Document),
                      posts: params.getParam('posts', ParamType.Document),
                      users: params.getParam('users',
                          ParamType.DocumentReference, false, ['users']),
                    ),
            ),
            FFRoute(
              name: 'LiveVideoPage',
              path: 'liveVideoPage',
              requireAuth: true,
              asyncParams: {
                'stream': getDoc(['streams'], StreamsRecord.serializer),
              },
              builder: (context, params) => LiveVideoPageWidget(
                stream: params.getParam('stream', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'restaurantDetails',
              path: 'restaurantDetails',
              requireAuth: true,
              asyncParams: {
                'posts': getDoc(['posts'], PostsRecord.serializer),
                'user': getDoc(['users'], UsersRecord.serializer),
                'menuitems': getDoc(['menuItem'], MenuItemRecord.serializer),
                'menuCourse':
                    getDoc(['menuCourse'], MenuCourseRecord.serializer),
                'restaurantrec':
                    getDoc(['restaurants'], RestaurantsRecord.serializer),
              },
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: RestaurantDetailsWidget(
                  restaurant: params.getParam('restaurant',
                      ParamType.DocumentReference, false, ['restaurants']),
                  posts: params.getParam('posts', ParamType.Document),
                  user: params.getParam('user', ParamType.Document),
                  menuitems: params.getParam('menuitems', ParamType.Document),
                  authUser: params.getParam('authUser',
                      ParamType.DocumentReference, false, ['users']),
                  menuCourse: params.getParam('menuCourse', ParamType.Document),
                  menuCourses: params.getParam('menuCourses',
                      ParamType.DocumentReference, false, ['menuCourse']),
                  restaurantrec:
                      params.getParam('restaurantrec', ParamType.Document),
                  integer: params.getParam('integer', ParamType.int),
                  initialIndex: params.getParam('initialIndex', ParamType.int),
                ),
              ),
            ),
            FFRoute(
              name: 'draftVideos',
              path: 'draftVideos',
              requireAuth: true,
              builder: (context, params) => DraftVideosWidget(),
            ),
            FFRoute(
              name: 'profileHome',
              path: 'profileHome',
              requireAuth: true,
              builder: (context, params) => ProfileHomeWidget(),
            ),
            FFRoute(
              name: 'toggleNotifications',
              path: 'toggleNotifications',
              requireAuth: true,
              builder: (context, params) => ToggleNotificationsWidget(),
            ),
            FFRoute(
              name: 'homePageCopy',
              path: 'homePageCopy',
              requireAuth: true,
              asyncParams: {
                'user': getDoc(['users'], UsersRecord.serializer),
                'posts': getDoc(['posts'], PostsRecord.serializer),
              },
              builder: (context, params) => HomePageCopyWidget(
                numLikes: params.getParam('numLikes', ParamType.int),
                user: params.getParam('user', ParamType.Document),
                posts: params.getParam('posts', ParamType.Document),
                users: params.getParam(
                    'users', ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'indyOnly',
              path: 'indyOnly',
              requireAuth: true,
              builder: (context, params) => IndyOnlyWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ).toRoute(appStateNotifier),
      ],
      urlPathStrategy: UrlPathStrategy.path,
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList, collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/login_screen_1.png',
                    fit: BoxFit.cover,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 300),
      );
}

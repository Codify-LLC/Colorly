import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';
import 'backend/push_notifications/push_notifications_util.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';

import 'backend/stripe/payment_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FlutterFlowTheme.initialize();

  FFAppState(); // Initialize FFAppState

  await initializeStripe();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late Stream<ColorlyAppFirebaseUser> userStream;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  final authUserSub = authenticatedUserStream.listen((_) {});
  final fcmTokenSub = fcmTokenUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    _appStateNotifier = AppStateNotifier();
    _router = createRouter(_appStateNotifier);
    userStream = colorlyAppFirebaseUserStream()
      ..listen((user) => _appStateNotifier.update(user));
    Future.delayed(
      Duration(seconds: 1),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();
    fcmTokenSub.cancel();
    super.dispose();
  }

  void setLocale(String language) =>
      setState(() => _locale = createLocale(language));
  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Colorly App',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
      ],
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: _themeMode,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key, this.initialPage, this.page}) : super(key: key);

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'homePage';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'homePage': HomePageWidget(),
      'explore': ExploreWidget(),
      'chatMain': ChatMainWidget(),
      'searchUsers': SearchUsersWidget(),
      'userProfile': UserProfileWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);
    return Scaffold(
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar: GNav(
        selectedIndex: currentIndex,
        onTabChange: (i) => setState(() {
          _currentPage = null;
          _currentPageName = tabs.keys.toList()[i];
        }),
        backgroundColor: Color(0xFF060606),
        color: Color(0xFFA4A4A4),
        activeColor: Color(0xFFEEEEEE),
        tabBackgroundColor: FlutterFlowTheme.of(context).primaryColor,
        tabBorderRadius: 100,
        tabMargin: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 15),
        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
        gap: 8,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        duration: Duration(milliseconds: 300),
        haptic: true,
        tabs: [
          GButton(
            icon: Icons.home_outlined,
            text: FFLocalizations.of(context).getText(
              '1t2uo9tm' /* Home */,
            ),
            iconSize: 28,
            backgroundGradient: currentIndex == 0
                ? LinearGradient(
                    colors: [
                      FlutterFlowTheme.of(context).primaryColor,
                      Color(0xFF874E00)
                    ],
                    stops: [0, 1],
                    begin: AlignmentDirectional(1, -1),
                    end: AlignmentDirectional(-1, 1),
                  )
                : null,
          ),
          GButton(
            icon: FontAwesomeIcons.searchLocation,
            text: FFLocalizations.of(context).getText(
              'pekc8xx1' /* Explore */,
            ),
            iconSize: 20,
            backgroundGradient: currentIndex == 1
                ? LinearGradient(
                    colors: [
                      FlutterFlowTheme.of(context).primaryColor,
                      Color(0xFF874E00)
                    ],
                    stops: [0, 1],
                    begin: AlignmentDirectional(1, -1),
                    end: AlignmentDirectional(-1, 1),
                  )
                : null,
          ),
          GButton(
            icon: Icons.message_rounded,
            text: FFLocalizations.of(context).getText(
              'rphnwa9o' /* Chat */,
            ),
            iconSize: 22,
            backgroundGradient: currentIndex == 2
                ? LinearGradient(
                    colors: [
                      FlutterFlowTheme.of(context).primaryColor,
                      Color(0xFF874E00)
                    ],
                    stops: [0, 1],
                    begin: AlignmentDirectional(1, -1),
                    end: AlignmentDirectional(-1, 1),
                  )
                : null,
          ),
          GButton(
            icon: FontAwesomeIcons.users,
            text: FFLocalizations.of(context).getText(
              'q12c6nwt' /* Users */,
            ),
            iconSize: 24,
          ),
          GButton(
            icon: Icons.person_rounded,
            text: FFLocalizations.of(context).getText(
              'm41kowrm' /* Profile */,
            ),
            iconSize: 24,
            backgroundGradient: currentIndex == 4
                ? LinearGradient(
                    colors: [
                      FlutterFlowTheme.of(context).primaryColor,
                      Color(0xFF874E00)
                    ],
                    stops: [0, 1],
                    begin: AlignmentDirectional(1, -1),
                    end: AlignmentDirectional(-1, 1),
                  )
                : null,
          )
        ],
      ),
    );
  }
}

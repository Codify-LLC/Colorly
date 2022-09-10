import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAccountWidget extends StatefulWidget {
  const CreateAccountWidget({Key? key}) : super(key: key);

  @override
  _CreateAccountWidgetState createState() => _CreateAccountWidgetState();
}

class _CreateAccountWidgetState extends State<CreateAccountWidget> {
  TextEditingController? emailController;

  TextEditingController? passwordController;

  late bool passwordVisibility;

  TextEditingController? passwordConfirmController;

  late bool passwordConfirmVisibility;

  bool? checkboxListTileValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
    passwordConfirmController = TextEditingController();
    passwordConfirmVisibility = false;
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'createAccount'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'assets/images/login_screen.png',
            ).image,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 56, 0, 0),
                    child: Image.asset(
                      'assets/images/COLORLY_NEW_LOGO_fade_to_white.png',
                      width: 140,
                      height: 40,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 44),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'a71da90s' /* Welcome, */,
                          ),
                          style: FlutterFlowTheme.of(context).title1.override(
                                fontFamily: 'Lexend Deca',
                                color:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '0om3kvb5' /* Create your account below, or */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                  ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'CREATE_ACCOUNT_PAGE_LOGIN_BTN_ON_TAP');
                                logFirebaseEvent('Button_Navigate-To');

                                context.pushNamed(
                                  'login',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 200),
                                    ),
                                  },
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                'mld28txl' /* Login */,
                              ),
                              options: FFButtonOptions(
                                width: 70,
                                height: 28,
                                color: Color(0x00FFFFFF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      fontSize: 14,
                                    ),
                                elevation: 0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    child: TextFormField(
                      controller: emailController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: FFLocalizations.of(context).getText(
                          '0lhqopte' /* Your email... */,
                        ),
                        labelStyle: FlutterFlowTheme.of(context).bodyText1,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE6E6E6),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE6E6E6),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: FlutterFlowTheme.of(context).tertiaryColor,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).primaryDark,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 0),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: !passwordVisibility,
                      decoration: InputDecoration(
                        labelText: FFLocalizations.of(context).getText(
                          'tlbu70y2' /* Password */,
                        ),
                        labelStyle: FlutterFlowTheme.of(context).bodyText1,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE6E6E6),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE6E6E6),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: FlutterFlowTheme.of(context).tertiaryColor,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(16, 20, 24, 20),
                        suffixIcon: InkWell(
                          onTap: () => setState(
                            () => passwordVisibility = !passwordVisibility,
                          ),
                          focusNode: FocusNode(skipTraversal: true),
                          child: Icon(
                            passwordVisibility
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Color(0xFF2F2F2F),
                            size: 22,
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).primaryDark,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 0),
                    child: TextFormField(
                      controller: passwordConfirmController,
                      obscureText: !passwordConfirmVisibility,
                      decoration: InputDecoration(
                        labelText: FFLocalizations.of(context).getText(
                          'kabx20i9' /* Confirm Password */,
                        ),
                        labelStyle: FlutterFlowTheme.of(context).bodyText1,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE6E6E6),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE6E6E6),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: FlutterFlowTheme.of(context).tertiaryColor,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(16, 20, 24, 20),
                        suffixIcon: InkWell(
                          onTap: () => setState(
                            () => passwordConfirmVisibility =
                                !passwordConfirmVisibility,
                          ),
                          focusNode: FocusNode(skipTraversal: true),
                          child: Icon(
                            passwordConfirmVisibility
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Color(0xFF2F2F2F),
                            size: 22,
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).primaryDark,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'CREATE_ACCOUNT_CREATE_ACCOUNT_BTN_ON_TAP');
                              if (checkboxListTileValue!) {
                                logFirebaseEvent('Button_Auth');
                                GoRouter.of(context).prepareAuthEvent();
                                if (passwordController?.text !=
                                    passwordConfirmController?.text) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Passwords don\'t match!',
                                      ),
                                    ),
                                  );
                                  return;
                                }

                                final user = await createAccountWithEmail(
                                  context,
                                  emailController!.text,
                                  passwordController!.text,
                                );
                                if (user == null) {
                                  return;
                                }

                                final usersCreateData = createUsersRecordData(
                                  acceptsTerms: true,
                                  addNumberRef: FFAppState().addNumberRef,
                                );
                                await UsersRecord.collection
                                    .doc(user.uid)
                                    .update(usersCreateData);

                                logFirebaseEvent('Button_Navigate-To');

                                context.goNamedAuth('addProfileInfo', mounted);
                              } else {
                                logFirebaseEvent('Button_Show-Snack-Bar');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Please agree to the Terms and Conditions',
                                      style: TextStyle(),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor: Color(0x00000000),
                                  ),
                                );
                              }
                            },
                            text: FFLocalizations.of(context).getText(
                              'nb5oacbr' /* Create Account */,
                            ),
                            options: FFButtonOptions(
                              width: 170,
                              height: 50,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                  ),
                              elevation: 2,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.5, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Theme(
                                  data: ThemeData(
                                    unselectedWidgetColor: Color(0xFF707070),
                                  ),
                                  child: CheckboxListTile(
                                    value: checkboxListTileValue ??= true,
                                    onChanged: (newValue) => setState(() =>
                                        checkboxListTileValue = newValue!),
                                    title: Text(
                                      FFLocalizations.of(context).getText(
                                        'wo6xyqu0' /* Agree to  */,
                                      ),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .title3
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            fontSize: 14,
                                          ),
                                    ),
                                    tileColor: Color(0xFFF5F5F5),
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    checkColor: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    dense: true,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'CREATE_ACCOUNT_PAGE_Text_osb5yzyl_ON_TAP');
                              logFirebaseEvent('Text_Launch-U-R-L');
                              await launchURL('https://colorly.app/policies');
                            },
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'unbtu568' /* Terms & Conditions */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'CREATE_ACCOUNT_Container_8ppfterf_ON_TAP');
                            logFirebaseEvent('Container_Auth');
                            GoRouter.of(context).prepareAuthEvent();
                            final user = await signInWithGoogle(context);
                            if (user == null) {
                              return;
                            }
                            if (currentUserDocument!.addNumberRef != null) {
                              return;
                            }

                            logFirebaseEvent('Container_Backend-Call');

                            final usersUpdateData = createUsersRecordData(
                              addNumberRef: FFAppState().addNumberRef,
                            );
                            await currentUserReference!.update(usersUpdateData);
                            logFirebaseEvent('Container_Navigate-To');

                            context.pushNamedAuth('homePage', mounted);
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xBA333333),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Color(0x3314181B),
                                  offset: Offset(0, 2),
                                )
                              ],
                              shape: BoxShape.circle,
                            ),
                            alignment: AlignmentDirectional(0, 0),
                            child: FaIcon(
                              FontAwesomeIcons.google,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'CREATE_ACCOUNT_Container_k72naixf_ON_TAP');
                            logFirebaseEvent('Container_Auth');
                            GoRouter.of(context).prepareAuthEvent();
                            final user = await signInWithApple(context);
                            if (user == null) {
                              return;
                            }
                            if (currentUserDocument!.addNumberRef != null) {
                              return;
                            }

                            logFirebaseEvent('Container_Backend-Call');

                            final usersUpdateData = createUsersRecordData(
                              addNumberRef: FFAppState().addNumberRef,
                            );
                            await currentUserReference!.update(usersUpdateData);
                            logFirebaseEvent('Container_Navigate-To');

                            context.pushNamedAuth('homePage', mounted);
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xBA333333),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Color(0x3314181B),
                                  offset: Offset(0, 2),
                                )
                              ],
                              shape: BoxShape.circle,
                            ),
                            alignment: AlignmentDirectional(0, 0),
                            child: FaIcon(
                              FontAwesomeIcons.apple,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'CREATE_ACCOUNT_Container_qbtx7hqi_ON_TAP');
                            logFirebaseEvent('Container_Navigate-To');

                            context.pushNamed('phoneSignIn');
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xBA333333),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Color(0x3314181B),
                                  offset: Offset(0, 2),
                                )
                              ],
                              shape: BoxShape.circle,
                            ),
                            alignment: AlignmentDirectional(0, 0),
                            child: Icon(
                              Icons.phone_rounded,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_test_model.dart';
export 'home_page_test_model.dart';

class HomePageTestWidget extends StatefulWidget {
  const HomePageTestWidget({
    Key? key,
    this.numLikes,
    this.user,
    this.posts,
    this.users,
  }) : super(key: key);

  final int? numLikes;
  final UsersRecord? user;
  final PostsRecord? posts;
  final DocumentReference? users;

  @override
  _HomePageTestWidgetState createState() => _HomePageTestWidgetState();
}

class _HomePageTestWidgetState extends State<HomePageTestWidget> {
  late HomePageTestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageTestModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'homePageTest'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_TEST_homePageTest_ON_LOAD');
      logFirebaseEvent('homePageTest_custom_action');
      await actions.lockOrientation();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'homePageTest',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryDark,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: StreamBuilder<List<PostsRecord>>(
                stream: queryPostsRecord(
                  queryBuilder: (postsRecord) => postsRecord
                      .where('isFlagged', isEqualTo: false)
                      .orderBy('created_at', descending: true),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 30.0,
                        height: 30.0,
                        child: SpinKitThreeBounce(
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 30.0,
                        ),
                      ),
                    );
                  }
                  List<PostsRecord> preloadVideoPlayerCopyPostsRecordList =
                      snapshot.data!;
                  return Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: MediaQuery.of(context).size.height * 1.0,
                    child: custom_widgets.PreloadVideoPlayerCopy(
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: MediaQuery.of(context).size.height * 1.0,
                      itemCount: preloadVideoPlayerCopyPostsRecordList.length,
                      preLoadPagesCount: 4,
                      autoplay: false,
                      looping: true,
                      showControls: false,
                      allowFullScreen: true,
                      allowPlaybackSpeedMenu: false,
                      post: preloadVideoPlayerCopyPostsRecordList.toList(),
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}

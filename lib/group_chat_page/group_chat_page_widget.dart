import '../backend/backend.dart';
import '../chat_user/chat_user_widget.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class GroupChatPageWidget extends StatefulWidget {
  const GroupChatPageWidget({
    Key? key,
    this.users,
  }) : super(key: key);

  final UsersRecord? users;

  @override
  _GroupChatPageWidgetState createState() => _GroupChatPageWidgetState();
}

class _GroupChatPageWidgetState extends State<GroupChatPageWidget> {
  Map<UsersRecord, bool> checkboxListTileValueMap = {};
  List<UsersRecord> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  TextEditingController? textController;
  ChatsRecord? groupChat;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'groupChatPage'});
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryDark,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            logFirebaseEvent('GROUP_CHAT_arrow_back_rounded_ICN_ON_TAP');
            logFirebaseEvent('IconButton_Navigate-Back');
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'cz89i56m' /* Group Chat */,
          ),
          style: FlutterFlowTheme.of(context).title1.override(
                fontFamily: 'Lexend Deca',
                color: FlutterFlowTheme.of(context).tertiaryColor,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF1F4F8),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFFDBE2E7),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    color: Color(0x33000000),
                    offset: Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.circular(0),
              ),
              alignment: AlignmentDirectional(0, 0),
              child: TextFormField(
                controller: textController,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: FFLocalizations.of(context).getText(
                    'kkvh1ilu' /* Search for friends... */,
                  ),
                  hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF95A1AC),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  contentPadding: EdgeInsetsDirectional.fromSTEB(24, 14, 0, 0),
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: Color(0xFF95A1AC),
                    size: 24,
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFF95A1AC),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
            Expanded(
              child: StreamBuilder<List<UsersRecord>>(
                stream: queryUsersRecord(
                  limit: 50,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: SpinKitThreeBounce(
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 30,
                        ),
                      ),
                    );
                  }
                  List<UsersRecord> listViewUsersRecordList = snapshot.data!;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewUsersRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewUsersRecord =
                          listViewUsersRecordList[listViewIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                        child: Container(
                          width: double.infinity,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 0,
                                color: Color(0xFFDBE2E7),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2, 2, 2, 2),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: valueOrDefault<String>(
                                          listViewUsersRecord.photoUrl,
                                          'https://p1.pxfuel.com/preview/828/149/229/indistinct-blurred-pineapple-rough.jpg',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2, 0, 0, 0),
                                    child: Theme(
                                      data: ThemeData(
                                        unselectedWidgetColor:
                                            Color(0xFF707070),
                                      ),
                                      child: CheckboxListTile(
                                        value: checkboxListTileValueMap[
                                            listViewUsersRecord] ??= false,
                                        onChanged: (newValue) => setState(() =>
                                            checkboxListTileValueMap[
                                                    listViewUsersRecord] =
                                                newValue!),
                                        title: Text(
                                          listViewUsersRecord.displayName!,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        subtitle: Text(
                                          listViewUsersRecord.username!,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF1A1F24),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                        tileColor: Color(0xFFF5F5F5),
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryColor,
                                        dense: false,
                                        controlAffinity:
                                            ListTileControlAffinity.trailing,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x3314181B),
                    offset: Offset(0, -2),
                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 34),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('GROUP_CHAT_CREATE_CHAT_BTN_ON_TAP');
                    logFirebaseEvent('Button_Group-Chat-Action');
                    groupChat = await FFChatManager.instance.createChat(
                      checkboxListTileCheckedItems
                          .map((e) => e.reference)
                          .toList(),
                    );
                    context.pushNamed(
                      'chatUser',
                      queryParams: {
                        'chatRef': serializeParam(
                            groupChat?.reference, ParamType.DocumentReference),
                      }.withoutNulls,
                    );

                    setState(() {});
                  },
                  text: FFLocalizations.of(context).getText(
                    'nbs3sn36' /* Create Chat */,
                  ),
                  options: FFButtonOptions(
                    width: 130,
                    height: 40,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).title3.override(
                          fontFamily: 'Lexend Deca',
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import '../backend/backend.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AddChatUsersWidget extends StatefulWidget {
  const AddChatUsersWidget({
    Key? key,
    this.chat,
  }) : super(key: key);

  final ChatsRecord? chat;

  @override
  _AddChatUsersWidgetState createState() => _AddChatUsersWidgetState();
}

class _AddChatUsersWidgetState extends State<AddChatUsersWidget> {
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
        parameters: {'screen_name': 'addChatUsers'});
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
        title: Text(
          FFLocalizations.of(context).getText(
            '6fte7nvq' /* Invite to Chat */,
          ),
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Lexend Deca',
                color: FlutterFlowTheme.of(context).tertiaryColor,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.group_add_rounded,
              color: FlutterFlowTheme.of(context).tertiaryColor,
              size: 30,
            ),
            onPressed: () async {
              logFirebaseEvent('ADD_CHAT_USERS_group_add_rounded_ICN_ON_');
              logFirebaseEvent('IconButton_Navigate-To');

              context.pushNamed('groupChatPage');
            },
          ),
        ],
        centerTitle: false,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF1F4F8),
      body: Column(
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
                  'wmg3vj2s' /* Search for friends... */,
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
                                      unselectedWidgetColor: Color(0xFF707070),
                                    ),
                                    child: CheckboxListTile(
                                      value: checkboxListTileValueMap[
                                              listViewUsersRecord] ??=
                                          widget.chat!.users!.toList().contains(
                                              listViewUsersRecord.reference),
                                      onChanged: (newValue) => setState(() =>
                                          checkboxListTileValueMap[
                                              listViewUsersRecord] = newValue!),
                                      title: Text(
                                        listViewUsersRecord.displayName!,
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF95A1AC),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      subtitle: Text(
                                        listViewUsersRecord.email!,
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
                                      activeColor: FlutterFlowTheme.of(context)
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
                  logFirebaseEvent('ADD_CHAT_USERS_INVITE_TO_CHAT_BTN_ON_TAP');
                  logFirebaseEvent('Button_Group-Chat-Action');
                  groupChat = await FFChatManager.instance.addGroupMembers(
                    widget.chat!,
                    checkboxListTileCheckedItems
                        .map((e) => e.reference)
                        .toList(),
                  );
                  logFirebaseEvent('Button_Navigate-Back');
                  context.pop();

                  setState(() {});
                },
                text: FFLocalizations.of(context).getText(
                  '7tnvleqj' /* Invite to Chat */,
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
    );
  }
}

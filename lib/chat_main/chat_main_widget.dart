import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/no_messages_widget.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatMainWidget extends StatefulWidget {
  const ChatMainWidget({
    Key? key,
    this.user,
  }) : super(key: key);

  final UsersRecord? user;

  @override
  _ChatMainWidgetState createState() => _ChatMainWidgetState();
}

class _ChatMainWidgetState extends State<ChatMainWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'chatMain'});
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
            'wpkl0pin' /* All Chats */,
          ),
          style: FlutterFlowTheme.of(context).title1.override(
                fontFamily: 'Lexend Deca',
                color: FlutterFlowTheme.of(context).tertiaryColor,
              ),
        ),
        actions: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryDark,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
              child: InkWell(
                onTap: () async {
                  logFirebaseEvent('CHAT_MAIN_PAGE_Icon_wh32x45b_ON_TAP');
                  logFirebaseEvent('Icon_Navigate-To');

                  context.pushNamed(
                    'groupChatPage',
                    queryParams: {
                      'users': serializeParam(widget.user, ParamType.Document),
                    }.withoutNulls,
                    extra: <String, dynamic>{
                      'users': widget.user,
                    },
                  );
                },
                child: Icon(
                  Icons.group_add,
                  color: FlutterFlowTheme.of(context).tertiaryColor,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryDark,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
          child: StreamBuilder<List<ChatsRecord>>(
            stream: queryChatsRecord(
              queryBuilder: (chatsRecord) => chatsRecord
                  .where('users', arrayContains: currentUserReference)
                  .orderBy('last_message_time', descending: true),
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
              List<ChatsRecord> listViewChatsRecordList = snapshot.data!;
              if (listViewChatsRecordList.isEmpty) {
                return Center(
                  child: NoMessagesWidget(),
                );
              }
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: listViewChatsRecordList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewChatsRecord =
                      listViewChatsRecordList[listViewIndex];
                  return StreamBuilder<FFChatInfo>(
                    stream: FFChatManager.instance
                        .getChatInfo(chatRecord: listViewChatsRecord),
                    builder: (context, snapshot) {
                      final chatInfo =
                          snapshot.data ?? FFChatInfo(listViewChatsRecord);
                      return FFChatPreview(
                        onTap: () => context.pushNamed(
                          'chatUser',
                          queryParams: {
                            'chatUser': serializeParam(
                                chatInfo.otherUsers.length == 1
                                    ? chatInfo.otherUsersList.first
                                    : null,
                                ParamType.Document),
                            'chatRef': serializeParam(
                                chatInfo.chatRecord.reference,
                                ParamType.DocumentReference),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            'chatUser': chatInfo.otherUsers.length == 1
                                ? chatInfo.otherUsersList.first
                                : null,
                          },
                        ),
                        lastChatText: chatInfo.chatPreviewMessage(),
                        lastChatTime: listViewChatsRecord.lastMessageTime,
                        seen: listViewChatsRecord.lastMessageSeenBy!
                            .contains(currentUserReference),
                        title: chatInfo.chatPreviewTitle(),
                        userProfilePic: chatInfo.chatPreviewPic(),
                        color: FlutterFlowTheme.of(context).primaryDark,
                        unreadColor: FlutterFlowTheme.of(context).primaryColor,
                        titleTextStyle: GoogleFonts.getFont(
                          'Lexend Deca',
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                        ),
                        dateTextStyle: GoogleFonts.getFont(
                          'Lexend Deca',
                          color: Color(0xFFA4A4A4),
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                        previewTextStyle: GoogleFonts.getFont(
                          'Lexend Deca',
                          color: Color(0xFFA4A4A4),
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(12, 3, 3, 3),
                        borderRadius: BorderRadius.circular(0),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

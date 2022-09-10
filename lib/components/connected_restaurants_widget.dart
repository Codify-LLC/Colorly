import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ConnectedRestaurantsWidget extends StatefulWidget {
  const ConnectedRestaurantsWidget({
    Key? key,
    this.restaurant,
  }) : super(key: key);

  final RestaurantsRecord? restaurant;

  @override
  _ConnectedRestaurantsWidgetState createState() =>
      _ConnectedRestaurantsWidgetState();
}

class _ConnectedRestaurantsWidgetState
    extends State<ConnectedRestaurantsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 5,
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
        child: StreamBuilder<List<RestaurantsRecord>>(
          stream: queryRestaurantsRecord(
            queryBuilder: (restaurantsRecord) => restaurantsRecord
                .where('userConnection', isEqualTo: currentUserReference),
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
            List<RestaurantsRecord> columnRestaurantsRecordList =
                snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: List.generate(columnRestaurantsRecordList.length,
                    (columnIndex) {
                  final columnRestaurantsRecord =
                      columnRestaurantsRecordList[columnIndex];
                  return Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'CONNECTED_RESTAURANTS_Container_1gavegic');
                        logFirebaseEvent('Container_Navigate-To');

                        context.pushNamed(
                          'statsPage',
                          queryParams: {
                            'restaurant': serializeParam(
                                columnRestaurantsRecord, ParamType.Document),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            'restaurant': columnRestaurantsRecord,
                          },
                        );
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(
                                columnRestaurantsRecord.featuredImage!,
                              ).image,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          alignment: AlignmentDirectional(0, 0),
                          child: Stack(
                            alignment: AlignmentDirectional(0, 0),
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: CachedNetworkImage(
                                  imageUrl: valueOrDefault<String>(
                                    columnRestaurantsRecord.featuredImage,
                                    'https://news.vumc.org/wp-content/uploads/Restaurant-iStock_edited-1.jpg',
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 1,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 1,
                                decoration: BoxDecoration(
                                  color: Color(0xD50F0F0F),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              Text(
                                columnRestaurantsRecord.restaurantName!
                                    .maybeHandleOverflow(
                                  maxChars: 20,
                                  replacement: '…',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            );
          },
        ),
      ),
    );
  }
}

import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PurchaseItemWidget extends StatefulWidget {
  const PurchaseItemWidget({
    Key? key,
    this.menuItem,
    this.option1,
    this.restaurant,
  }) : super(key: key);

  final MenuItemRecord? menuItem;
  final Option1Record? option1;
  final RestaurantsRecord? restaurant;

  @override
  _PurchaseItemWidgetState createState() => _PurchaseItemWidgetState();
}

class _PurchaseItemWidgetState extends State<PurchaseItemWidget> {
  PageController? pageViewController;
  int? countControllerValue;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional(0, -1),
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 700,
                      constraints: BoxConstraints(
                        maxHeight: 425,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                      ),
                      child: Builder(
                        builder: (context) {
                          final uploadedPhotos =
                              widget.menuItem!.uploadedPhotos!.toList();
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 1,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 50),
                                  child: PageView.builder(
                                    controller: pageViewController ??=
                                        PageController(
                                            initialPage: min(
                                                0, uploadedPhotos.length - 1)),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: uploadedPhotos.length,
                                    itemBuilder:
                                        (context, uploadedPhotosIndex) {
                                      final uploadedPhotosItem =
                                          uploadedPhotos[uploadedPhotosIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'PURCHASE_ITEM_COMP_Image_ddfe3hgr_ON_TAP');
                                              logFirebaseEvent(
                                                  'Image_Expand-Image');
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType.fade,
                                                  child:
                                                      FlutterFlowExpandedImageView(
                                                    image: Image.network(
                                                      uploadedPhotosItem,
                                                      fit: BoxFit.contain,
                                                    ),
                                                    allowRotation: false,
                                                    tag: uploadedPhotosItem,
                                                    useHeroAnimation: true,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Hero(
                                              tag: uploadedPhotosItem,
                                              transitionOnUserGestures: true,
                                              child: Image.network(
                                                uploadedPhotosItem,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 425,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0.55),
                                  child: SmoothPageIndicator(
                                    controller: pageViewController ??=
                                        PageController(
                                            initialPage: min(
                                                0, uploadedPhotos.length - 1)),
                                    count: uploadedPhotos.length,
                                    axisDirection: Axis.horizontal,
                                    onDotClicked: (i) {
                                      pageViewController!.animateToPage(
                                        i,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                    },
                                    effect: ExpandingDotsEffect(
                                      expansionFactor: 2,
                                      spacing: 8,
                                      radius: 16,
                                      dotWidth: 16,
                                      dotHeight: 16,
                                      dotColor: FlutterFlowTheme.of(context)
                                          .primaryDark,
                                      activeDotColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryColor,
                                      paintStyle: PaintingStyle.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0.85),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 350, 0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: Color(0x770F0F0F),
                                offset: Offset(0, -8),
                                spreadRadius: 1,
                              )
                            ],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          alignment: AlignmentDirectional(0, 1),
                          child: Align(
                            alignment: AlignmentDirectional(0, -0.15),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            widget.menuItem!.itemName!,
                                            style: FlutterFlowTheme.of(context)
                                                .title2
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Color(0xFF090F13),
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    widget.menuItem!.itemDescription!,
                    style: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF8B97A2),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    formatNumber(
                      widget.menuItem!.itemPrice!,
                      formatType: FormatType.decimal,
                      decimalType: DecimalType.periodDecimal,
                      currency: '\$',
                    ),
                    style: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF43642C),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Material(
                  color: Colors.transparent,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
                    width: 120,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Color(0xFF9E9E9E),
                        width: 1,
                      ),
                    ),
                    child: FlutterFlowCountController(
                      decrementIconBuilder: (enabled) => FaIcon(
                        FontAwesomeIcons.minus,
                        color: enabled ? Color(0xDD000000) : Color(0xFFEEEEEE),
                        size: 20,
                      ),
                      incrementIconBuilder: (enabled) => FaIcon(
                        FontAwesomeIcons.plus,
                        color: enabled
                            ? FlutterFlowTheme.of(context).primaryColor
                            : Color(0xFFEEEEEE),
                        size: 20,
                      ),
                      countBuilder: (count) => Text(
                        count.toString(),
                        style: GoogleFonts.getFont(
                          'Roboto',
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      count: countControllerValue ??= 0,
                      updateCount: (count) =>
                          setState(() => countControllerValue = count),
                      stepSize: 1,
                      minimum: 1,
                    ),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: 'Bag It -${valueOrDefault<String>(
                    functions
                        .countPriceQuantity(widget.menuItem!.itemPrice,
                            countControllerValue?.toDouble())
                        .toString(),
                    '1',
                  )}',
                  options: FFButtonOptions(
                    width: 150,
                    height: 54,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Lexend Deca',
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                    elevation: 3,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('PURCHASE_ITEM_COMP__BTN_ON_TAP');
                    logFirebaseEvent('Button_Navigate-To');

                    context.pushNamed(
                      'restaurantDetails',
                      queryParams: {
                        'restaurant': serializeParam(
                            widget.restaurant!.reference,
                            ParamType.DocumentReference),
                        'initialIndex': serializeParam(2, ParamType.int),
                      }.withoutNulls,
                    );
                  },
                  text: FFLocalizations.of(context).getText(
                    'pyf6ey1t' /*  */,
                  ),
                  icon: Icon(
                    Icons.library_add,
                    size: 15,
                  ),
                  options: FFButtonOptions(
                    width: 54,
                    height: 54,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Lexend Deca',
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                    elevation: 3,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

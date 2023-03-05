import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'no_reviews_copy_model.dart';
export 'no_reviews_copy_model.dart';

class NoReviewsCopyWidget extends StatefulWidget {
  const NoReviewsCopyWidget({Key? key}) : super(key: key);

  @override
  _NoReviewsCopyWidgetState createState() => _NoReviewsCopyWidgetState();
}

class _NoReviewsCopyWidgetState extends State<NoReviewsCopyWidget> {
  late NoReviewsCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoReviewsCopyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 375.0,
      height: 400.0,
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  if (Theme.of(context).brightness == Brightness.dark)
                    Image.asset(
                      'assets/images/empty_list_dark_short_vid.gif',
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: 300.0,
                      fit: BoxFit.cover,
                    ),
                  if (Theme.of(context).brightness == Brightness.light)
                    Image.asset(
                      'assets/images/empty_list_light_shirt.gif',
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: 300.0,
                      fit: BoxFit.cover,
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

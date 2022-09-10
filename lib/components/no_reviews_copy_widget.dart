import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class NoReviewsCopyWidget extends StatefulWidget {
  const NoReviewsCopyWidget({Key? key}) : super(key: key);

  @override
  _NoReviewsCopyWidgetState createState() => _NoReviewsCopyWidgetState();
}

class _NoReviewsCopyWidgetState extends State<NoReviewsCopyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 400,
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                'assets/images/Untitled_design_(6).gif',
                width: MediaQuery.of(context).size.width,
                height: 300,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

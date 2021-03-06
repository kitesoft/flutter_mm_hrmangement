import 'package:flutter/material.dart';
import 'package:flutter_mm_hrmangement/components/ProgressHUD.dart';

class LoadingWidget extends StatelessWidget {
  final String message;

  LoadingWidget(this.message);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          ProgressHUD(
            inAsyncCall: true,
            child: Text(
              "$message",
              style: TextStyle(
                color: Colors.blueGrey,
                letterSpacing: 1.2,
                fontFamily: 'Poppins',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

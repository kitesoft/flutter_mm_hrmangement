import 'package:flutter/material.dart';
import 'package:flutter_mm_hrmangement/components/reveal_button.dart';
import 'package:flutter_mm_hrmangement/model/UserModel.dart';
import 'package:flutter_mm_hrmangement/redux/states/app_state.dart';
import 'package:flutter_mm_hrmangement/redux/reducers/app_reducer.dart';
import 'package:flutter_mm_hrmangement/ui/signin_page/components/login_form.dart';
import 'package:flutter_mm_hrmangement/ui/signin_page/components/app_logo.dart';
import 'package:flutter_mm_hrmangement/ui/signin_page/styles.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:redux/redux.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with TickerProviderStateMixin {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        duration: const Duration(microseconds: 500), vsync: this);

    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: buildLoginForm(),
    );
  }

  Widget buildLoginForm() {
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget child) {
          return buildContent();
        });
  }

  Widget buildContent() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                AppLogoWidget(controller: _controller),

                //CircularRevelButton(),


                LoginFormWidget(),
              ],
            ),
          ),
        )
      ],
    );
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

}
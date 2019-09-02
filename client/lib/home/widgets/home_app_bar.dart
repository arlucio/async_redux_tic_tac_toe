import 'package:client/home/widgets/home_app_bar_menu.dart';
import 'package:flutter/material.dart';

AppBar homeAppBar(BuildContext context) {
  var _appBarTextStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.normal);

  return AppBar(
      backgroundColor: Colors.indigo.shade700,
      title: Text(
        'async_redux Tic Tac Toe',
        style: _appBarTextStyle,
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        homeAppBarMenu(context),
      ]);
}

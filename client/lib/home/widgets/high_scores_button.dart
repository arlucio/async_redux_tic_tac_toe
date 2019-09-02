import 'package:client/home/widgets/high_scores_dialog.dart';
import 'package:flutter/material.dart';

Widget highScoresButton(BuildContext context) {
  return ButtonTheme(
    child: RaisedButton(
      elevation: 5.0,
      color: Colors.indigo.shade500,
      onPressed: () => highScoresDialog(context),
      child: Text('CHECK HIGH SCORES', style: TextStyle(color: Colors.indigo.shade50, fontSize: 12.0)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
  );
}

import 'package:client/home/widgets/about_dialog.dart';
import 'package:flutter/material.dart';

PopupMenuButton<String> homeAppBarMenu(BuildContext context) {
  return PopupMenuButton<String>(
      icon: Icon(Icons.more_vert, color: Colors.white),
      itemBuilder: (context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(value: 'About', child: Text('About')),
          ],
      onSelected: (menu) {
        switch (menu) {
          case "About":
            aboutDialog(context);
            break;
        }
      });
}

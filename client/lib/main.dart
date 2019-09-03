import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:business/app/model/app_state.dart';
import 'package:business/services/authentication.dart';
import 'package:business/services/get_it_instance.dart';
import 'package:client/home/home_connector_widget.dart';
import 'package:client/match_making/match_making_connector_widget.dart';
import 'package:client/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'match/match_connector_widget.dart';

/// IMPORTANT: Just when using Android Emulators, depending on the configuration of the emulator, Skia errors may appear on log
/// Still, the app works the same way. Does not happens on iOS.
/// This is a known error: https://github.com/flutter/flutter/issues/33018 . Disabling hardware acceleration on Android Emulator fixes it.

Store<AppState> store;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  NavigateAction.setNavigatorKey(navigatorKey);

  // Configure Firebase app
  final firebaseApp = await FirebaseApp.configure(
    name: 'async-redux-hash-game',
    options: Platform.isIOS
        ? const FirebaseOptions(
            googleAppID: '1:799779703529:ios:db12835ec0112a19',
            databaseURL: 'https://async-redux-hash-game.firebaseio.com',
            apiKey: 'AIzaSyChXMK1FZ8J-0s9xIpK6fdkp4T1KRIbzNg',
            projectID: 'async-redux-hash-game',
          )
        : const FirebaseOptions(
            googleAppID: '1:799779703529:android:f2c4e842f5c5a115',
            apiKey: 'AIzaSyChXMK1FZ8J-0s9xIpK6fdkp4T1KRIbzNg',
            databaseURL: 'https://async-redux-hash-game.firebaseio.com',
            projectID: 'async-redux-hash-game',
          ),
  );

  final fbDatabase = FirebaseDatabase(app: firebaseApp);
  final firestore = Firestore(app: firebaseApp);

  // Register Firestore and Firebase Database to be globally accessible via get it Service Locator
  getIt.registerSingleton<Firestore>(firestore);
  getIt.registerSingleton<FirebaseDatabase>(fbDatabase);

  // Sign in Anonymously and get an user uid from firebase
  var playerID = await signInAnonymously();

  // Start state and run app
  var state = AppState.initialState(playerID);
  store = Store<AppState>(initialState: state);
  runApp(TicTacToeApp());
}

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
            theme: defaultTheme,
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            routes: <String, WidgetBuilder>{
              matchMakingRoute: (context) => MatchMakingConnector(),
              matchRoute: (context) => MatchConnector(),
            },
            home: UserExceptionDialog<AppState>(child: HomeConnector())),
      );
}

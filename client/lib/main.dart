import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:business/app/model/app_state.dart';
import 'package:business/services/authentication.dart';
import 'package:business/services/get_it_instance.dart';
import 'package:client/home/home_connector_widget.dart';
import 'package:client/match_making/match_making_connector_widget.dart';
import 'package:client/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'match/match_connector_widget.dart';

Store<AppState> store;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NavigateAction.setNavigatorKey(navigatorKey);

  FirebaseOptions getFirebasePlatform() {
    if (Platform.isIOS) {
      return const FirebaseOptions(
        apiKey: 'YOUR_API_KEY',
        appId: 'YOUR_APP_ID',
        databaseURL: 'YOUR_DATABASE_URL',
        projectId: 'YOUR_PROJECT_ID',
        messagingSenderId: 'YOUR_MESSAGING_ID',
      );
    } else {
      return const FirebaseOptions(
        apiKey: 'YOUR_API_KEY',
        appId: 'YOUR_APP_ID',
        databaseURL: 'YOUR_DATABASE_URL',
        projectId: 'YOUR_PROJECT_ID',
        messagingSenderId: 'YOUR_MESSAGING_ID',
      );
    }
  }

  FirebaseApp fbApp;
  try {
    fbApp = Firebase.app('async-redux-tic-tac-toe');
  } on Exception {
//    print(e);
    fbApp = await Firebase.initializeApp(name: 'async-redux-tic-tac-toe', options: getFirebasePlatform());
  }

  setupLocator(fbApp);

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
            home: UserExceptionDialog<AppState>(
              child: HomeConnector(),
            )),
      );
}

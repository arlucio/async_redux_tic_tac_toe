import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupLocator(FirebaseApp fbApp) {
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instanceFor(app: fbApp));
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instanceFor(app: fbApp));
  getIt.registerLazySingleton<FirebaseDatabase>(() => FirebaseDatabase(app: fbApp));
}

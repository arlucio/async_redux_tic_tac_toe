import 'package:firebase_auth/firebase_auth.dart';

Future<String> signInAnonymously() async {
  final _auth = FirebaseAuth.instance;
  final user = (await _auth.signInAnonymously()).user;
  assert(user != null);
  assert(user.isAnonymous);
  assert(!user.emailVerified);
  assert(await user.getIdToken() != null);
  final currentUser = _auth.currentUser;
  assert(user.uid == currentUser.uid);
  return currentUser.uid;
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ColorlyAppFirebaseUser {
  ColorlyAppFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

ColorlyAppFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ColorlyAppFirebaseUser> colorlyAppFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<ColorlyAppFirebaseUser>(
            (user) => currentUser = ColorlyAppFirebaseUser(user));

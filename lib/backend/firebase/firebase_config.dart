import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBFbW2zHSsx8jgyWiOR_2guhZ3hOQVwTuk",
            authDomain: "colorly-ff7ef.firebaseapp.com",
            projectId: "colorly-ff7ef",
            storageBucket: "colorly-ff7ef.appspot.com",
            messagingSenderId: "970279790480",
            appId: "1:970279790480:web:0a6993ececb858a09df515",
            measurementId: "G-C6XGTM9KGP"));
  } else {
    await Firebase.initializeApp();
  }
}

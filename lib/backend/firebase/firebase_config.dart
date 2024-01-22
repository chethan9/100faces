import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCrE1R0VlrvdcnqwaErojXQhiVCYK_BrCE",
            authDomain: "hundred-faces-main.firebaseapp.com",
            projectId: "hundred-faces-main",
            storageBucket: "hundred-faces-main.appspot.com",
            messagingSenderId: "994637347768",
            appId: "1:994637347768:web:82d7223a2feebf91a06d4d",
            measurementId: "G-3X9JY6PN51"));
  } else {
    await Firebase.initializeApp();
  }
}

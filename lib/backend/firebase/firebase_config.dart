import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCSpzhP7hXTyhcXSw0XkPRXv0kDjWo2FfY",
            authDomain: "become-94204.firebaseapp.com",
            projectId: "become-94204",
            storageBucket: "become-94204.firebasestorage.app",
            messagingSenderId: "548490423113",
            appId: "1:548490423113:web:e38e947128ea8da4af0898",
            measurementId: "G-XZ7GD1WKNB"));
  } else {
    await Firebase.initializeApp();
  }
}

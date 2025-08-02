import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAuUx_AuXN6QnJoqk4Yn4GWqJ23hFZog5Y",
            authDomain: "sleep-app-4ec19.firebaseapp.com",
            projectId: "sleep-app-4ec19",
            storageBucket: "sleep-app-4ec19.firebasestorage.app",
            messagingSenderId: "516814486915",
            appId: "1:516814486915:web:0c7f6770ebea66a4074ab6",
            measurementId: "G-N8SBTMBW7E"));
  } else {
    await Firebase.initializeApp();
  }
}
